import 'package:flutter/material.dart';
import 'package:login_animation/constant.dart';

import 'widgets/custom_clippers/index.dart';
import 'widgets/header.dart';
import 'widgets/login_form.dart';

class Login extends StatefulWidget {
  const Login({
    Key? key,
    required this.screenHeight,
  }) : super(key: key);

  final double screenHeight;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _headerTextAnimation;
  late final Animation<double> _formElementAnimation;
  late final Animation<double> _whiteTopClipperAnimation;
  late final Animation<double> _blueTopClipperAnimation;
  late final Animation<double> _greyTopClipperAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: kLoginAnimationDuration,
    );

    final fadeSlideTween = Tween<double>(begin: 0.0, end: 1.0);

    _headerTextAnimation = fadeSlideTween.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.0,
          0.6,
          curve: Curves.easeInOut,
        ),
      ),
    );

    _formElementAnimation = fadeSlideTween.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.7,
          1.0,
          curve: Curves.easeInOut,
        ),
      ),
    );

    final clipperOffsetTween = Tween<double>(
      begin: widget.screenHeight,
      end: 0.0,
    );
    _blueTopClipperAnimation = clipperOffsetTween.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.2,
          0.7,
          curve: Curves.easeInOut,
        ),
      ),
    );
    _greyTopClipperAnimation = clipperOffsetTween.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.35,
          0.8,
          curve: Curves.easeInOut,
        ),
      ),
    );
    _whiteTopClipperAnimation = clipperOffsetTween.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.5,
          0.7,
          curve: Curves.easeInOut,
        ),
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kWhite,
      body: Stack(
        children: <Widget>[
          AnimatedBuilder(
            animation: _whiteTopClipperAnimation,
            child: Container(
              color: kGrey,
            ),
            builder: (_, Widget? child) {
              return ClipPath(
                clipper: WhiteTopClipper(
                  yOffset: _whiteTopClipperAnimation.value,
                ),
                child: child,
              );
            },
          ),
          AnimatedBuilder(
            animation: _greyTopClipperAnimation,
            child: Container(
              color: kBlue,
            ),
            builder: (_, Widget? child) {
              return ClipPath(
                clipper:
                    GreyTopClipper(yOffset: _greyTopClipperAnimation.value),
                child: child,
              );
            },
          ),
          AnimatedBuilder(
            animation: _blueTopClipperAnimation,
            builder: (_, Widget? child) {
              return ClipPath(
                clipper: BlueTopClipper(
                  yOffset: _blueTopClipperAnimation.value,
                ),
                child: child,
              );
            },
            child: Container(color: kWhite),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: kPaddingL),
              child: Column(
                children: [
                  Header(
                    animation: _headerTextAnimation,
                  ),
                  const Spacer(),
                  LoginForm(
                    animation: _formElementAnimation,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
