import 'package:flutter/material.dart';

class Fonts {
  static String roboto = "Roboto";
}

class FilePaths {
  static String globalConfigFilePath =
      'assets/configuration/global_configuration.json';
}

class Images {
  Images._privateConstructor();

  static final Images _instance = Images._privateConstructor();

  static Images get instance {
    return _instance;
  }

  Image assetByName(
          {double width,
          double height,
          Color color,
          BlendMode colorBlendMode,
          String name,
          BoxFit fit}) =>
      Image(
          image: AssetImage("assets/$name.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image minus(
          {double width,
          double height,
          Color color,
          BlendMode colorBlendMode,
          BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_minus.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image logo(
          {double width,
          double height,
          Color color,
          BlendMode colorBlendMode,
          BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_logo.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image dashboard(
          {double width,
          double height,
          Color color,
          BlendMode colorBlendMode,
          BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_menu_dashboard.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image cross(
          {double width,
          double height,
          Color color,
          BlendMode colorBlendMode,
          BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_cross.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image crossBig(
          {double width,
          double height,
          Color color,
          BlendMode colorBlendMode,
          BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_cross_big.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image plus(
          {double width,
          double height,
          Color color,
          BlendMode colorBlendMode,
          BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_plus.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image organization(
          {double width,
          double height,
          Color color,
          BlendMode colorBlendMode,
          BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_organization.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image userpic(
          {double width,
          double height,
          Color color,
          BlendMode colorBlendMode,
          BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_userpic.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image banner(
          {double width,
          double height,
          Color color,
          BlendMode colorBlendMode,
          BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_branding.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image back(
          {double width,
          double height,
          Color color,
          BlendMode colorBlendMode,
          BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_back.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image backWhite(
          {double width,
          double height,
          Color color,
          BlendMode colorBlendMode,
          BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_back_white.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image messages(
          {double width,
          double height,
          Color color,
          BlendMode colorBlendMode,
          BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_menu_messages.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image workSmall(
          {double width,
          double height,
          Color color,
          BlendMode colorBlendMode,
          BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_work.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image greenCheckMark(
          {double width,
          double height,
          Color color,
          BlendMode colorBlendMode,
          BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_greenCheck.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image cameraIcon(
          {double width,
          double height,
          Color color,
          BlendMode colorBlendMode,
          BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_camera.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image dropDownIcon(
          {double width,
          double height,
          Color color,
          BlendMode colorBlendMode,
          BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_drop_down.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image dropDownIconWhite(
          {double width,
          double height,
          Color color,
          BlendMode colorBlendMode,
          BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_drop_down_white.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image location(
          {double width,
          double height,
          Color color,
          BlendMode colorBlendMode,
          BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_location.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image smallLocation(
          {double width,
          double height,
          Color color,
          BlendMode colorBlendMode,
          BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_small_location.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image smallClock(
          {double width,
          double height,
          Color color,
          BlendMode colorBlendMode,
          BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_small_clock.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image emailIcon(
          {double width,
          double height,
          Color color,
          BlendMode colorBlendMode,
          BoxFit fit}) =>
      Image(
          image: AssetImage("assets/email_icon.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image licenseExpirationDate(
          {double width,
          double height,
          Color color,
          BlendMode colorBlendMode,
          BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_calendar.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image pmAppIcon(
          {double width,
          double height,
          Color color,
          BlendMode colorBlendMode,
          BoxFit fit}) =>
      Image(
          image: AssetImage("assets/pm_app_icon.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image moreGreyIcon(
          {double width,
          double height,
          Color color,
          BlendMode colorBlendMode,
          BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_more_grey.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image edit(
          {double width,
          double height,
          Color color,
          BlendMode colorBlendMode,
          BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_edit.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image searchIcon(
          {double width,
          double height,
          Color color,
          BlendMode colorBlendMode,
          BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_search.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image workTime(
          {double width,
          double height,
          Color color,
          BlendMode colorBlendMode,
          BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_work_time.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image holidayTime(
          {double width,
          double height,
          Color color,
          BlendMode colorBlendMode,
          BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_holiday_time.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image successSmall(
          {double width,
          double height,
          Color color,
          BlendMode colorBlendMode,
          BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_success_small.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image notification(
          {double width,
          double height,
          Color color,
          BlendMode colorBlendMode,
          BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_menu_notifications.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image getHelp(
          {double width,
          double height,
          Color color,
          BlendMode colorBlendMode,
          BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_menu_get_help.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image appointmentIcon(
          {double width,
          double height,
          Color color,
          BlendMode colorBlendMode,
          BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_calendar.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image archiveIcon(
          {double width,
          double height,
          Color color,
          BlendMode colorBlendMode,
          BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_archive.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image breadCrumbNext(
          {double width,
          double height,
          Color color,
          BlendMode colorBlendMode,
          BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_breadcrumb_next.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image minorIcon(
          {double width,
          double height,
          Color color,
          BlendMode colorBlendMode,
          BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_minor.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image starIcon(
          {double width,
          double height,
          Color color,
          BlendMode colorBlendMode,
          BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_star.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image starIconFilled(
          {double width,
          double height,
          Color color,
          BlendMode colorBlendMode,
          BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_star_filled.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image smallPhone(
          {double width,
          double height,
          Color color,
          BlendMode colorBlendMode,
          BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_small_phone.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image smallUser(
          {double width,
          double height,
          Color color,
          BlendMode colorBlendMode,
          BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_small_user.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image smallHash(
          {double width,
          double height,
          Color color,
          BlendMode colorBlendMode,
          BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_small_hash.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image activeForm(
          {double width,
          double height,
          Color color,
          BlendMode colorBlendMode,
          BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_active_form.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image inactiveForm(
          {double width,
          double height,
          Color color,
          BlendMode colorBlendMode,
          BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_inactive_form.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image deleteIcon(
          {double width,
          double height,
          Color color,
          BlendMode colorBlendMode,
          BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_delete.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image editBlue(
          {double width,
          double height,
          Color color,
          BlendMode colorBlendMode,
          BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_edit_blue.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);
}
