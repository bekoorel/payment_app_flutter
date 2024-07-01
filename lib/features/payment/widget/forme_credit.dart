import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_app_flutter/core/Dependencies/get_it.dart';
import 'package:payment_app_flutter/core/network/payment_web/payment_api.dart';
import 'package:payment_app_flutter/core/style/style.dart';
import 'package:payment_app_flutter/features/payment/logic/credit_logic.dart';

class FormeCredit extends StatelessWidget {
  FormeCredit({super.key});
  final formeKey = GlobalKey<FormState>();
  final api = getIt<PaymentApi>();
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) => Form(
        key: formeKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                maxLength: 16,
                onTap: () =>
                    ref.read(creditLogicprvider).setisCvvFocused(false),
                onChanged: (value) =>
                    ref.read(creditLogicprvider).setcardNumber(value),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: StyleApp.gray.withOpacity(0.3),
                  border: InputBorder.none,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                  labelText: 'Card Number',
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: TextFormField(
                      maxLength: 4,
                      onTap: () =>
                          ref.read(creditLogicprvider).setisCvvFocused(false),
                      onChanged: (value) =>
                          ref.read(creditLogicprvider).setexpiryDate(value),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: StyleApp.gray.withOpacity(0.3),
                        border: InputBorder.none,
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        labelText: 'Expiry Date',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Expanded(
                    child: TextFormField(
                      maxLength: 3,
                      onTap: () =>
                          ref.read(creditLogicprvider).setisCvvFocused(true),
                      onChanged: (value) =>
                          ref.read(creditLogicprvider).setcvvCode(value),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: StyleApp.gray.withOpacity(0.3),
                        border: InputBorder.none,
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        labelText: 'Cvv',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              TextFormField(
                onTap: () =>
                    ref.read(creditLogicprvider).setisCvvFocused(false),
                onChanged: (value) =>
                    ref.read(creditLogicprvider).setcardHolderName(value),
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: StyleApp.gray.withOpacity(0.3),
                  border: InputBorder.none,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                  labelText: 'Your Name',
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              ElevatedButton(
                onPressed: () async {
                  await api.handelTokens('100');
                  // context.go('/WebView');
                },
                child: const Text('Confirm Bayment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
