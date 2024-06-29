import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_app_flutter/core/style/style.dart';

// ignore: must_be_immutable
class FormeFilde extends StatelessWidget {
  FormeFilde({super.key});
  final formeKey = GlobalKey<FormState>();

  String firstName = '';
  String lastName = '';
  String phoneName = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300.0.h,
      decoration: BoxDecoration(
        boxShadow: const [BoxShadow(offset: Offset(9, 1), blurRadius: 50)],
        color: StyleApp.white.withOpacity(0.95),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      child: Form(
        key: formeKey,
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
              TextFormField(
                autofocus: true,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: StyleApp.gray.withOpacity(0.3),
                  border: InputBorder.none,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: StyleApp.indigo, width: 5.0),
                  ),
                  labelText: 'First Name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'يرجى إدخال الاسم';
                  }
                  return null;
                },
                onSaved: (value) {
                  firstName = value!;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: StyleApp.gray.withOpacity(0.3),
                  border: InputBorder.none,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: StyleApp.indigo, width: 5.0),
                  ),
                  labelText: 'Last Name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'يرجى إدخال الاسم';
                  }
                  return null;
                },
                onSaved: (value) {
                  lastName = value!;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: StyleApp.gray.withOpacity(0.3),
                  border: InputBorder.none,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: StyleApp.indigo, width: 5.0),
                  ),
                  labelText: 'Phone',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'يرجى إدخال رقم الهاتف';
                  }
                  return null;
                },
                onSaved: (value) {
                  phoneName = value!;
                },
              ),
              SizedBox(
                height: 40.0.h,
                width: double.infinity.w,
                child: SignInButton(
                  elevation: 10.0,
                  Buttons.GoogleDark,
                  onPressed: () {
                    context.go('/Store');
                  },
                ),
              ),
              SizedBox(
                height: 40.0.h,
                width: double.infinity.w,
                child: SignInButton(
                  elevation: 10.0,
                  Buttons.Email,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
