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

  Image asset(
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

}
