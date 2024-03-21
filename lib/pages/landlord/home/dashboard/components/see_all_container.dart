import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class SeeAllContainer extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final Function()? onTap;
  const SeeAllContainer({super.key, this.title, this.subTitle, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.0.h),
          topRight: Radius.circular(8.h),
        ),
        color: AppColors.colorWhite,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            CustomText(
              text: title,
              color: AppColors.titleTextColor,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
            ),
            const Spacer(),
            IconButton(
                onPressed: onTap,
                icon: const Icon(Icons.arrow_forward_ios_outlined))
            // InkWell(
            //   onTap: onTap,
            //   child: CustomText(
            //     text: subTitle,
            //     color: AppColors.titleTextColor,
            //     fontSize: 14.sp,
            //     fontWeight: FontWeight.w700,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
