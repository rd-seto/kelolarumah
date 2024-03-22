import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/theme/app_colors.dart';

import '../pages/landlord/home/notification/notification_screen.dart';

class HomePageAppBar extends StatelessWidget {
  final String? appbarName;
  const HomePageAppBar({super.key, this.appbarName});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: Padding(
        padding: EdgeInsets.only(left: 26.0.w, top: 8.h, bottom: 8.h),
        child: InkWell(
          onTap: () => Scaffold.of(context).openDrawer(),
          child: Image.asset(
            'assets/dashboard/drawer_vector.png',
          ),
        ),
      ),
      leadingWidth: 60,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.colorPrimary,
      elevation: 0,
      title: Text(
        appbarName!,
        style: TextStyle(
            fontSize: 18.sp, color: Colors.white, fontWeight: FontWeight.w700),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 5),
          child: InkWell(
            onTap: () {
              NavUtil.navigateScreen(context, const NotificationScreen());
            },
            child: Image.asset('assets/dashboard/notification_vector.png'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: InkWell(
            onTap: () {},
            child: Image.asset(
              'assets/dashboard/profile_vector.png',
            ),
          ),
        ),
      ],
    );
  }
}
