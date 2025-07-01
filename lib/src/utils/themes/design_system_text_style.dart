import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'design_system_color.dart';

class DesignSystemTextStyle {
  late BuildContext localContext;

  static DesignSystemTextStyle? _current;

  DesignSystemTextStyle(BuildContext context) {
    localContext = context;
  }

  static DesignSystemTextStyle get current => _current!;

  DesignSystemTextStyle.init(BuildContext context) {
    _current ??= DesignSystemTextStyle(context);
  }

  TextStyle get heading1 {
    return GoogleFonts.poppins(
      textStyle: Theme.of(localContext).textTheme.displayLarge!.copyWith(
        leadingDistribution: TextLeadingDistribution.even,
      ),
      fontSize: 48.sp,
      color: kTypographyBlackHigh,
      height: 56 / 48,
      fontWeight: FontWeight.bold,
      letterSpacing: 0,
    );
  }

  TextStyle get heading4 {
    return GoogleFonts.poppins(
      textStyle: Theme.of(localContext).textTheme.headlineMedium!.copyWith(
        leadingDistribution: TextLeadingDistribution.even,
      ),
      fontSize: 24.sp,
      color: kTypographyBlackHigh,
      fontWeight: FontWeight.bold,
      height: 32 / 24,
      letterSpacing: 0,
    );
  }

  TextStyle get body1Regular {
    return GoogleFonts.poppins(
      textStyle: Theme.of(localContext).textTheme.bodyLarge!.copyWith(
        leadingDistribution: TextLeadingDistribution.even,
      ),
      fontSize: 16.sp,
      color: kTypographyBlackHigh,
      fontWeight: FontWeight.normal,
      height: 24 / 16,
      letterSpacing: 0,
    );
  }

  TextStyle get body1Bold {
    return GoogleFonts.poppins(
      textStyle: Theme.of(localContext).textTheme.bodyLarge!.copyWith(
        leadingDistribution: TextLeadingDistribution.even,
      ),
      fontSize: 16.sp,
      color: kTypographyBlackHigh,
      fontWeight: FontWeight.bold,
      height: 24 / 16,
      letterSpacing: 0,
    );
  }

  TextStyle get body2Regular {
    return GoogleFonts.poppins(
      textStyle: Theme.of(localContext).textTheme.bodyMedium!.copyWith(
        leadingDistribution: TextLeadingDistribution.even,
      ),
      fontSize: 14.sp,
      color: kTypographyBlackHigh,
      fontWeight: FontWeight.normal,
      height: 20 / 14,
      letterSpacing: 0,
    );
  }

  TextStyle get body2Bold {
    return GoogleFonts.poppins(
      textStyle: Theme.of(localContext).textTheme.bodyMedium!.copyWith(
        leadingDistribution: TextLeadingDistribution.even,
      ),
      fontSize: 14.sp,
      color: kTypographyBlackHigh,
      fontWeight: FontWeight.bold,
      height: 20 / 14,
      letterSpacing: 0,
    );
  }

  TextStyle get body2BoldUnderline {
    return GoogleFonts.poppins(
      textStyle: Theme.of(localContext).textTheme.bodyMedium!.copyWith(
        leadingDistribution: TextLeadingDistribution.even,
        decoration: TextDecoration.underline,
      ),
      fontSize: 14.sp,
      color: kTypographyBlackHigh,
      fontWeight: FontWeight.bold,
      height: 20 / 14,
      letterSpacing: 0,
    );
  }

  TextStyle get caption {
    return GoogleFonts.poppins(
      textStyle: Theme.of(localContext).textTheme.bodySmall!.copyWith(
        leadingDistribution: TextLeadingDistribution.even,
      ),
      fontSize: 12.sp,
      color: kTypographyBlackHigh,
      fontWeight: FontWeight.normal,
      height: 16 / 12,
      letterSpacing: 0,
    );
  }

  TextStyle get captionBold {
    return GoogleFonts.poppins(
      textStyle: Theme.of(localContext).textTheme.bodySmall!.copyWith(
        leadingDistribution: TextLeadingDistribution.even,
      ),
      fontSize: 12.sp,
      color: kTypographyBlackHigh,
      fontWeight: FontWeight.bold,
      height: 16 / 12,
      letterSpacing: 0,
    );
  }

  TextStyle get footerRegular {
    return GoogleFonts.poppins(
      textStyle: Theme.of(localContext).textTheme.labelSmall!.copyWith(
        leadingDistribution: TextLeadingDistribution.even,
      ),
      fontSize: 10.sp,
      color: kTypographyBlackHigh,
      fontWeight: FontWeight.normal,
      height: 16 / 10,
      letterSpacing: 0.5,
    );
  }

  TextStyle get footerBold {
    return GoogleFonts.poppins(
      textStyle: Theme.of(localContext).textTheme.labelSmall!.copyWith(
        leadingDistribution: TextLeadingDistribution.even,
      ),
      fontSize: 10.sp,
      color: kTypographyBlackHigh,
      fontWeight: FontWeight.bold,
      height: 16 / 10,
      letterSpacing: 0.5,
    );
  }
}
