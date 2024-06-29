import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final creditLogicprvider = ChangeNotifierProvider(
  (ref) => CreditLogic(),
);

class CreditLogic extends ChangeNotifier {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  void setcardNumber(String v) {
    cardNumber = v;
    notifyListeners();
  }

  void setexpiryDate(String v) {
    expiryDate = v;
    notifyListeners();
  }

  void setcardHolderName(String v) {
    cardHolderName = v;
    notifyListeners();
  }

  void setcvvCode(String v) {
    cvvCode = v;
    notifyListeners();
  }

  void setisCvvFocused(bool v) {
    isCvvFocused = v;
    notifyListeners();
  }
}
