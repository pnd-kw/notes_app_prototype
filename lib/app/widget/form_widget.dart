import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  const FormWidget(
      {super.key,
      this.initialValue,
      required this.labelText,
      this.labelStyle,
      required this.hintText,
      required this.validator});

  final String? initialValue;
  final String labelText;
  final TextStyle? labelStyle;
  final String hintText;
  final FormFieldValidator<String> validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: TextFormField(
        maxLines: 1,
        initialValue: initialValue,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.green,
              width: 2.0,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 2.0,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 2.0,
            ),
          ),
          hintText: hintText,
          labelText: labelText,
          labelStyle: labelStyle,
        ),
        validator: validator,
      ),
    );
  }
}
