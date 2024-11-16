import 'package:flutter/material.dart';

class CuntomInput extends StatelessWidget {
  const CuntomInput({
    super.key,
    required this.controller,
    required this.label,
    this.icon = Icons.person,
    this.obscureText = false,
    this.maxLength = 20,
    this.errorText,
    this.keyboardType = TextInputType.text,
    required this.validator,
    required this.borderColor,
  });

  final String label;
  final IconData icon;
  final bool obscureText;
  final int maxLength;
  final String? errorText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      decoration: InputDecoration(
        hintText: '$label',
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: borderColor),
        ),
        icon: Icon(icon, color: Color.fromARGB(255, 0, 0, 0)),
        label: Text(label,
            style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
      ),
      maxLength: maxLength,
    );
  }
}
