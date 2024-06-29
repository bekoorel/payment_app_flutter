import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final logicCartProvider = ChangeNotifierProvider(
  (ref) => LogicCart(),
);

class LogicCart extends ChangeNotifier {
  List<Map<String, String>> items = [];
  deletItme(int index) {
    items.removeAt(index);
    notifyListeners();
  }

  void setItem(String name, String price, String imageUrl) {
    Map<String, String> item = {
      'name': name,
      'price': price,
      'imageUrl': imageUrl,
    };
    items.add(item);
  }

  double getTotalPrice() {
    return items.fold(0.0, (sum, item) {
      double price = double.tryParse(item['price']!) ?? 0.0;
      return sum + price;
    });
  }
}
