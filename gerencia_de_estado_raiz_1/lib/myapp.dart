import 'package:flutter/material.dart';
import 'package:gerencia_de_estado_raiz_1/home_controller.dart';
import 'package:gerencia_de_estado_raiz_1/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeController(child: HomePage()),
    );
  }
}
