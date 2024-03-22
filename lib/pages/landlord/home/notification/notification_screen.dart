import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_app_bar.dart';
import 'package:landlord/data/provider/notification_provider.dart';
import 'package:landlord/pages/landlord/home/notification/components/notification_list_cart.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatelessWidget {
  final bool? isBottomNav;

  const NotificationScreen({super.key, this.isBottomNav});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NotificationProvider>(context);
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: isBottomNav == false
            ? PreferredSize(
                preferredSize: Size.fromHeight(70.h),
                child: const CustomAppBar(appBarName: 'Notifications'),
              )
            : const PreferredSize(
                // ignore: sort_child_properties_last
                child: SizedBox(),
                preferredSize: Size.fromHeight(0)),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                NotificationListCart(
                  notificationResponse: provider.notificationResponse,
                  containerBackgroundColor: AppColors.colorWhite,
                ),
              ],
            ),
          ),
        ));
  }
}
