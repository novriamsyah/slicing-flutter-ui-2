import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    this.backgroundColor = false,
    required this.iconUrl,
    this.radius = 30.0,
    this.color = Colors.deepPurple,
    this.marginTop = 0.0,
    this.marginBottom = 0.0,
    this.marginLeft = 0.0,
    this.marginRight = 0.0,
  }) : super(key: key);

  final bool backgroundColor;
  final String iconUrl;
  final double radius;
  final Color color;
  final double marginTop;
  final double marginBottom;
  final double marginLeft;
  final double marginRight;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: marginTop,
          bottom: marginBottom,
          left: marginLeft,
          right: marginRight),
      width: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor ? Colors.grey.shade400 : Colors.transparent,
      ),
      child: InkWell(
        onTap: () {},
        customBorder: const CircleBorder(),
        child: SvgPicture.asset(
          iconUrl,
          color: color,
          width: radius,
        ),
      ),
    );
  }
}
