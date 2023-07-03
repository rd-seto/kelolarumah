
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum DeviceType { phone, tablet }

extension GetDeviceType on BuildContext {

  
  DeviceType deviceType() {

 final size = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    
    if (size.size.shortestSide < 500) {
      return DeviceType.phone;
    }
    return DeviceType.tablet;
  }
}
