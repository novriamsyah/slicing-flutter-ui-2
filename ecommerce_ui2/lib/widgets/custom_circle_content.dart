import 'package:flutter/material.dart';

class CustomCircleContent extends StatelessWidget {
  const CustomCircleContent({
    Key? key,
    this.color = const Color(0xff14193F),
    this.content,
    this.radius = 32.0,
    this.showContent = true,
    this.marginRight = 10.0,
  }) : super(key: key);

  final Color color;
  final Widget? content;
  final double radius;
  final bool showContent;
  final double marginRight;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: marginRight),
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: content,
      ),
    );
  }
}
