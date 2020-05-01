import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_ua/core/constants/app_assets.dart';
import 'package:scrips_ua/generated/l10n.dart';

List<Widget> headerWidgets({BuildContext context}) => [
      Space(
        vertical: 24,
      ),
        Images.instance.asset(name: "ic_branding"),
      Space(
        vertical: 80,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27),
        child: Text(
          "Building a healthier tomorrow \nfor you and yours.",
          style: normalLabelTextStyle(19, labelTextStyleTextColor),
          textAlign: TextAlign.center,
        ),
      ),
    ];
