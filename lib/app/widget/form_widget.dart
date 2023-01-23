import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  const FormWidget(
      {super.key,
      this.initialValue,
      required this.controller,
      required this.labelText,
      this.labelStyle,
      required this.hintText,
      this.keyBoardType,
      required this.validator});

  final String? initialValue;
  final TextEditingController? controller;
  final String labelText;
  final TextStyle? labelStyle;
  final String hintText;
  final TextInputType? keyBoardType;
  final FormFieldValidator<String> validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextFormField(
        maxLines: 1,
        initialValue: initialValue,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: Theme.of(context).textTheme.subtitle1,
        decoration: InputDecoration(
          hintStyle: const TextStyle(color: Colors.black),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.green,
            ),
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          focusedErrorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          hintText: hintText,
          labelText: labelText,
          labelStyle: labelStyle,
        ),
        controller: controller,
        keyboardType: keyBoardType,
        validator: validator,
      ),
    );
  }
}
