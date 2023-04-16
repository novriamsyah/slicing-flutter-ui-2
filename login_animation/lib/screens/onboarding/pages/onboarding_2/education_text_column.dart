import 'package:flutter/material.dart';
import 'package:login_animation/screens/onboarding/widgets/text_column.dart';

class EducationTextColumn extends StatelessWidget {
  const EducationTextColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextColumn(
      title: 'Keep learning',
      text: 'process of acquiring new understanding, knowledge, behaviors.',
    );
  }
}
