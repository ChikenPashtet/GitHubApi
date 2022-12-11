import 'package:flutter/material.dart';
import 'package:test_app/core/static/colors.dart';

class OnboardingNumbers extends StatelessWidget {
  const OnboardingNumbers({
    required this.currentIndex,
    super.key,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) {
          final isActiveNumber = index == currentIndex;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color:
                  isActiveNumber ? LibraryColors.white : LibraryColors.black400,
              shape: BoxShape.circle,
            ),
            child: Text(
              '${index + 1}',
              style: TextStyle(
                color:
                    isActiveNumber ? LibraryColors.black : LibraryColors.white,
              ),
            ),
          );
        },
      ),
    );
  }
}
