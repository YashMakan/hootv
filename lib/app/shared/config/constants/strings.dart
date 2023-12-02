import 'package:flutter/material.dart';
import 'package:hootv/app/shared/config/constants/strings_en.dart';

abstract class Strings {
  late String loginPageHeading;
  late String loginPageSubHeading;
  late String loginPageTextFieldHintText;
  late String loginPageButton;
  late String loginPageTrailingText1;
  late String loginPageTrailingText2;

  late String otpPageHeading;

  String otpPageSubheading(String phone);

  late String otpPageButton;
}

extension StringExtensions on BuildContext {
  Strings get strings => StringsEn();
}
