import 'package:flutter/material.dart';
import 'package:login_animation/constant.dart';
import 'package:login_animation/screens/onboarding/widgets/icon_container.dart';

class ComunityLightCardContent extends StatelessWidget {
  const ComunityLightCardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const <Widget>[
        IconContainer(
          icon: Icons.person,
          padding: kPaddingS,
        ),
        IconContainer(
          icon: Icons.group,
          padding: kPaddingM,
        ),
        IconContainer(
          icon: Icons.insert_emoticon,
          padding: kPaddingS,
        ),
      ],
    );
  }
}
