import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/pages/home/drawer/properties/add_property/add_property_screen.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            // top: MediaQuery.of(context).size.height / 4,
            left: 0,
            right: 0,
            bottom: 0,
            child: Opacity(
              opacity: 1,
              child: Image.asset(
                'assets/dashboard/backgorund_img.png',
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/dashboard/home_ilustration.png',
                  height: 209.h,
                ),
                SizedBox(
                  height: 30.h,
                ),
                CustomText(
                  text: 'Welcome_To_Landlord',
                  color: AppColors.titleTextColor,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(
                  height: 8.h,
                ),
                CustomText(
                  textAlign: TextAlign.center,
                  text:
                      'You_are_no_your_way_to_better_property_management_Lets_Started',
                  color: AppColors.paraTxt1,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(
                  height: 40.h,
                ),
                SizedBox(
                  height: 61.h,
                  width: 274.w,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          backgroundColor: AppColors.colorPrimary),
                      onPressed: () {
                        NavUtil.navigateScreen(
                            context, const AddPropertyScreen());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/dashboard/home_fill.png',
                            height: 24.h,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            'Add_property',
                            style: TextStyle(
                              letterSpacing: 1.sp,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ).tr(),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
