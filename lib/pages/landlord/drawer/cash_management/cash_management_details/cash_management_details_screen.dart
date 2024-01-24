import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_app_bar.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/utils/theme/app_colors.dart';

import '../../../../../data/model/cashmanagement_list_model.dart';

class CashManagementDetailsScreen extends StatelessWidget {
  const CashManagementDetailsScreen(
      {super.key, this.cashManagementDetailsData});

  final ListElement? cashManagementDetailsData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBar(appBarName: 'CashManagement_Details'),
      ),
      body: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height / 4,
            left: 0,
            right: 0,
            bottom: 0,
            child: Opacity(
              opacity: 0.8,
              child: Image.asset(
                'assets/dashboard/backgorund_img.png',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0.w, right: 20.w, top: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: cashManagementDetailsData?.property ?? "",
                  color: AppColors.titleTextColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  height: 1.75,
                ),
                SizedBox(
                  height: 8.h,
                ),
                CustomText(
                  text: cashManagementDetailsData?.note ?? "",
                  color: AppColors.black2Sd,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
                SizedBox(
                  height: 20.h,
                ),
                TransactionTypeCart(
                  title: 'Property_Name:',
                  subTitle: cashManagementDetailsData?.property ?? "",
                ),
                SizedBox(
                  height: 12.h,
                ),
                TransactionTypeCart(
                  title: 'Tenants_Name:',
                  subTitle: cashManagementDetailsData?.tenant?.name ?? "",
                ),
                SizedBox(
                  height: 12.h,
                ),
                TransactionTypeCart(
                  title: 'Payment_Date:',
                  subTitle: cashManagementDetailsData?.appDate ?? "",
                ),
                SizedBox(
                  height: 12.h,
                ),
                TransactionTypeCart(
                  title: 'Payment_Type:',
                  subTitle: cashManagementDetailsData
                          ?.paymentDetails?.paymentMethod ??
                      "",
                ),
                SizedBox(
                  height: 30.h,
                ),
                CustomText(
                  text: 'File_Attachment',
                  color: AppColors.titleTextColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  height: 1.75,
                ),
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: AppColors.colorWhite,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10.0.sp),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/dashboard/pdf_img.png',
                          height: 38.h,
                          width: 30.w,
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomText(
                              text: 'NID.pdf',
                              color: AppColors.titleTextColor,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              height: 1.75,
                            ),
                            CustomText(
                              text: '7 Days Ago',
                              color: AppColors.titleTextColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              height: 1.75,
                            ),
                          ],
                        ),
                        const Spacer(),
                        CustomText(
                          text: '1.4 MB',
                          color: AppColors.titleTextColor,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                          height: 1.75,
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.more_vert,
                            color: AppColors.colorPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TransactionTypeCart extends StatelessWidget {
  final String? title;
  final String? subTitle;
  const TransactionTypeCart({super.key, this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(
          text: title,
          color: AppColors.titleTextColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          height: 1.75,
        ),
        SizedBox(
          width: 16.w,
        ),
        CustomText(
          text: subTitle,
          color: AppColors.paraTxt1,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          height: 1.75,
        ),
      ],
    );
  }
}
