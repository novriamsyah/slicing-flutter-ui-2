import 'package:flutter/material.dart';
import 'package:login_animation/screens/onboarding/widgets/text_column.dart';

class WorkTextColumn extends StatelessWidget {
  const WorkTextColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextColumn(
      title: 'Work together',
      text:
          'Adipisicing anim ex excepteur duis quis in tempor eu ullamco adipisicing.',
    );
  }
}
