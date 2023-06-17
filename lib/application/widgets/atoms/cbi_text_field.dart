import 'package:flutter/material.dart';

class CbiTextField extends StatelessWidget {
  final String initValue;
  final void Function(String value) onChange;
  final String? label;
  final String? hintText;
  final String? errorText;
  final TextInputType? textInputType;
  final String helperText;
  final bool obscureText;

  const CbiTextField({
    super.key,
    this.initValue = '',
    required this.onChange,
    this.hintText,
    this.errorText,
    this.textInputType,
    this.helperText = '',
    this.obscureText = false,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initValue,
      onChanged: onChange,
      keyboardType: textInputType,
      obscureText: obscureText,
      decoration: InputDecoration(
          label: label == null ? null : Text(label!),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 21.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  color: Color.fromARGB(255, 0x27, 0x4D, 0x96))),
          helperText: helperText,
          hintText: hintText,
          errorText: errorText),
    );
  }
}
