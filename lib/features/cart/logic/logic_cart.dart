import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final logicCartProvider = ChangeNotifierProvider(
  (ref) => LogicCart(),
);

class LogicCart extends ChangeNotifier {
  List<Map<String, String>> items = [];
  String counte = '';
  String total = '';

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

  getTotalPriceAndCounts() {
    List<double> prices = [];
    for (Map i in items) {
      double price = double.parse(i['price']);
      prices.add(price);
    }
    counte = prices.length.toString();
    total = prices.reduce((a, b) => a + b).toString();
    notifyListeners();
  }
}
