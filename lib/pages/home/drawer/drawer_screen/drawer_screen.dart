import 'package:flutter/material.dart';
import 'package:landlord/extention/device_type_extention.dart';

import 'package:landlord/pages/home/drawer/drawer_screen/mobile_drawer.dart';
import 'package:landlord/pages/home/drawer/drawer_screen/tablet_drawer_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    print('device type ${context.deviceType()}');

    // if(context.deviceType() == DeviceType.tablet)

    if (context.deviceType() == DeviceType.tablet) {
      return const TabletAppDrawer(); 
    }
    return const MobileAppDrawer();
  }
}
