import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app_prototype/app/utils/regex_validator.dart';
import 'package:notes_app_prototype/app/widget/form_widget.dart';
import 'package:notes_app_prototype/view/sign_in_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PreparationPage extends StatefulWidget {
  const PreparationPage({super.key});

  @override
  State<PreparationPage> createState() => _PreparationPageState();
}

class _PreparationPageState extends State<PreparationPage> {
  final controller = PageController();

  //bool _loading = false;
  final _phoneController = TextEditingController();
  FocusNode appFocusNode = FocusNode();

  //final _formPreparation = GlobalKey<FormState>();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  /*bool _onEditing = true;
  String? _code;*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: PageView(
          controller: controller,
          children: [
            Stack(children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 250),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(120)),
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 135),
                  child: Image.asset(
                    "assets/images/logo_notul.png",
                    width: double.infinity,
                    height: 150,
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 30,
                    top: 450,
                    right: 30,
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    'We${"'"}re here to help you remember what is important to you',
                  ),
                ),
              ),
            ]),
            Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 250),
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(120)),
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 175),
                    child: Image.asset(
                      "assets/images/alarm_note.png",
                      width: double.infinity,
                      height: 200,
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 30,
                      top: 400,
                      right: 30,
                    ),
                    child: Text(
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      'Write down anything and we${"'"}ll help remind you',
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 25,
                      top: 500,
                      right: 25,
                    ),
                    child: Text(
                      maxLines: 3,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      'Tips: set the reminder time earlier than it should be to '
                      'anticipate unexpected things like lost connections or lost signal.',
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 600),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        fixedSize: const Size(200, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          'Lets Start'),
                      onPressed: () {
                        Get.off(() => const SignInPage());
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        color: Colors.green,
        height: 80,
        child: Center(
          child: SmoothPageIndicator(
            controller: controller,
            count: 2,
            effect: const ExpandingDotsEffect(
              dotHeight: 9,
              dotWidth: 12,
              dotColor: Colors.white60,
              activeDotColor: Colors.white,
            ),
          ),
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
