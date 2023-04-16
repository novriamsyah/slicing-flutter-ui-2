import 'package:flutter/material.dart';
import 'package:login_animation/constant.dart';

class NextPageButton extends StatelessWidget {
  const NextPageButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: const EdgeInsets.all(kPaddingM),
      elevation: 0.0,
      shape: const CircleBorder(),
      fillColor: kWhite,
      onPressed: onPressed,
      child: const Icon(
        Icons.arrow_forward,
        color: kBlue,
        size: 32.0,
      ),
    );
  }
}
