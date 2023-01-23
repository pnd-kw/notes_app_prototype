import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app_prototype/app/utils/regex_validator.dart';
import 'package:notes_app_prototype/app/widget/form_widget.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _phoneController = TextEditingController();
  final _otpController = TextEditingController();
  FocusNode appFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: <Color>[
              Color(0xff008631),
              Color(0xff00c04b),
              Color(0xff39e75f),
            ],
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 50, right: 175),
                child: Text(
                  style: GoogleFonts.kanit(
                    fontSize: 28,
                    color: Colors.white,
                  ),
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
                        style: GoogleFonts.kanit(
                          fontSize: 22,
                          color: Colors.black87,
                        ),
                        'Sign In using your mobile number',
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 1,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                style: GoogleFonts.kanit(
                                  fontSize: 22,
                                  color: Colors.black,
                                ),
                                '+62',
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: buildPhoneForm(),
                          ),
                        ),
                      ],
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
                          style: GoogleFonts.kanit(
                            fontSize: 16,
                          ),
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
                        child: Text(
                          style: GoogleFonts.kanit(
                            fontSize: 16,
                          ),
                          'Sign In',
                        ),
                        onPressed: () {},
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
        hintText: 'Please enter your phone number',
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
        hintText: 'Enter the OTP Code',
        labelText: 'OTP Code',
        labelStyle: TextStyle(
            color: appFocusNode.hasFocus ? Colors.blue : Colors.black12),
        validator: (text) {
          if (text == null) {
            return msgEmpty;
          } else {}
          return null;
        },
      );
}
