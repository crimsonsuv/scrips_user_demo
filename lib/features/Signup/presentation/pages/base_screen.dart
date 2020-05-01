import 'package:flutter/material.dart';
import 'package:scrips_ua/core/base/screens/base_screen_view.dart';

import 'signup_screen.dart';

class SignupBaseScreen extends StatefulWidget {
  const SignupBaseScreen({
    Key key,
  }) : super(key: key);

  @override
  _SignupBaseScreenState createState() => _SignupBaseScreenState();
}

class _SignupBaseScreenState extends State<SignupBaseScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreenView(
      mobileBodyPortrait: SignupScreen(),
      desktopBodyLandscape: Container(child: Center(child: Text("Not Supported")),),
    );
  }
}
