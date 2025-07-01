import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'design_system_color.dart';
import 'design_system_text_style.dart';

ThemeData appTheme() {
  final iconThemeLight = ThemeData.light().iconTheme;

  return ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: kWhite,
    splashFactory: NoSplash.splashFactory,
    highlightColor: Colors.transparent,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    appBarTheme: AppBarTheme(
      color: kWhite,
      toolbarTextStyle: DesignSystemTextStyle.current.body2Bold,
      actionsIconTheme: const IconThemeData(color: kBlack),
      iconTheme: iconThemeLight.copyWith(color: kBlack, size: 24.w),
      titleTextStyle: DesignSystemTextStyle.current.body2Bold,
      elevation: 0.0,
    ),
    iconTheme: IconThemeData(color: kBlack, size: 24.w),
    chipTheme: const ChipThemeData(
      backgroundColor: Colors.transparent,
      disabledColor: Colors.transparent,
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.all(kMainPrimary),
    ),
    checkboxTheme: CheckboxThemeData(
      overlayColor: WidgetStateColor.resolveWith(
        (states) => Colors.transparent,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: DesignSystemTextStyle.current.body2Regular.copyWith(
        color: kTypographyBlackLow,
      ),
      floatingLabelStyle: DesignSystemTextStyle.current.body2Regular,
      hintStyle: DesignSystemTextStyle.current.body2Regular.copyWith(
        color: kTypographyBlackLow,
      ),
      helperStyle: DesignSystemTextStyle.current.caption.copyWith(
        color: kTypographyBlackLow,
      ),
      errorStyle: DesignSystemTextStyle.current.caption.copyWith(
        color: Colors.redAccent,
      ),
    ),
    typography: Typography.material2021(),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: kMainPrimary,
      onPrimary: kWhite,
      secondary: kMainPrimary,
      onSecondary: kWhite,
      error: Colors.redAccent,
      onError: kBlack,
      surface: kWhite,
      onSurface: kGrey1,
    ),
  );
}
