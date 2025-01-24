import 'package:car_app/core/extensions/int_extension.dart';
import 'package:car_app/core/extensions/list_extension.dart';
import 'package:car_app/core/extensions/textstyle_extension.dart';
import 'package:car_app/theme/app_textstyles.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    required this.text,
    required this.image,
    super.key,
  });
  final String text;

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: [12, 20].symmetricPadding,
      decoration: BoxDecoration(
        borderRadius: 10.borderRadius,
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 35,
            child: Image.asset(image),
          ),
          Text(
            text,
            style: AppTextstyles.regular.setSize(15),
          ),
        ],
      ),
    );
  }
}
