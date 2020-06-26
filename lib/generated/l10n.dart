// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `User Application`
  String get ua_app_name {
    return Intl.message(
      'User Application',
      name: 'ua_app_name',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Show Device Preview`
  String get show_device_preview {
    return Intl.message(
      'Show Device Preview',
      name: 'show_device_preview',
      desc: '',
      args: [],
    );
  }

  /// `Overlap Sub Menu`
  String get overlap_sub_menu {
    return Intl.message(
      'Overlap Sub Menu',
      name: 'overlap_sub_menu',
      desc: '',
      args: [],
    );
  }

  /// `Change Locale`
  String get change_locale {
    return Intl.message(
      'Change Locale',
      name: 'change_locale',
      desc: '',
      args: [],
    );
  }

  /// `Current Locale`
  String get current_locale {
    return Intl.message(
      'Current Locale',
      name: 'current_locale',
      desc: '',
      args: [],
    );
  }

  /// `Please wait, sending data..`
  String get pleaseWaitSendingData {
    return Intl.message(
      'Please wait, sending data..',
      name: 'pleaseWaitSendingData',
      desc: '',
      args: [],
    );
  }

  /// `Please wait, fetching data..`
  String get pleaseWaitFetchingData {
    return Intl.message(
      'Please wait, fetching data..',
      name: 'pleaseWaitFetchingData',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Details`
  String get enterYourDetails {
    return Intl.message(
      'Enter Your Details',
      name: 'enterYourDetails',
      desc: '',
      args: [],
    );
  }

  /// `This info lets providers give more helpful, \npersonalized experience`
  String get thisInfoLetsProvidersGiveMoreHelpfulNpersonalizedExperience {
    return Intl.message(
      'This info lets providers give more helpful, \npersonalized experience',
      name: 'thisInfoLetsProvidersGiveMoreHelpfulNpersonalizedExperience',
      desc: '',
      args: [],
    );
  }

  /// `FIRST NAME`
  String get firstName {
    return Intl.message(
      'FIRST NAME',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Enter first name`
  String get enterFirstName {
    return Intl.message(
      'Enter first name',
      name: 'enterFirstName',
      desc: '',
      args: [],
    );
  }

  /// `MIDDLE NAME`
  String get middleName {
    return Intl.message(
      'MIDDLE NAME',
      name: 'middleName',
      desc: '',
      args: [],
    );
  }

  /// `Enter middle name (Optional)`
  String get enterMiddleNameOptional {
    return Intl.message(
      'Enter middle name (Optional)',
      name: 'enterMiddleNameOptional',
      desc: '',
      args: [],
    );
  }

  /// `LAST NAME`
  String get lastName {
    return Intl.message(
      'LAST NAME',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Enter last name`
  String get enterLastName {
    return Intl.message(
      'Enter last name',
      name: 'enterLastName',
      desc: '',
      args: [],
    );
  }

  /// `DATE OF BIRTH`
  String get dateOfBirth {
    return Intl.message(
      'DATE OF BIRTH',
      name: 'dateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Select date of birth`
  String get selectDateOfBirth {
    return Intl.message(
      'Select date of birth',
      name: 'selectDateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `GENDER`
  String get gender {
    return Intl.message(
      'GENDER',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `CONTACT NUMBER`
  String get contactNumber {
    return Intl.message(
      'CONTACT NUMBER',
      name: 'contactNumber',
      desc: '',
      args: [],
    );
  }

  /// `e.g. +971 23 345 6789`
  String get eg971233456789 {
    return Intl.message(
      'e.g. +971 23 345 6789',
      name: 'eg971233456789',
      desc: '',
      args: [],
    );
  }

  /// `EMAIL ADDRESS`
  String get emailAddress {
    return Intl.message(
      'EMAIL ADDRESS',
      name: 'emailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Enter email address`
  String get enterEmailAddress {
    return Intl.message(
      'Enter email address',
      name: 'enterEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid email address`
  String get pleaseEnterValidEmailAddress {
    return Intl.message(
      'Please enter valid email address',
      name: 'pleaseEnterValidEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `No Questions Added`
  String get noQuestionsAdded {
    return Intl.message(
      'No Questions Added',
      name: 'noQuestionsAdded',
      desc: '',
      args: [],
    );
  }

  /// `Please provide response to all the mandatory fields`
  String get pleaseProvideResponseToAllTheMandatoryFields {
    return Intl.message(
      'Please provide response to all the mandatory fields',
      name: 'pleaseProvideResponseToAllTheMandatoryFields',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Form Response Successfully Sent`
  String get formResponseSuccessfullySent {
    return Intl.message(
      'Form Response Successfully Sent',
      name: 'formResponseSuccessfullySent',
      desc: '',
      args: [],
    );
  }

  /// `Click on the patient to continue forward`
  String get clickOnThePatientToContinueForward {
    return Intl.message(
      'Click on the patient to continue forward',
      name: 'clickOnThePatientToContinueForward',
      desc: '',
      args: [],
    );
  }

  /// `Multiple Data Present`
  String get multipleDataPresent {
    return Intl.message(
      'Multiple Data Present',
      name: 'multipleDataPresent',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}