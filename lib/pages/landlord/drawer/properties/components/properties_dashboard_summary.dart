import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/data/model/property_list_model.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../data/provider/dashboard_provider.dart';
import '../../../../../data/provider/property_provider.dart';

class PropertiesDashboardSummary extends StatelessWidget {
  final PropertyListModel? data;
  final PropertyProvider? provider;
  const PropertiesDashboardSummary({super.key, this.data, this.provider});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            height: 100.h,
            decoration: BoxDecoration(
                color: const Color(0xff00B3DA),
                borderRadius: BorderRadius.circular(12.r)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: 'Total_Property',
                  color: AppColors.colorWhite,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
                provider?.propertyStatics?.total != null ?
                CustomText(
                        text: provider?.propertyStatics?.total.toString() ?? "0",
                        color: AppColors.colorWhite,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                      ) : Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        child: SizedBox( height : 15.h, width: 15.w, child: const CircularProgressIndicator(color: AppColors.colorWhite,)),
                )

              ],
            ),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            height: 100.h,
            decoration: BoxDecoration(
                color: AppColors.mainColorsh1,
                borderRadius: BorderRadius.circular(12.r)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: 'Occupied',
                  color: AppColors.colorWhite,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
                provider?.propertyStatics?.occupied != null ?
                CustomText(
                  text: provider?.propertyStatics?.occupied.toString() ?? "0",
                  color: AppColors.colorWhite,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ) : Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: SizedBox( height : 15.h, width: 15.w, child: const CircularProgressIndicator(color: AppColors.colorWhite,)),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            height: 100.h,
            decoration: BoxDecoration(
                color: AppColors.color2Orange,
                borderRadius: BorderRadius.circular(12.r)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: 'Vacant',
                  color: AppColors.colorWhite,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),provider?.propertyStatics?.vacant != null ?
                CustomText(
                  text: provider?.propertyStatics?.vacant.toString() ?? "0",
                  color: AppColors.colorWhite,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ) : Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: SizedBox( height : 15.h, width: 15.w, child: const CircularProgressIndicator(color: AppColors.colorWhite,)),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
