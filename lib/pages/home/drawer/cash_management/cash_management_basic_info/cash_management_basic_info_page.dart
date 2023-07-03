import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_app_bar.dart';
import 'package:landlord/components/text_form_field.dart';
import 'package:landlord/pages/home/drawer/cash_management/cash_management_address_page/cash_management_address_page.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class CashManagementBasicInfoPage extends StatelessWidget {
  const CashManagementBasicInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBar(appBarName: 'Cash Management'),
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
                    hintText: "Name",
                    title: "Name",
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  const FromField(
                    hintText: "01XXXXXXXXXX",
                    title: "Phone Number",
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  const FromField(
                    hintText: "example@gmail.com",
                    title: "Email",
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  FromField(
                    hintText: "2023/02/15",
                    title: "Date",
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_month_outlined),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  const FromField(
                    hintText: "01xxxxxxxxxx",
                    title: "Nid No",
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  const FromField(
                    hintText: "BDXXXXXXXXXX",
                    title: "Passport No",
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 52.h,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            backgroundColor: AppColors.mainColorsh1),
                        onPressed: () {},
                        child: Row(
                          children: [
                            Text(
                              '2/3',
                              style: TextStyle(
                                letterSpacing: 1.sp,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              'NEXT',
                              style: TextStyle(
                                letterSpacing: 1.sp,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const Spacer(),
                            InkWell(
                                onTap: () {
                                  NavUtil.navigateScreen(context,
                                      const CashManagementAddressPage());
                                },
                                child: const Icon(Icons.double_arrow_outlined))
                          ],
                        )),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
