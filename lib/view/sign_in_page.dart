import 'package:flutter/material.dart';
import 'package:notes_app_prototype/app/utils/regex_validator.dart';
import 'package:notes_app_prototype/app/widget/form_widget.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _phoneController = TextEditingController();
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
                padding: const EdgeInsets.only(top: 250),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                      topRight: Radius.circular(100),
                    ),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, top: 350, right: 30),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: buildPhoneForm(),
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
            color: appFocusNode.hasFocus ? Colors.blue : Colors.green),
        validator: (text) {
          if (text != null && !validPhone.hasMatch(text)) {
            return msgInvalidPhone;
          } else if (text == null) {
            return msgEmpty;
          } else {}
          return null;
        },
      );
}
