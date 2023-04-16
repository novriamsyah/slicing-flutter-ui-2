import 'package:flutter/material.dart';
import 'package:login_animation/constant.dart';
import 'package:login_animation/screens/login/widgets/fade_slide_transition.dart';

import 'custom_button.dart';
import 'custom_input_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
    required this.animation,
  }) : super(key: key);

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    final height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final space = height > 650 ? kSpaceM : kSpaceS;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPaddingL),
      child: Column(
        children: [
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 0.0,
            child: const CustomInputField(
              label: 'Username or Email',
              prefixIcon: Icons.person,
              obscureText: false,
            ),
          ),
          SizedBox(height: space),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: space,
            child: const CustomInputField(
              label: 'Password',
              prefixIcon: Icons.lock,
              obscureText: true,
            ),
          ),
          SizedBox(height: space),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 2 * space,
            child: CustomButton(
              color: kBlue,
              textColor: kWhite,
              text: 'Login to continue',
              onPressed: () {},
            ),
          ),
          SizedBox(height: 2 * space),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 3 * space,
            child: CustomButton(
              color: kWhite,
              textColor: kBlack.withOpacity(0.5),
              text: 'Continue with Google',
              image: const Image(
                image: AssetImage(kGoogleLogoPath),
                height: 48.0,
              ),
              onPressed: () {},
            ),
          ),
          SizedBox(height: space),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 4 * space,
            child: CustomButton(
              color: kBlack,
              textColor: kWhite,
              text: 'Create a Bubble Account',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
