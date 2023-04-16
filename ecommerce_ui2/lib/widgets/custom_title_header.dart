import 'package:ecommerce_ui2/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomTitleHeader extends StatelessWidget {
  const CustomTitleHeader({
    Key? key,
    required this.title1,
    this.title2 = 'title2',
    this.sizeTitle1 = 18.0,
    this.sizeTitle2 = 12.0,
    this.showTitle2 = false,
    this.marginTop = 15.0,
    this.letterSpacing = 1.5,
  }) : super(key: key);

  final String title1;
  final String title2;
  final double sizeTitle1;
  final double sizeTitle2;
  final double marginTop;
  final double letterSpacing;
  final bool showTitle2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        margin: EdgeInsets.only(top: marginTop),
        decoration: const BoxDecoration(color: Colors.transparent),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title1,
              style: whiteTextStyle.copyWith(
                fontWeight: FontWeight.bold,
                letterSpacing: letterSpacing,
                fontSize: sizeTitle1,
              ),
            ),
            showTitle2
                ? Text(
                    title2,
                    style: greyTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                      fontSize: sizeTitle2,
                    ),
                  )
                : const Text(''),
          ],
        ),
      ),
    );
  }
}
