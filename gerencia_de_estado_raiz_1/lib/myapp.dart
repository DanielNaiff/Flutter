import 'package:flutter/material.dart';
import 'package:peleguard_web/home_controller.dart';
import 'package:peleguard_web/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeController(child: HomePage()),
    );
  }
}
