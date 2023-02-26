import 'dart:async';

import 'package:flutter/material.dart';
import 'package:notes_app_prototype/app/repository/remote/supabase_config.dart';
import 'package:notes_app_prototype/app/style/colors.dart';
import 'package:notes_app_prototype/app/utils/regex_validator.dart';
import 'package:notes_app_prototype/app/widget/button_widget.dart';
import 'package:notes_app_prototype/app/widget/form_widget.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late final _phoneController = TextEditingController();
  late final _otpController = TextEditingController();
  FocusNode appFocusNode = FocusNode();
  bool disableReqOtpButton = true;
  bool disableSignInButton = false;
  static const _timerDuration = 60;
  final StreamController _timerStream = StreamController<int>();
  int? timerCounter;
  late Timer _resendCodeTimer;

  @override
  void initState() {
    super.initState();

    _otpController.addListener(() {
      setState(() {
        disableSignInButton = _otpController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _otpController.dispose();
    _timerStream.close();
    _resendCodeTimer.cancel();
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
          children: <Widget>[
            /// App Title
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
            /// Sign In Image
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(left: 175, top: 100),
                child: Image.asset(
                  'assets/images/sign_in.png',
                  width: double.infinity,
                  height: 150,
                ),
              ),
            ),
            /// White Layer
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
            /// Page Title
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 250),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, top: 30, right: 20),
                      child: Text(
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.displayMedium,
                        'Sign In using your mobile number',
                      ),
                    ),
                    /// Phone Number Form
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: buildPhoneForm(),
                    ),
                    /// OTP Code Form
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: buildOtpForm(),
                    ),
                    /// Request OTP Button
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: StreamBuilder(
                        stream: _timerStream.stream,
                        builder: (BuildContext context, AsyncSnapshot snapshot) {
                          return ButtonWidget(
                            onPressed: disableReqOtpButton || snapshot.data == 0
                                ? () {
                                    setState(() {
                                      disableReqOtpButton = false;
                                    });
                                    //SupabaseConfig.supabaseClient.auth.signInWithOtp(phone: _phoneController.text);
                                    _timerStream.sink.add(60);
                                    activeCounter();
                                  }
                                : null,
                            child: disableReqOtpButton || snapshot.data == 0
                                ? const Text('Request OTP Code')
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                          'Resend Code In ${snapshot.hasData ? snapshot.data.toString() : 60} seconds'),
                                    ],
                                  ),
                          );
                        },
                      ),
                    ),
                    /// Sign In Button
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: ButtonWidget(
                        onPressed: disableSignInButton ? () => signIn : null,
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

  /// Phone Number Form Widget
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
  /// OTP Code Form Widget
  Widget buildOtpForm() => FormWidget(
        controller: _otpController,
        keyBoardType: TextInputType.number,
        hintText: 'Enter your OTP code',
        labelText: 'OTP Code',
        labelStyle: TextStyle(
            color: appFocusNode.hasFocus ? Colors.blue : Colors.black12),
        validator: (text) {
          if (text != null && text.length < 6) {
            return msgMinInput;
          } else if (text == null) {
            return msgEmpty;
          } else {}
          return null;
        },
      );
  /// Timer Function
  activeCounter() {
    _resendCodeTimer =
        Timer.periodic(const Duration(seconds: 1), (Timer timer) {
          if (_timerDuration - timer.tick > 0) {
            _timerStream.sink.add(_timerDuration - timer.tick);
          } else {
            _timerStream.sink.add(0);
            _resendCodeTimer.cancel();
          }
        });
  }

  signIn() {}
}
