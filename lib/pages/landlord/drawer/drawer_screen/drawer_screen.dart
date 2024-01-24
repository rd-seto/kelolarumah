import 'package:flutter/material.dart';
import 'package:landlord/data/local/local_auth_provider.dart';
import 'package:landlord/extention/device_type_extention.dart';

import 'package:landlord/pages/landlord/drawer/drawer_screen/mobile_drawer.dart';
import 'package:landlord/pages/landlord/drawer/drawer_screen/tablet_drawer_screen.dart';
import 'package:landlord/pages/landlord/drawer/drawer_screen/tenant_drawer.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocalAutProvider>(context, listen: false);
    final userData = provider.getUser();
    print('device type ${context.deviceType()}');
    if (context.deviceType() == DeviceType.tablet) {
      return const TabletAppDrawer();
    }
    if (userData?.roleId == 4) {
      return const MobileAppDrawer();
    }
    return const TenantAppDrawer();
  }
}
