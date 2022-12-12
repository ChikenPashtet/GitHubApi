import 'package:flutter/material.dart';
import 'package:test_app/core/static/style.dart';

class OnboardingCarouselItem extends StatelessWidget {
  const OnboardingCarouselItem({
    required this.description,
    required this.image,
    super.key,
  });

  final String description;
  final String image;
  @override
  Widget build(BuildContext context) {
    return ListView(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 39),
              child: Image.asset(
                'assets/images/sputnik.png',
                width: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(height: 400,child: Image.asset(image),),
            ),
            const SizedBox(height: 20)
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Text(
            description,
            style: TextStyles.bold22,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
