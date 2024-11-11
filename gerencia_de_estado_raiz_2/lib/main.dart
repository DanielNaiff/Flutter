import 'package:flutter/material.dart';
import 'package:gerencia_de_estado_raiz_2/home_page.dart';

void main() {
  runApp(const MyApp()); // Substitua o HomePage por MyApp aqui
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon App', // Título do aplicativo
      theme: ThemeData(
        primarySwatch: Colors.blue, // Defina a cor do tema
      ),
      home: HomePage(), // Defina o HomePage como a tela inicial
    );
  }
}
