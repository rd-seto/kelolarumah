import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_app_bar.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/data/model/notification_model.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class NotificationDetails extends StatelessWidget {
  final bool? isBottomNav;
  final Datum? item;

  const NotificationDetails({super.key, this.isBottomNav, this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: isBottomNav == false
          ? PreferredSize(
              preferredSize: Size.fromHeight(70.h),
              child: const CustomAppBar(appBarName: 'Notification Details'),
            )
          : const PreferredSize(
              // ignore: sort_child_properties_last
              child: SizedBox(),
              preferredSize: Size.fromHeight(0)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: item?.title ?? "",
              color: AppColors.titleTextColor,
              fontSize: 18.sp,
              maxLine: 1,
              fontWeight: FontWeight.bold,
              height: 1.6,
            ),
            // CustomText(
            //   text: item?.createdAt ?? "",
            //   color: AppColors.colorPrimary,
            //   fontSize: 12.sp,
            //   maxLine: 1,
            //   fontWeight: FontWeight.bold,
            //   height: 1.6,
            // ),
            // const SizedBox(
            //   height: 10,
            // ),
            // Text(
            //   item?.description ?? "",
            //   style: TextStyle(
            //       color: Colors.black54,
            //       fontSize: 14.sp,
            //       fontWeight: FontWeight.bold,
            //       height: 1.6),
            // ),
          ],
        ),
      ),
    );
  }
}
