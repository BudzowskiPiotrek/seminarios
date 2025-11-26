
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/cliker_provider.dart';
import 'views/cliker_views.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ClikerProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ClikerPage(),
      ),
    ),
  );
}
