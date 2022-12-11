import 'package:flutter/material.dart';
import 'package:test_app/core/router/routes.dart';
import 'package:test_app/core/static/colors.dart';

import 'components/onboarding_carousel.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LibraryColors.backGround,
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 22),
          OnboardingCarousel(),
          const SizedBox(height: 22),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(double.infinity, 58),
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onPressed: () => Navigator.pushNamed(
                context,
                Routes.signIn,
              ),
              child: const Center(
                child: Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 54),
        ],
      ),
    );
  }
}
