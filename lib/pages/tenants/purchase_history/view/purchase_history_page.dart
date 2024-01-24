import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_app_bar.dart';
import 'package:landlord/pages/tenants/dashboard/content/purchase_history_cart.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

class PurchaseHistoryPage extends StatelessWidget {
  final bool? isBottomNav;

  const PurchaseHistoryPage({super.key, this.isBottomNav});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, __, _) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          appBar: isBottomNav == false
              ? PreferredSize(
                  preferredSize: Size.fromHeight(60.h),
                  child: CustomAppBar(appBarName: "Purchase History".tr()),
                )
              : const PreferredSize(
                  // ignore: sort_child_properties_last
                  child: SizedBox(),
                  preferredSize: Size.fromHeight(0)),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20.0.sp),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PurchaseHistoryCart(),
                  PurchaseHistoryCart(),
                  PurchaseHistoryCart(),
                  PurchaseHistoryCart(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
