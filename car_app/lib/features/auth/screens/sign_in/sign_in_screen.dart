import 'package:car_app/core/extensions/context_extension.dart';
import 'package:car_app/core/extensions/int_extension.dart';
import 'package:car_app/core/extensions/list_extension.dart';
import 'package:car_app/core/extensions/textstyle_extension.dart';
import 'package:car_app/core/mixins/app_notice.dart';
import 'package:car_app/core/resource/app_assets.dart';
import 'package:car_app/core/services/shared_prefs.dart';
import 'package:car_app/features/auth/home/home_screen.dart';
import 'package:car_app/features/auth/screens/auth_button.dart.dart';
import 'package:car_app/features/auth/screens/auth_text_field.dart';
import 'package:car_app/features/auth/screens/sign_in/sign_up_screen.dart';
import 'package:car_app/theme/app_colors.dart';
import 'package:car_app/theme/app_textstyles.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> with AppNotice {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  final _prefs = SharedPrefs();

  @override
  //когда умирает контроллер используется диспоз
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: [12, 60].symmetricPadding,
        //const EdgeInsets.only(left: 28, right: 13),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            50.verticalSpace,
            Text(
              'Sign in',
              style: AppTextstyles.regular.setSize(48),
            ),
            100.verticalSpace,
            AuthTextField(
                title: 'Email or Phone',
                hint: 'Enter your email@gmail.com',
                controller: _loginController),
            25.verticalSpace,
            AuthTextField(
                title: 'PASSWORD',
                hint: '*********',
                controller: _passwordController),
            20.verticalSpace,
            const Text('Forgot password?'),
            40.verticalSpace,
            InkWell(
              onTap: () async {
                final login = await _prefs.read(key: StorageKey.login);
                final password = await _prefs.read(key: StorageKey.password);
                if (login == _loginController.text &&
                    password == _passwordController.text) {
                  //showDialog(
                  //  context: context, builder: (context) => Text('Success'));
                  showSuccess(message: 'Successfully!');
                  context.push(
                    const HomeScreen(),
                  );
                } else {
                  //showDialog(
                  //context: context, builder: (context) => Text('error'));
                  showError(errorText: 'Error in auth !');
                }
              },
              child: Container(
                height: 50,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 60),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: SizedBox(
                  child: Text(
                    'Log in',
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
            40.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(' Don’t have an account yet?'),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'SIGN UP',
                    style: TextStyle(color: Colors.orange),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
