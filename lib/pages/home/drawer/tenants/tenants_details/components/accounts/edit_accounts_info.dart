import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_app_bar.dart';
import 'package:landlord/components/elevated_button_widget.dart';
import 'package:landlord/components/text_form_field.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class EditAccountsInfo extends StatelessWidget {
  const EditAccountsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBar(appBarName: 'Edit_Accounts'),
      ),
      body: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height / 4,
            left: 0,
            right: 0,
            bottom: 0,
            child: Opacity(
              opacity: 0.5,
              child: Image.asset(
                'assets/dashboard/backgorund_img.png',
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20.0.sp),
              child: Column(
                children: [
                  SizedBox(
                    height: 12.h,
                  ),
                  const FromField(
                    hintText: "15235328",
                    title: "Account_No",
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  const FromField(
                    hintText: "Jenny Wilson",
                    title: "Account_Holder_Name",
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  const FromField(
                    hintText: "HSBC",
                    title: "Bank_Name",
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  const FromField(
                    hintText: "Banani ",
                    title: "Branch_Name",
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  SizedBox(
                    height: 50,
                    width: 150,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            backgroundColor: AppColors.colorPrimary),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/dashboard/save_vector.png',
                              height: 24.h,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              'Save',
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
          ),
        ],
      ),
    );
  }
}
