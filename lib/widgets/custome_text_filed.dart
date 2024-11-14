import 'package:flutter/material.dart';

class CustomeTextFiled extends StatelessWidget {
  CustomeTextFiled(
      {this.onChanged,
      super.key,
      this.inputType,
      required this.hintText,
      this.obscure = false});
  final String hintText;
  Function(String)? onChanged;
  TextInputType? inputType;
  bool? obscure;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        style: const TextStyle(color: Colors.black),
        obscureText: obscure!,
        keyboardType: inputType,
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
