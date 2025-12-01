import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/cliker_provider.dart';
import 'views/cliker_views.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ClikerProvider(),
      child: MaterialApp(
        title: 'Flutter Clicker Game',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // Uso de la paleta de colores Indigo para un look moderno
          primarySwatch: Colors.indigo,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ClikerPage(),
      ),
    ),
  );
}
