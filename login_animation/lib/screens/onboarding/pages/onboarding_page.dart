import 'package:flutter/material.dart';
import 'package:login_animation/screens/onboarding/widgets/card_stack.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    Key? key,
    required this.number,
    required this.lightCardChild,
    required this.darkCardChild,
    required this.textColumn,
    required this.lightCardOffsetAnimation,
    required this.darkCardOffsetAnimation,
  }) : super(key: key);

  final int number;
  final Widget lightCardChild;
  final Widget darkCardChild;
  final Animation<Offset> lightCardOffsetAnimation;
  final Animation<Offset> darkCardOffsetAnimation;
  final Widget textColumn;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CardStack(
          pageNumber: number,
          lightCardChild: lightCardChild,
          darkCardChild: darkCardChild,
          lightCardOffsetAnimation: lightCardOffsetAnimation,
          darkCardOffsetAnimation: darkCardOffsetAnimation,
        ),
        SizedBox(height: number % 2 == 1 ? 50.0 : 25.0),
        textColumn,
      ],
    );
  }
}
