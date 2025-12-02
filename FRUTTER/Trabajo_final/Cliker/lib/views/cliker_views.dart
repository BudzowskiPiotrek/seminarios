import 'package:flutter/material.dart';
import "package:provider/provider.dart";
import '../providers/cliker_provider.dart';

class ClikerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('La Odisea de Clics de Cristóbal')),
      body: Consumer<ClikerProvider>(
        builder: (context, provider, child) {
          return Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  if (provider.offlineMensaje.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        'Informacion Papu: ${provider.offlineMensaje}',
                      ),
                    ),
                  // Puntos Actuales
                  Text(
                    'Papu Puntos: ${provider.puntos.toStringAsFixed(2)}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),

                  // Puntos por Segundo
                  Text(
                    'MultiPapuador: ${provider.puntosPorSegundo.toStringAsFixed(2)}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18),
                  ),
                  // La fotaca
                  const SizedBox(height: 20),
                  Image.asset(
                    'assets/mi_foto.png',
                    height: 150, //
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 20),

                  // 1. Botón principal: ElevatedButton por defecto
                  ElevatedButton(
                    onPressed: provider.click,
                    // Texto sin negritas, sin iconos, sin colores especiales
                    child: Text(
                      'Clickea por tu gloria (+${provider.clickValor.toStringAsFixed(1)})',
                    ),
                  ),

                  const SizedBox(height: 20),

                  // --- Panel de Mejoras ---
                  const Text(
                    'Mejora del Click',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Divider(),

                  Text('Nivel Actual: ${provider.clickUpgradeLevel}'),
                  Text(
                    'Multiplicador: x${provider.clickMultiplicador.toStringAsFixed(2)}',
                  ),
                  Text('Costo: ${provider.sigCosteMejoraClick} PapuPuntos'),

                  const SizedBox(height: 10),

                  ElevatedButton(
                    onPressed: provider.puntos >= provider.sigCosteMejoraClick
                        ? provider.compraMejoraClick
                        : null,
                    child: Text(
                      'Comprar Mejora Click (Nivel ${provider.clickUpgradeLevel + 1})',
                    ),
                  ),

                  if (provider.puntos < provider.sigCosteMejoraClick)
                    const Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Text(
                        'Puntos insuficientes para comprar.',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),

                  const Text(
                    'Mejoras Automáticas',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Divider(),
                  Text('Nivel Actual: ${provider.upgradeLevel}'),
                  Text('Costo: ${provider.sigCosteMejora} PapuPuntos'),

                  const SizedBox(height: 10),

                  // 2. Botón de Compra de Mejoras
                  ElevatedButton(
                    // Llama al método en español
                    onPressed: provider.puntos >= provider.sigCosteMejora
                        ? provider.compraMejora
                        : null,
                    child: Text(
                      'Comprar Mejora (Nivel ${provider.upgradeLevel + 1})',
                    ),
                  ),

                  if (provider.puntos < provider.sigCosteMejora)
                    const Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Text(
                        'Puntos insuficientes para comprar.',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),

                  const SizedBox(height: 30),

                  // 4. Botón de Reinicio
                  OutlinedButton(
                    onPressed: () {
                      // Diálogo de confirmación simple (requerido para no usar alert)
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Confirmar Reinicio'),
                            content: const Text('¿Deseas reiniciar el juego?'),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('NO'),
                                onPressed: () => Navigator.of(context).pop(),
                              ),
                              TextButton(
                                child: const Text('SÍ'),
                                onPressed: () {
                                  provider.resetGame();
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Text('Reiniciar Todo'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
