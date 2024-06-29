import 'package:flutter/material.dart';
import 'package:payment_app_flutter/core/style/style.dart';
import 'package:payment_app_flutter/features/payment/widget/credit_card.dart';
import 'package:payment_app_flutter/features/payment/widget/forme_credit.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: StyleApp.indigo,
        title: const Text(
          'Pay with credit card',
          style: TextStyle(color: StyleApp.white),
        ),
      ),
      body: Column(
        children: [
          const CreditCard(),
          FormeCredit(),
        ],
      ),
    );
  }
}
