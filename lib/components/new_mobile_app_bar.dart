import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/data/local/local_auth_provider.dart';
import 'package:landlord/pages/landlord/drawer/profile_settings/profile_details_screen/profile_details_screen.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

import '../pages/landlord/home/notification/notification_screen.dart';

class NewMobileAppBar extends StatelessWidget {
  final String? appbarName;
  const NewMobileAppBar({super.key, this.appbarName});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<LocalAutProvider>(context, listen: false);
    return AppBar(
      centerTitle: true,
      leading: Padding(padding: EdgeInsets.only(left: 26.0.w, top: 8.h, bottom: 8.h),
        child: InkWell(
          onTap: () => Scaffold.of(context).openDrawer(),
          child: Image.asset('assets/dashboard/drawer_vector.png',),
        ),
      ),
      leadingWidth: 60.w,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.colorPrimary,
      elevation: 0,
      title: Text(appbarName!, style: TextStyle(fontSize: 18.sp, color: Colors.white, fontWeight: FontWeight.w700),).tr(),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 5),
          child: InkWell(
            onTap: () {
              NavUtil.navigateScreen(context, const NotificationScreen(isBottomNav: false,));
            },
            child: Image.asset('assets/dashboard/notification_vector.png'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: InkWell(
            onTap: () {
              NavUtil.navigateScreen(context, const ProfileDetailsScreen(isBottomNav: false,));
            },
            child: ClipOval(
              child: CachedNetworkImage(height: 30, width: 30, fit: BoxFit.cover, imageUrl: userProvider.getUser()?.avatar ?? '',
                placeholder: (context, url) => Center(child: Image.asset("assets/dashboard/placeholder_image.jpeg"),),
                errorWidget: (context, url, error) =>Image.asset("assets/dashboard/placeholder_image.jpeg")
              ),
            ),
          ),
        )
      ],
    );
  }
}
