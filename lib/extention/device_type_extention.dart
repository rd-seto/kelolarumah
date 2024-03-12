import 'package:flutter/material.dart';

enum DeviceTypeUtils { phone, tablet }

extension GetDeviceType on BuildContext {
  DeviceTypeUtils deviceType() {
    // ignore: deprecated_member_use
    final size = MediaQueryData.fromView(WidgetsBinding.instance.window);

    if (size.size.shortestSide < 500) {
      return DeviceTypeUtils.phone;
    }
    return DeviceTypeUtils.tablet;
  }
}
