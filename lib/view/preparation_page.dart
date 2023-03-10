import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app_prototype/view/sign_in_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PreparationPage extends StatefulWidget {
  const PreparationPage({super.key});

  @override
  State<PreparationPage> createState() => _PreparationPageState();
}

class _PreparationPageState extends State<PreparationPage> {
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: PageView(
          controller: controller,
          children: <Widget>[
            /// First Page
            Stack(children: <Widget>[
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
                    'assets/images/logo_notul.png',
                    width: double.infinity,
                    height: 150,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    top: 450,
                    right: 30,
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displaySmall,
                    'We\'re here to help you remember what is important to you',
                  ),
                ),
              ),
            ]),

            /// Second Page
            Stack(
              children: <Widget>[
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
                      'assets/images/alarm_note.png',
                      width: double.infinity,
                      height: 200,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 30,
                      top: 400,
                      right: 30,
                    ),
                    child: Text(
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      style: Theme.of(context).textTheme.displaySmall,
                      'Write down anything and we\'ll help remind you',
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 25,
                      top: 500,
                      right: 25,
                    ),
                    child: Text(
                      maxLines: 3,
                      style: Theme.of(context).textTheme.titleSmall,
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
                      child: Text(
                          style: Theme.of(context).textTheme.labelLarge,
                          'Lets Start'),
                      onPressed: () {
                        Get.offAll(() => const SignInPage());
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      /// Bottom Navigation
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
}
