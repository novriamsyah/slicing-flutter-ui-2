import 'package:flutter/material.dart';
import 'package:login_animation/constant.dart';
import 'package:login_animation/widgets/logo.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.onSkip,
  });

  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Logo(
          color: kWhite,
          size: 45.0,
        ),
        GestureDetector(
          onTap: onSkip,
          child: Text(
            'Skip',
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: kWhite,
                ),
          ),
        ),
      ],
    );
  }
}
