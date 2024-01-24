import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_app_bar.dart';
import 'package:landlord/pages/tenants/my_wishlist/content/wishlist_content.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class MyWishlistPage extends StatelessWidget {
  const MyWishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: CustomAppBar(appBarName: "My Wishlist".tr()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0.sp),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [WishlistContent()],
          ),
        ),
      ),
    );
  }
}
