import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:notes_app_prototype/app/utils/regex_validator.dart';
import 'package:notes_app_prototype/app/widget/form_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PreparationPage extends StatefulWidget {
  const PreparationPage({super.key});

  @override
  State<PreparationPage> createState() => _PreparationPageState();
}

class _PreparationPageState extends State<PreparationPage> {
  final controller = PageController();
  bool _onEditing = true;
  String? _code;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: const EdgeInsets.only(bottom: 80),
          child: PageView(
            controller: controller,
            children: [
              Center(
                child: buildNameForm(),
              ),
              Center(
                child: buildPhoneForm(),
              ),
              Center(
                child: buildVerification(),
              ),
            ],
          ),
        ),
        bottomSheet: Container(
            padding: const EdgeInsets.symmetric(horizontal: 1),
            height: 80,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
            TextButton(
    Center(
    child: SmoothPageIndicator(
    controller: controller,olor: Colors.transparent,
    activeDotColor: Colors.green,
    ),
    ),
    ),
    TextButton(
    child: const Text('NEXT'),
    onPressed: () => controller.nextPage(
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeInOut,
    ),
    ),
    ],
    ),
    )
    ,
    );
  }

  Widget buildNameForm() =>
      FormWidget(
        hintText: 'Nama',
        labelText: 'Nama',
        validator: (text) {
          if (text != null && text.length < 2) {
            return msgMinInput;
          } else if (text == null) {
            return msgEmpty;
          } else {}
          return null;
        },
      );

  Widget buildPhoneForm() =>
      FormWidget(
        labelText: 'Phone Number',
        hintText: 'Phone Number',
        validator: (text) {
          if (text != null && !validPhone.hasMatch(text)) {
            return msgInvalidPhone;
          } else if (text == null) {
            return msgEmpty;
          } else {}
          return null;
        },
      );

  Widget buildVerification() =>
      VerificationCode(
        textStyle: Theme
            .of(context)
            .textTheme
            .bodyText2!
            .copyWith(color: Theme
            .of(context)
            .primaryColor),
        keyboardType: TextInputType.number,
        underlineColor: Colors.green,
        length: 6,
        cursorColor: Colors.green,
        clearAll: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            'clear all',
            style: TextStyle(
                fontSize: 14,
                decoration: TextDecoration.underline,
                color: Colors.green[700]),
          ),
        ),
        margin: const EdgeInsets.all(2),
        onCompleted: (String value) {
          setState(() {
            _code = value;
          });
        },
        onEditing: (bool value) {
          setState(() {
            _onEditing = value;
          });
          if (!_onEditing) FocusScope.of(context).unfocus();
        },
      );
}
