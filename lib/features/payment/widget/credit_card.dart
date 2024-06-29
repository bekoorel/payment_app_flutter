import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:payment_app_flutter/features/payment/logic/credit_logic.dart';

class CreditCard extends StatelessWidget {
  const CreditCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) => CreditCardWidget(
        isHolderNameVisible: true,
        cardBgColor: Colors.black,
        cardNumber: ref.watch(creditLogicprvider).cardNumber,
        expiryDate: ref.watch(creditLogicprvider).expiryDate,
        cardHolderName: ref.watch(creditLogicprvider).cardHolderName,
        cvvCode: ref.watch(creditLogicprvider).cvvCode,
        showBackView: ref
            .watch(creditLogicprvider)
            .isCvvFocused, //true when you want to show cvv(back) view
        onCreditCardWidgetChange: (CreditCardBrand
            brand) {}, // Callback for anytime credit card brand is changed
      ),
    );
  }
}
