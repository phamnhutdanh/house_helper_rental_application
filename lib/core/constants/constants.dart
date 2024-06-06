import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/theme/app_palette.dart';

import 'package:flutter/widgets.dart';

class Constants {
  static final kToday = DateTime.now();
  static final kFirstDay = DateTime(kToday.year, kToday.month, kToday.day);
  static final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

  static const noConnectionErrorMessage = 'Not connected to a network!';

  static const kDefaultPadding = 24.0;
  static const kLessPadding = 10.0;
  static const kFixPadding = 16.0;
  static const kLess = 4.0;

  static const kShape = 30.0;

  static const kRadius = 0.0;
  static const kAppBarHeight = 56.0;

  static const kHeadTextStyle = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
  );

  static const kSubTextStyle = TextStyle(
    fontSize: 18.0,
    color: AppPalette.kLightColor,
  );

  static const kTitleTextStyle = TextStyle(
    fontSize: 20.0,
    color: AppPalette.primaryColor,
  );

  static const kDarkTextStyle = TextStyle(
    fontSize: 20.0,
    color: AppPalette.darkGrey,
  );

  static const kDivider = Divider(
    color: AppPalette.kAccentColor,
    thickness: kLessPadding,
  );

  static const kSmallDivider = Divider(
    color: AppPalette.kAccentColor,
    thickness: 5.0,
  );
}
