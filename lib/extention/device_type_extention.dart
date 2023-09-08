import 'package:flutter/material.dart';

enum DeviceType { phone, tablet }

extension GetDeviceType on BuildContext {
  DeviceType deviceType() {
    // ignore: deprecated_member_use
    final size = MediaQueryData.fromView(WidgetsBinding.instance.window);

    if (size.size.shortestSide < 500) {
      return DeviceType.phone;
    }
    return DeviceType.tablet;
  }
}
