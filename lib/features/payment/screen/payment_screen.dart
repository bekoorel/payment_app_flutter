import 'package:flutter/material.dart';
import 'package:payment_app_flutter/core/style/style.dart';
import 'package:payment_app_flutter/core/widgets/text_widget.dart';
import 'package:payment_app_flutter/features/payment/widget/forme_credit.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: StyleApp.indigo,
        title: TextWidget.textGray15(
          'Pay with credit card',
        ),
      ),
      body: Column(
        children: [
     
          FormeCredit(),
        ],
      ),
    );
  }
}
