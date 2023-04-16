import 'package:flutter/material.dart';
import 'package:login_animation/constant.dart';

class TextColumn extends StatelessWidget {
  const TextColumn({
    Key? key,
    required this.title,
    required this.text,
  }) : super(key: key);

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(color: kWhite, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: kSpaceS),
        Text(
          text,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(color: kWhite),
        ),
      ],
    );
  }
}
