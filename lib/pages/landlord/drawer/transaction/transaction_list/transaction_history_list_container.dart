import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class TransactionHistoryListContainer extends StatelessWidget {
  const TransactionHistoryListContainer(
      {super.key,
      this.containerColor,
      this.tittle,
      this.propertyName,
      this.amount,
      this.date,
      this.onTap});

  final Color? containerColor;
  final String? tittle, propertyName, date, amount;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: containerColor ?? AppColors.colorWhite,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: AppColors.stockColor2)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 16.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: tittle ?? "",
                    color: AppColors.titleTextColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    height: 1.75,
                  ),
                  Row(
                    children: [
                      Image.asset('assets/dashboard/file_vector.png',
                          height: 16.h),
                      SizedBox(
                        width: 8.w,
                      ),
                      CustomText(
                        text: '1 Attachment',
                        color: AppColors.black2Sd,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        height: 1.75,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset('assets/dashboard/propertise_vector.png',
                          height: 16.h),
                      SizedBox(
                        width: 8.w,
                      ),
                      CustomText(
                        text: propertyName ?? "",
                        color: AppColors.black2Sd,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        height: 1.75,
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomText(
                    text: amount ?? "",
                    color: const Color(0xff00BF08),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    height: 1.75,
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  CustomText(
                    text: date,
                    color: AppColors.black2Sd,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    height: 1.75,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
