import 'package:flutter/material.dart';
import 'package:login_animation/screens/onboarding/widgets/text_column.dart';

class ComunityTextColumn extends StatelessWidget {
  const ComunityTextColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextColumn(
      title: 'Community',
      text: 'Share a sense of place situated in a given geographical area.',
    );
  }
}
