import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_app_flutter/core/Dependencies/get_it.dart';
import 'package:payment_app_flutter/core/widgets/text_forme_fild_widget.dart';
import 'package:payment_app_flutter/features/payment/logic/credit_logic.dart';
import 'package:payment_app_flutter/features/payment/logic/payment_processing.dart';

class FormeCredit extends StatelessWidget {
  FormeCredit({super.key});
  final formeKey = GlobalKey<FormState>();
  final formeData = getIt<CreditLogic>();
  final amount = getIt<PayUsingIfreme>();
  final startProsessData = getIt<PayUsingIfreme>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formeKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormeFildWidget.textFormeFildWidget(
                formeData.firstName, 'firstName'),
            TextFormeFildWidget.textFormeFildWidget(
                formeData.lastName, 'lastName'),
            TextFormeFildWidget.textFormeFildWidget(
                formeData.phoneNumber, 'phoneNumber'),
            TextFormeFildWidget.textFormeFildWidget(formeData.email, 'email'),
            TextFormeFildWidget.textFormeFildWidget(
                formeData.country, 'country'),
            TextFormeFildWidget.textFormeFildWidget(formeData.city, 'city'),
            TextFormeFildWidget.textFormeFildWidget(formeData.street, 'street'),
            TextFormeFildWidget.textFormeFildWidget(
                formeData.building, 'building'),
            TextFormeFildWidget.textFormeFildWidget(
                formeData.apartment, 'apartment'),
            TextFormeFildWidget.textFormeFildWidget(
                formeData.postalCode, 'postalCode'),
            ElevatedButton(
              onPressed: () async {
                await startProsessData.getUrlIfreme();
                
                // ignore: use_build_context_synchronously
                context.go('/WebView');
              },
              child: const Text('Confirm Bayment'),
            ),
          ],
        ),
      ),
    );
  }
}
