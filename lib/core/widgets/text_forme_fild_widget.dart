import 'package:flutter/material.dart';
import 'package:payment_app_flutter/core/style/style.dart';

class TextFormeFildWidget {
 static Widget textFormeFildWidget(String data, String label) {
    return TextFormField(
      onChanged: (value) => data = value,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        filled: true,
        fillColor: StyleApp.gray.withOpacity(0.3),
        border: InputBorder.none,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(),
        ),
        labelText: label,
      ),
    );
  }
}
