import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/button.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_ua/core/route/app_route_paths.dart';
import 'package:scrips_ua/features/landing/presentation/bloc/landing/landing_bloc.dart';


List<Widget> footerWidgets(
        {BuildContext context,
        LandingBloc bloc,
        bool isLoading}) =>
    <Widget>[
      Space(
        vertical: 97,
      ),
      Button(
        height: 48,
        width: 222,
        text: "Sign Up",
        isLoading: isLoading,
        style: normalLabelTextStyle(17, enabledBtnTextColor),
        buttonBackgroundColor: enabledBtnBGColor,
        onPressed: () {
          Future.delayed(Duration(milliseconds: 100), () {
            Navigator.pushNamed(context, AppRoutePaths.SignUp);
          });
        },
      ),
      Space(
        vertical: 18,
      ),
      Button(
              height: 48,
              width: 222,
              text: "Log In",
              style: semiBoldLabelTextStyle(17, enabledBtnBGColor),
              buttonBackgroundColor: textFieldBGcolor,
              onPressed: (){},
            ),
    ];
