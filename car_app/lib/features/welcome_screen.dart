import 'package:car_app/core/resource/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:car_app/theme/app_colors.dart';
import 'package:car_app/theme/app_textstyles.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AppAssets.welcomeBg),
          SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 250,
                  ),
                  SizedBox(
                    height: 60,
                    child: Image.asset(AppAssets.welcomeLogo),
                  ),
                  const SizedBox(
                    height: 200,
                  ),
                  const Text(
                    "Rent your dream car from the\n Best Company ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 26,
                      color: Color(0xffF6F6F6),
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffC64949),
                      padding: const EdgeInsets.symmetric(
                        vertical: 25,
                        horizontal: 63,
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Get Started',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xffF6F6F6),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.navigate_next,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
