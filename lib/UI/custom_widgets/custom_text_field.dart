import 'package:flutter/material.dart';

import '../Utils/app_utils.dart';


class CustomTextField extends StatelessWidget {
  final TextEditingController controller;final String hintText;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        fillColor: gOffWhite,
        filled: true,
        contentPadding: const EdgeInsets.all(8),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color:gOffWhite,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: gOffWhite,
              width: 1,
            )),
        hintText: hintText,
        hintStyle: const TextStyle(color: gBlack)
      ),
    );
  }
}



///    Password text field

class CustomTextFieldPassword extends StatelessWidget {
  final TextEditingController controller;
  final bool? obscure;
  final String hintText;
  final Widget? suffixIcon;

  const CustomTextFieldPassword({
    Key? key,
    required this.controller,
    this.obscure = false,
    required this.hintText,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscure!,
      decoration: InputDecoration(
        fillColor: gOffWhite,
        filled: true,
        suffixIcon: suffixIcon ?? Container(),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color:gOffWhite,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: gOffWhite,
              width: 1,
            )),
        hintText: hintText,
        hintStyle: const TextStyle(color: gBlack)
      ),
    );
  }
}


///    read only text field
class CustomTextFieldReadOnly extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final VoidCallback onTap;

  const CustomTextFieldReadOnly({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      controller: controller,
      decoration: InputDecoration(
        fillColor: gOffWhite,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color:gOffWhite,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: gOffWhite,
              width: 1,
            )),
        hintText: hintText,
        hintStyle: const TextStyle(color: gBlack)
      ),
      onTap: onTap,
    );
  }
}
