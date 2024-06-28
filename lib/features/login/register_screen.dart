import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40.0,
            child: SignInButton(
              elevation: 10.0,
              Buttons.GoogleDark,
              onPressed: () {},
            ),
          ),
          SizedBox(
            height: 40.0,
            child: SignInButton(
              elevation: 10.0,
              Buttons.Email,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
