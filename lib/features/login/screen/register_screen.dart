import 'package:flutter/material.dart';
import 'package:payment_app_flutter/features/login/widget/register_button.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Image(
                // fit: BoxFit.fill,
                image: AssetImage('assets/reg.jpg'),
              ),
            ),
          ),
          RegisterButton(),
        ],
      ),
    );
  }
}
