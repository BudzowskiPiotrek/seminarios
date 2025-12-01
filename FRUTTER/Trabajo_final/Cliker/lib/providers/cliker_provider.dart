import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClikerProvider extends ChangeNotifier {
  double _puntuacion = 0.0;
  int _nivelMejora = 0;
  double _puntosPorSegundo = 0.0;
  final double _valorBaseClick = 1.0;
  final double _multiplicadorBonus = 1.0;
  final int _costoBaseMejora = 10;
  int _ultimoCierreTimestamp = DateTime.now().millisecondsSinceEpoch;

  String _mensajeOffline = '';
  Timer? _temporizador;

  double get puntos => _puntuacion;

  int get upgradeLevel => _nivelMejora;

  double get puntosPorSegundo => _puntosPorSegundo;

  double get clickValor => _valorBaseClick * _multiplicadorBonus;

  int get sigCosteMejora => (_costoBaseMejora * pow(1.5, _nivelMejora)).round();

  String get offlineMensaje => _mensajeOffline;

  ClikerProvider() {
    _iniciarDatos();
  }

  //--------------------------------------------------**//----------------
  Future<void> _iniciarDatos() async {
    await _cargarDatos(); // Carga los datos guardados
    _iniciarGeneracionAuto(); // Inicia el temporizador
    notifyListeners(); // Actualiza la UI con los datos cargados/calculados
  }

  // MÉTODOS DE GUARDADO Y CARGA DE DATOS
  //--------------------------------------------------**//----------------
  Future<void> _guardarDatos() async {
    final preferencias = await SharedPreferences.getInstance();

    preferencias.setDouble('puntuacion', _puntuacion);
    preferencias.setInt('nivelMejora', _nivelMejora);
    _ultimoCierreTimestamp = DateTime.now().millisecondsSinceEpoch;
    preferencias.setInt('ultimoCierreTiempo', _ultimoCierreTimestamp);
  }

  Future<void> _cargarDatos() async {
    final preferencias = await SharedPreferences.getInstance();

    _puntuacion = preferencias.getDouble('puntuacion') ?? 0.0;
    _nivelMejora = preferencias.getInt('nivelMejora') ?? 0;
    _ultimoCierreTimestamp =
        preferencias.getInt('ultimoCierreTiempo') ??
        DateTime.now().millisecondsSinceEpoch;
    _recalcularEstadisticas();
    _calcularGananciasOffline();
  }

  // METODO QUE CALCULA LAS GANANCIAS CUANDO NO ESTAS
  //--------------------------------------------------**//----------------
  void _calcularGananciasOffline() {
    final tiempoActual = DateTime.now().millisecondsSinceEpoch;
    final tiempoDiferenciaMs = tiempoActual - _ultimoCierreTimestamp;
    final tiempoDiferenciaSegundos = tiempoDiferenciaMs / 1000;

    if (_puntosPorSegundo > 0 && tiempoDiferenciaSegundos > 5) {
      final puntosGanados = _puntosPorSegundo * tiempoDiferenciaSegundos;
      _puntuacion += puntosGanados;
      _mensajeOffline =
          '¡Ganaste ${puntosGanados.toStringAsFixed(2)} puntos offline (${tiempoDiferenciaSegundos.round()}s)!';
      _guardarDatos();
    } else {
      _mensajeOffline = '';
    }
  }

  // --- Lógica de Juego ---
  //--------------------------------------------------**//----------------
  void _recalcularEstadisticas() {
    _puntosPorSegundo =
        _nivelMejora * (_valorBaseClick * _multiplicadorBonus) * 0.5;
  }

  void click() {
    _puntuacion += clickValor;
    _guardarDatos();
    notifyListeners();
  }

  void compraMejora() {
    final costo = sigCosteMejora;
    if (_puntuacion >= costo) {
      _puntuacion -= costo;
      _nivelMejora++;
      _recalcularEstadisticas();
      _guardarDatos();
      notifyListeners();
    } else {

      print('Puntos insuficientes');
    }
  }

  // Inicia el temporizador para la generación automática de puntos
  void _iniciarGeneracionAuto() {
    _temporizador?.cancel();
    // Añade puntos 10 veces por segundo para una actualización fluida en la UI
    _temporizador = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (_puntosPorSegundo > 0) {
        _puntuacion += _puntosPorSegundo / 10;
        // Solo notificamos cambios, evitamos guardar en cada tick para optimizar
        notifyListeners();
      }
    });
  }

  // 4. Reinicio
  void resetGame() {
    _puntuacion = 0.0;
    _nivelMejora = 0;
    _puntosPorSegundo = 0.0;
    _mensajeOffline = 'Juego reiniciado.';
    _ultimoCierreTimestamp = DateTime.now().millisecondsSinceEpoch;
    _recalcularEstadisticas();
    _guardarDatos(); // Guardar el estado de reinicio
    notifyListeners();
  }

  @override
  void dispose() {
    _temporizador?.cancel();
    _guardarDatos(); // Guardar el último estado antes de que se destruya el proveedor
    super.dispose();
  }
}
