import 'dart:ui';

import 'package:flutter/material.dart';

enum DeviceScreenType {
  phone,
  tablet;

  const DeviceScreenType();

  bool get isPhone => this == phone;

  bool get isTablet => this == tablet;
}

class AppDeviceScreenType {
  static DeviceScreenType _type = DeviceScreenType.phone;

  DeviceScreenType get type => _type;

  bool get isPhone => _type.isPhone;

  bool get isTablet => _type.isTablet;

  Size get designSize {
    return isTablet ? const Size(834, 1194) : const Size(375, 812);
  }

  static Future<void> init() async {
    final views = PlatformDispatcher.instance.views;

    if (views.isNotEmpty) {
      final window = views.first;
      final isTablet = MediaQueryData.fromView(window).size.shortestSide > 600;

      _type = isTablet ? DeviceScreenType.tablet : DeviceScreenType.phone;
    }
  }
}
