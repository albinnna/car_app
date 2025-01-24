import 'package:car_app/core/extensions/textstyle_extension.dart';
import 'package:car_app/theme/app_textstyles.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField(
      {required this.title,
      required this.hint,
      required this.controller,
      super.key});

  final String title;
  final String hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextstyles.regular.setSize(14),
        ),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(hintText: hint),
        ),
      ],
    );
  }
}
