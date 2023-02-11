import 'dart:async';

import 'package:flutter/material.dart';
import 'package:notes_app_prototype/app/repository/remote/supabase_config.dart';
import 'package:notes_app_prototype/app/style/colors.dart';
import 'package:notes_app_prototype/app/utils/regex_validator.dart';
import 'package:notes_app_prototype/app/widget/form_widget.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late final StreamSubscription<AuthState> _authStateSubscription;
  late final _phoneController = TextEditingController();
  late final _otpController = TextEditingController();
  FocusNode appFocusNode = FocusNode();
  bool disableButton = false;

  @override
  void initState() {
    super.initState();

    _otpController.addListener(() {
      setState(() {
        disableButton = _otpController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _otpController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: greenGradient,
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 50, right: 175),
                child: Text(
                  style: Theme.of(context).textTheme.displayLarge,
                  'Notul App',
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(left: 175, top: 100),
                child: Image.asset(
                  "assets/images/sign_in.png",
                  width: double.infinity,
                  height: 150,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 250),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 250),
                child: Column(
                  children: [
                   Padding(
                      padding: const EdgeInsets.only(left: 20, top: 30, right: 20),
                      child: Text(
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.displayMedium,
                        'Sign In using your mobile number',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: buildPhoneForm(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: buildOtpForm(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          fixedSize: const Size(200, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          style: Theme.of(context).textTheme.labelLarge,
                          'Request OTP',
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          fixedSize: const Size(200, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: disableButton ? () => signIn : null,
                        child: Text(
                          style: Theme.of(context).textTheme.labelLarge,
                          'Sign In',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPhoneForm() => FormWidget(
        controller: _phoneController,
        keyBoardType: TextInputType.phone,
        hintText: 'Add your country code number eg. +62',
        labelText: 'Phone',
        labelStyle: TextStyle(
            color: appFocusNode.hasFocus ? Colors.blue : Colors.black12),
        validator: (text) {
          if (text != null && !validPhone.hasMatch(text)) {
            return msgInvalidPhone;
          } else if (text == null) {
            return msgEmpty;
          } else {}
          return null;
        },
      );

  Widget buildOtpForm() => FormWidget(
        controller: _otpController,
        keyBoardType: TextInputType.number,
        hintText: 'Enter your OTP code',
        labelText: 'OTP Code',
        labelStyle: TextStyle(
            color: appFocusNode.hasFocus ? Colors.blue : Colors.black12),
        validator: (text) {
          if (text != null && text.length < 6){
            return msgMinInput;
          } else if (text == null) {
            return msgEmpty;
          } else {}
          return null;
        },
      );

  signIn() {
    // do something
  }
}
