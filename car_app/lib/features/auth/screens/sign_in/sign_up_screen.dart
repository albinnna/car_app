import 'package:car_app/core/extensions/context_extension.dart';
import 'package:car_app/core/extensions/int_extension.dart';
import 'package:car_app/core/extensions/list_extension.dart';
import 'package:car_app/core/extensions/textstyle_extension.dart';
import 'package:car_app/core/resource/app_assets.dart';
import 'package:car_app/core/services/shared_prefs.dart';
import 'package:car_app/features/auth/screens/auth_button.dart.dart';
import 'package:car_app/features/auth/screens/auth_text_field.dart';
import 'package:car_app/features/auth/screens/sign_in/sign_in_screen.dart';
import 'package:car_app/theme/app_colors.dart';
import 'package:car_app/theme/app_textstyles.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  final _prefs = SharedPrefs();

  @override
  void dispose() {
    _nameController.dispose();
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 28, right: 13),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            50.verticalSpace,
            Text(
              'Sign up',
              style: AppTextstyles.regular.setSize(48),
            ),
            100.verticalSpace,
            AuthTextField(
                title: 'FULL NAME',
                hint: 'Enter your name',
                controller: _nameController),
            25.verticalSpace,
            AuthTextField(
                title: 'EMAIL OR PHONE ',
                hint: 'Enter your login',
                controller: _loginController),
            20.verticalSpace,
            25.verticalSpace,
            AuthTextField(
                title: 'PASSWORD ',
                hint: '*********',
                controller: _passwordController),
            40.verticalSpace,
            InkWell(
              onTap: () {
                //log('Full name ${_nameController.text}' as num);
                //log('Login ${_loginController.text}');
                //log('Password ${_passwordController}');
                _prefs.save(
                    key: StorageKey.login, value: _loginController.text);
                _prefs.save(
                    key: StorageKey.password, value: _passwordController.text);
                context.push(const SignInScreen());
                //поменяли это на выше: Navigator.push(
                //context,
                //MaterialPageRoute(
                //builder: (context) => const SignInScreen(),
                //),
                //);
              },
              child: Container(
                height: 50,
                padding: [12, 60].symmetricPadding,
                //поменяли это на выше: const EdgeInsets.symmetric(vertical: 12, horizontal: 60),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  //borderRadius: BorderRadius.circular(10),
                  borderRadius: 10.borderRadius,
                ),
                child: Center(
                    child: SizedBox(
                  child: Text(
                    'Sign up',
                    style: AppTextstyles.semiBold.setSize(20).copyWith(
                          color: AppColors.textColor,
                        ),
                  ),
                )),
              ),
            ),
            15.verticalSpace,
            const Center(child: Text('OR')),
            15.verticalSpace,
            const AuthButton(
                image: AppAssets.google, text: 'Continue with Google'),
            15.verticalSpace,
            const AuthButton(
                image: AppAssets.facebook, text: 'Continue with Facebook'),
          ],
        ),
      )),
    );
  }
}
