import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:landlord/components/new_mobile_app_bar.dart';
import 'package:landlord/components/new_tablet_app_bar.dart';
import 'package:landlord/data/provider/bottom_nav_provider.dart';
import 'package:landlord/extention/device_type_extention.dart';
import 'package:landlord/pages/landlord/drawer/drawer_screen/drawer_screen.dart';
import 'package:landlord/pages/landlord/drawer/profile_settings/profile_settings_screen/profile_settings_screen.dart';
import 'package:landlord/pages/landlord/drawer/tenants/tenants_screen/tenants_screen.dart';
import 'package:landlord/pages/landlord/home/home_screen/home_screen.dart';
import 'package:landlord/pages/landlord/home/notification/notification_screen.dart';
import 'package:landlord/pages/tenants/dashboard/view/tenant_dashbord.dart';
import 'package:provider/provider.dart';

class TenantBottomNavBar extends StatefulWidget {
  final int? bottomNavigationIndex;

  const TenantBottomNavBar({Key? key, this.bottomNavigationIndex})
      : super(key: key);

  @override
  State<TenantBottomNavBar> createState() => _TenantBottomNavBarState();
}

class _TenantBottomNavBarState extends State<TenantBottomNavBar> {
  int selectedIndex = 2;
  String? barName = "Dashboard".tr();
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    ProfileSettingsScreen(isBottomNav: true),
    TenantDashboardScreen(isBottomNav: true),
    NotificationScreen(isBottomNav: true),
    TenantsScreen(isBottomNav: true),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      appBarName(selectedIndex);
    });
  }

  void appBarName(int radians) {
    switch (radians) {
      case 0:
        barName = "Property".tr();
        break;
      case 1:
        barName = "Profile Details".tr();
        break;
      case 2:
        barName = "Dashboard".tr();
        break;
      case 3:
        barName = "Notifications".tr();
        break;
      case 4:
        barName = "Tenants".tr();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final provider = context.watch<BottomNavProvider>();
    DateTime timeBackPressed = DateTime.now();
    // ignore: unused_local_variable
    final PageController myPage =
        PageController(initialPage: widget.bottomNavigationIndex ?? 0);

    return WillPopScope(
      onWillPop: () async {
        final differences = DateTime.now().difference(timeBackPressed);
        timeBackPressed = DateTime.now();
        if (differences >= const Duration(seconds: 2)) {
          String msg = "Press the back button to exit";
          Fluttertoast.showToast(
            msg: msg,
          );
          return false;
        } else {
          Fluttertoast.cancel();
          SystemNavigator.pop();
          return true;
        }
      },
      child: Scaffold(
        drawer: const AppDrawer(),
        appBar: context.deviceType() == DeviceType.phone
            ? PreferredSize(
                preferredSize: Size.fromHeight(60.h),
                child: NewMobileAppBar(
                  appbarName: barName,
                ))
            : PreferredSize(
                preferredSize: Size.fromHeight(40.h),
                child: NewTabletAppBar(
                  appbarName: barName,
                )),
        body: Center(
          child: _widgetOptions.elementAt(selectedIndex),
        ),
        /* bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(1, 1),
              ),
            ],
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          ),
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            elevation: 2,
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            selectedIconTheme:
                const IconThemeData(color: AppColors.colorPrimary),
            selectedItemColor: AppColors.colorPrimary,
            showUnselectedLabels: true,
            unselectedItemColor: Colors.grey,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: selectedIndex == 0
                    ? Image.asset(
                        'assets/navicon/active 1.png',
                        height: 24.h,
                        width: 24.w,
                      )
                    : Image.asset(
                        'assets/navicon/In Active 1.png',
                        height: 24.h,
                        width: 24.w,
                      ),
                label: 'Property',
              ),
              BottomNavigationBarItem(
                icon: selectedIndex == 1
                    ? Image.asset(
                        'assets/navicon/Active 2.png',
                        height: 24.h,
                        width: 24.w,
                      )
                    : Image.asset(
                        'assets/navicon/in active 2.png',
                        height: 24.h,
                        width: 24.w,
                      ),
                label: 'Profile',
              ),
              const BottomNavigationBarItem(
                  backgroundColor: AppColors.colorWhite,
                  icon: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                icon: selectedIndex == 3
                    ? Image.asset(
                        'assets/navicon/Active 3.png',
                        height: 24.h,
                        width: 24.w,
                      )
                    : Image.asset(
                        'assets/navicon/in active 3.png',
                        height: 24.h,
                        width: 24.w,
                      ),
                label: 'Notification',
              ),
              BottomNavigationBarItem(
                icon: selectedIndex == 4
                    ? Image.asset(
                        'assets/navicon/active 4.png',
                        height: 24.h,
                        width: 24.w,
                      )
                    : Image.asset(
                        'assets/navicon/in active 4.png',
                        height: 24.h,
                        width: 24.w,
                      ),
                label: 'Tenants',
              ),
            ],
            onTap: (index) {
              _onItemTapped(index);
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          elevation: 10,
          backgroundColor: AppColors.colorWhite,
          child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: selectedIndex == 2
                      ? AppColors.colorPrimary
                      : const Color(0xFF9E9AE3),
                  borderRadius: BorderRadius.circular(30)),
              child: const Icon(
                Icons.dashboard_outlined,
                size: 20,
              )),
          onPressed: () {
            // NavUtil.navigateScreen(context, MenuScreen());
            setState(() {
              _onItemTapped(2);
            });
          },
        ),*/
      ),
    );
  }
}
