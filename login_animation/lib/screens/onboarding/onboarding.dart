import 'dart:math';

import 'package:flutter/material.dart';
import 'package:login_animation/constant.dart';
import 'package:login_animation/screens/login/login.dart';
import 'package:login_animation/screens/onboarding/pages/onboarding_1/index.dart';
import 'package:login_animation/screens/onboarding/pages/onboarding_2/index.dart';
import 'package:login_animation/screens/onboarding/pages/onboarding_3/index.dart';
import 'package:login_animation/screens/onboarding/pages/onboarding_page.dart';
import 'package:login_animation/screens/onboarding/widgets/header.dart';
import 'package:login_animation/screens/onboarding/widgets/next_page_button.dart';
import 'package:login_animation/screens/onboarding/widgets/onboarding_page_indicator.dart';
import 'package:login_animation/screens/onboarding/widgets/ripple.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({
    Key? key,
    required this.screenHeight,
  }) : super(key: key);

  final double screenHeight;

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> with TickerProviderStateMixin {
  late final AnimationController _cardAnimationController;
  late final AnimationController _pageIndicatorAnimationController;
  late final AnimationController _rippleAnimationController;

  late Animation<Offset> _slideAnimationLightCard;
  late Animation<Offset> _slideAnimationDarkCard;
  late Animation<double> _pageIndicatorAnimation;
  late Animation<double> _rippleAnimation;

  int _currentPage = 1;

  bool get isFirstPage => _currentPage == 1;

  @override
  void initState() {
    super.initState();

    _cardAnimationController = AnimationController(
      duration: kCardAnimationDuration,
      vsync: this,
    );

    _pageIndicatorAnimationController = AnimationController(
      duration: kButtonAnimationDuration,
      vsync: this,
    );

    _rippleAnimationController = AnimationController(
      duration: kRippleAnimationDuration,
      vsync: this,
    );

    _rippleAnimation = Tween(
      begin: 0.0,
      end: widget.screenHeight,
    ).animate(
      CurvedAnimation(
        parent: _rippleAnimationController,
        curve: Curves.easeIn,
      ),
    );

    _setCardSlideOutAnimation();
    _setPageIndicatorAnimation();
  }

  @override
  void dispose() {
    _cardAnimationController.dispose();
    _pageIndicatorAnimationController.dispose();
    _rippleAnimationController.dispose();
    super.dispose();
  }

  Widget _getPage() {
    switch (_currentPage) {
      case 1:
        return OnboardingPage(
          number: 1,
          lightCardChild: const ComunityLightCardContent(),
          darkCardChild: const ComunityDarkCardContent(),
          darkCardOffsetAnimation: _slideAnimationDarkCard,
          lightCardOffsetAnimation: _slideAnimationLightCard,
          textColumn: const ComunityTextColumn(),
        );
      case 2:
        return OnboardingPage(
          number: 2,
          lightCardChild: const EducationLightCardContent(),
          darkCardChild: const EducationDarkCardContent(),
          darkCardOffsetAnimation: _slideAnimationDarkCard,
          lightCardOffsetAnimation: _slideAnimationLightCard,
          textColumn: const EducationTextColumn(),
        );
      case 3:
        return OnboardingPage(
          number: 3,
          lightCardChild: const WorkLightCardContent(),
          darkCardChild: const WorkDarkCardContent(),
          darkCardOffsetAnimation: _slideAnimationDarkCard,
          lightCardOffsetAnimation: _slideAnimationLightCard,
          textColumn: const WorkTextColumn(),
        );
      default:
        throw Exception("Page with number '$_currentPage' does not exist.");
    }
  }

  void _setCardSlideInAnimation() {
    setState(() {
      //Slide Light Card
      _slideAnimationLightCard = Tween<Offset>(
        begin: const Offset(3.0, 0.0),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: _cardAnimationController,
          curve: Curves.easeOut,
        ),
      );
    });

    //Slide Dark Card
    _slideAnimationDarkCard = Tween<Offset>(
      begin: const Offset(1.5, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _cardAnimationController,
      curve: Curves.easeOut,
    ));

    _cardAnimationController.reset();
  }

  void _setCardSlideOutAnimation() {
    setState(() {
      _slideAnimationLightCard = Tween<Offset>(
        begin: Offset.zero,
        end: const Offset(-3.0, 0.0),
      ).animate(CurvedAnimation(
        parent: _cardAnimationController,
        curve: Curves.easeIn,
      ));

      _slideAnimationDarkCard = Tween<Offset>(
        begin: Offset.zero,
        end: const Offset(-1.5, 0.0),
      ).animate(CurvedAnimation(
        parent: _cardAnimationController,
        curve: Curves.easeIn,
      ));
    });

    _cardAnimationController.reset();
  }

  //Animation Page Indicator
  void _setPageIndicatorAnimation({isClockwiseAnimation = true}) {
    var multiplicator = isClockwiseAnimation ? 2 : -2;

    setState(() {
      _pageIndicatorAnimation = Tween(
        begin: 0.0,
        end: multiplicator * pi,
      ).animate(
        CurvedAnimation(
          parent: _pageIndicatorAnimationController,
          curve: Curves.easeIn,
        ),
      );
      _pageIndicatorAnimationController.reset();
    });
  }

  void _setNextPage(int nextPageNumber) {
    setState(() {
      _currentPage = nextPageNumber;
    });
  }

  Future<void> _nextPage() async {
    switch (_currentPage) {
      case 1:
        if (_pageIndicatorAnimation.status == AnimationStatus.dismissed) {
          _pageIndicatorAnimationController.forward();
          await _cardAnimationController.forward();
          _setNextPage(2);
          _setCardSlideInAnimation();
          await _cardAnimationController.forward();
          _setCardSlideOutAnimation();
          _setPageIndicatorAnimation(isClockwiseAnimation: false);
        }
        break;
      case 2:
        if (_pageIndicatorAnimation.status == AnimationStatus.dismissed) {
          _pageIndicatorAnimationController.forward();
          await _cardAnimationController.forward();
          _setNextPage(3);
          _setCardSlideInAnimation();
          await _cardAnimationController.forward();
        }
        break;
      case 3:
        if (_pageIndicatorAnimation.status == AnimationStatus.completed) {
          await _goToLogin();
        }
        break;
    }
  }

  Future<void> _goToLogin() async {
    await _rippleAnimationController.forward();
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (_) => Login(
          screenHeight: widget.screenHeight,
        ),
      ),
      (Route route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kComDarkBlue,
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(kPaddingL),
              child: Column(
                children: <Widget>[
                  Header(onSkip: _goToLogin),
                  Expanded(child: _getPage()),
                  AnimatedBuilder(
                    animation: _pageIndicatorAnimation,
                    builder: (_, Widget? child) {
                      return OnboardingPageIndicator(
                        angle: _pageIndicatorAnimation.value,
                        currentPage: _currentPage,
                        child: child!,
                      );
                    },
                    child: NextPageButton(
                      onPressed: _nextPage,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _rippleAnimation,
            builder: (_, Widget? child) {
              return Ripple(
                radius: _rippleAnimation.value,
              );
            },
          ),
        ],
      ),
    );
  }
}
