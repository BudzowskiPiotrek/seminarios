import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClikerProvider extends ChangeNotifier {
  double _puntuacion = 0.0;
  int _nivelMejora = 0;
  int _nivelMejoraClick = 0;
  int _ultimoCierre = DateTime.now().millisecondsSinceEpoch;
  double _multiClick = 1.0;
  double _puntosPorSegundo = 0.0;

  final double _valorBaseClick = 1.0;
  final double _multiBonus = 1.0;
  final int _costoBaseMejora = 10;


  String _mensaje = '';
  Timer? _temporizador;


  final int _costoBaseMejoraClick = 15;


  // Getters
  double get puntos => _puntuacion;
  int get upgradeLevel => _nivelMejora;
  double get puntosPorSegundo => _puntosPorSegundo;


  double get clickValor =>
      _valorBaseClick * _multiBonus * _multiClick;

  int get sigCosteMejora =>
      (_costoBaseMejora * pow(1.5, _nivelMejora)).round();

  String get offlineMensaje => _mensaje;


  int get clickUpgradeLevel => _nivelMejoraClick;

  double get clickMultiplicador => _multiClick;

  int get sigCosteMejoraClick =>
      (_costoBaseMejoraClick * pow(1.6, _nivelMejoraClick)).round();

  ClikerProvider() {
    _iniciar();
  }

  // Inicio
  Future<void> _iniciar() async {
    await _cargar();
    _iniciarAuto();
    notifyListeners();
  }

  // Guardar datos
  Future<void> _guarda() async {
    final preferencias = await SharedPreferences.getInstance();
    preferencias.setDouble('puntuacion', _puntuacion);
    preferencias.setInt('nivelMejora', _nivelMejora);
    preferencias.setInt(
        'ultimoCierreTiempo', DateTime.now().millisecondsSinceEpoch);

    preferencias.setInt('nivelMejoraClick', _nivelMejoraClick);
    preferencias.setDouble(
        'multiplicadorClickExtra', _multiClick);
  }

  // Cargar datos
  Future<void> _cargar() async {
    final preferencias = await SharedPreferences.getInstance();
    _puntuacion = preferencias.getDouble('puntuacion') ?? 0.0;
    _nivelMejora = preferencias.getInt('nivelMejora') ?? 0;
    _ultimoCierre = preferencias.getInt('ultimoCierreTiempo') ??
        DateTime.now().millisecondsSinceEpoch;
    _nivelMejoraClick = preferencias.getInt('nivelMejoraClick') ?? 0;
    _multiClick =
        preferencias.getDouble('multiplicadorClickExtra') ?? 1.0;
    _recalcular();
    _calcularCuandoNoEstas();
  }

  // Ganancias offline
  void _calcularCuandoNoEstas() {
    final tiempoActual = DateTime.now().millisecondsSinceEpoch;
    final tiempoDiferenciaMs = tiempoActual - _ultimoCierre;
    final tiempoDiferenciaSegundos = tiempoDiferenciaMs / 1000;

    if (_puntosPorSegundo > 0 && tiempoDiferenciaSegundos > 5) {
      final puntosGanados = _puntosPorSegundo * tiempoDiferenciaSegundos;
      _puntuacion += puntosGanados;
      _mensaje =
      '¡Ganaste ${puntosGanados.toStringAsFixed(2)} puntos offline (${tiempoDiferenciaSegundos.round()}s)!';
      _guarda();
    } else {
      _mensaje = '';
    }
  }

  // Recalcular PPS
  void _recalcular() {
    _puntosPorSegundo =
        _nivelMejora * (_valorBaseClick * _multiBonus) * 0.5;
  }

  // Click
  void click() {
    _puntuacion += clickValor;
    _guarda();
    notifyListeners();
  }

  // Compra de mejoras
  void compraMejora() {
    final costo = sigCosteMejora;

    if (_puntuacion >= costo) {
      _puntuacion -= costo;
      _nivelMejora++;
      _recalcular();
      _guarda();
      notifyListeners();
    }
  }

  // Compra de mejoras del CLIC
  void compraMejoraClick() {
    final costo = sigCosteMejoraClick;
    if (_puntuacion >= costo) {
      _puntuacion -= costo;
      _nivelMejoraClick++;
      _multiClick = 1 + (_multiClick * 1.10);

      _guarda();
      notifyListeners();
    }
  }

  // Generación automática
  void _iniciarAuto() {
    _temporizador?.cancel();
    _temporizador = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (_puntosPorSegundo > 0) {
        _puntuacion += _puntosPorSegundo / 10;
        notifyListeners();
      }
    });
  }

  // Reinicio
  void resetGame() {
    _puntuacion = 0.0;
    _nivelMejora = 0;
    _puntosPorSegundo = 0.0;
    _mensaje = 'Juego reiniciado.';
    _nivelMejoraClick = 0;
    _multiClick = 1.0;
    _ultimoCierre = DateTime.now().millisecondsSinceEpoch;
    _recalcular();
    _guarda();
    notifyListeners();
  }

  @override
  void dispose() {
    _temporizador?.cancel();
    _guarda();
    super.dispose();
  }
}
