import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_app_flutter/core/network/communication/connection.dart';
import 'package:payment_app_flutter/core/style/style.dart';
import 'package:payment_app_flutter/features/login/logic/google_login.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(context) {
    return Container(
      width: double.infinity,
      height: 200.0.h,
      decoration: BoxDecoration(
        boxShadow: const [BoxShadow(offset: Offset(9, 1), blurRadius: 50)],
        color: StyleApp.white.withOpacity(0.95),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: ', we are waiting for you, so register now',
                    style: TextStyle(
                        color: StyleApp.gray,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.normal),
                  )
                ],
                text: 'Welcome',
                style: TextStyle(
                    color: StyleApp.indigo,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 40.0.h,
              width: double.infinity.w,
              child: SignInButton(
                elevation: 10.0,
                Buttons.GoogleDark,
                onPressed: () async {
                  if (await CommunicationsCheck.checkIntrnet(context)) {
                    final isLoged = await GoogleLogin.signInWithGoogle();
                    if (isLoged != null) {
                      context.go('/Store');
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
