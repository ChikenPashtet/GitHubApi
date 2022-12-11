import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'onboarding_carousel_item.dart';
import 'onboarding_numbers.dart';

class OnboardingCarousel extends StatefulWidget {
  @override
  State<OnboardingCarousel> createState() => _OnboardingCarouselState();
}

class _OnboardingCarouselState extends State<OnboardingCarousel> {
  int currentIndex = 0;

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 600,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            viewportFraction: 1,
            onPageChanged: (currentIndex, _) => onPageChanged(currentIndex),
          ),
          items: [
            const OnboardingCarouselItem(
              description: 'Фонд поддержки стартапов «Спутник»',
              image: 'assets/images/first.png',
            ),
            const OnboardingCarouselItem(
              description:
                  'Мы помогаем сфокусироваться на главном — предпринимательстве',
              image: 'assets/images/second.png',
            ),
            const OnboardingCarouselItem(
              description: 'Сделано ботаниками для ботаников',
              image: 'assets/images/third.png',
            ),
          ],
        ),
        const SizedBox(height: 22),
        OnboardingNumbers(
          currentIndex: currentIndex,
        ),
      ],
    );
  }
}
