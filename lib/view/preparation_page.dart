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
  FocusNode appFocusNode = FocusNode();
  final _formPreparation = GlobalKey<FormState>();
  bool _onEditing = true;
  String? _code;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: Form(
          key: _formPreparation,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: PageView(
            controller: controller,
            children: [
              Center(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                          left: 25, top: 150, right: 25, bottom: 100),
                      child: Text(
                        maxLines: 3,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        '"Just a moment and we${"'"}ll ready to help you remember what is important to you"',
                      ),
                    ),
                    buildNameForm(),
                  ],
                ),
              ),
              Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 320),
                      child: buildPhoneForm(),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                          left: 25, top: 120, right: 25),
                      child: Text(
                        maxLines: 5,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        'Tips: set the reminder time earlier than it should be to '
                            'anticipate unexpected things like lost connections or lost signal.',
                      ),
                    ),
                  ],
                ),
              ),
              VerificationCode(
                textStyle: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: Theme.of(context).primaryColor),
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
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Center(
                  child: _onEditing
                      ? const Text('Please enter full code')
                      : Text('Your code: $_code'),
                ),
              )
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 1),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              child: const Text(style: TextStyle(color: Colors.green), 'BACK'),
              onPressed: () => controller.previousPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              ),
            ),
            SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: const ExpandingDotsEffect(
                dotHeight: 9,
                dotWidth: 18,
                dotColor: Colors.transparent,
                activeDotColor: Colors.green,
              ),
            ),
            TextButton(
                child:
                    const Text(style: TextStyle(color: Colors.green), 'NEXT'),
                onPressed: () {
                  if (_formPreparation.currentState!.validate()) {
                    controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }

  Widget buildNameForm() => FormWidget(
        hintText: 'Please enter your name',
        labelText: 'Nama',
        labelStyle: TextStyle(
            color: appFocusNode.hasFocus ? Colors.blue : Colors.green),
        validator: (text) {
          if (text != null && text.length < 2) {
            return msgMinInput;
          } else if (text == null) {
            return msgEmpty;
          } else {}
          return null;
        },
      );

  Widget buildPhoneForm() => FormWidget(
      hintText: 'Please enter your phone number',
      labelText: 'Phone',
      labelStyle:
          TextStyle(color: appFocusNode.hasFocus ? Colors.blue : Colors.green),
      validator: (text) {
        if (text != null && !validPhone.hasMatch(text)) {
          return msgInvalidPhone;
        } else if (text == null) {
          return msgEmpty;
        } else {}
        return null;
      });

/*Widget buildVerification() => VerificationCode(
        textStyle: Theme.of(context)
            .textTheme
            .bodyText2!
            .copyWith(color: Theme.of(context).primaryColor),
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
      );*/
}
