import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/data/model/property_list_model.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class PropertiesDashboardSummary extends StatelessWidget {
  final PropertyListModel? data;
  const PropertiesDashboardSummary({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
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
                data?.data?.statistics != null
                    ? CustomText(
                        text: data?.data?.statistics?.total.toString(),
                        color: AppColors.colorWhite,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                      )
                    : Shimmer.fromColors(
                        baseColor: const Color(0xFFE8E8E8),
                        highlightColor: Colors.white,
                        child: CustomText(
                          text: '',
                          color: const Color(0xFFE8E8E8),
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          child: Container(
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
                data?.data?.statistics != null
                    ? CustomText(
                        text: data?.data?.statistics?.occupied.toString(),
                        color: AppColors.colorWhite,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                      )
                    : Shimmer.fromColors(
                        baseColor: const Color(0xFFE8E8E8),
                        highlightColor: Colors.white,
                        child: CustomText(
                          text: '',
                          color: const Color(0xFFE8E8E8),
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          child: Container(
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
                ),
                data?.data?.statistics != null
                    ? CustomText(
                        text: data?.data?.statistics?.vacant.toString(),
                        color: AppColors.colorWhite,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                      )
                    : SizedBox(
                        height: 20,
                        width: 30,
                        child: Shimmer.fromColors(
                          baseColor: const Color(0xFFE8E8E8),
                          highlightColor: Colors.black,
                          child: CustomText(
                            text: '',
                            color: const Color(0xFFE8E8E8),
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
