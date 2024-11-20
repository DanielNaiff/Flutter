import 'package:flutter/material.dart';
import 'package:gerencia_de_estado_raiz_1/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = HomeController.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Text("Flutterando ${controller?.value}"),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            controller?.increment();
          }),
    );
  }
}
