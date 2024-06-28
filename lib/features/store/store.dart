import 'package:flutter/material.dart';
import 'package:payment_app_flutter/core/style/style.dart';
import 'package:payment_app_flutter/core/widgets/list_prodact.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: StyleApp.indigo,
        elevation: 10.0,
        title: const Text(
          'Tigreal Store',
          style: TextStyle(color: StyleApp.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListProdact(),
    );
  }
}
