import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class NewTextFromField extends StatelessWidget {
  final Function()? onTap;
  final TextEditingController? controller;
  final String? title;
  final String? hintText;
  final IconButton? suffixIcon;
  final Icon? prefixIcon;
  const NewTextFromField(
      {Key? key,
      this.hintText,
      this.title,
      this.suffixIcon,
      this.controller,
      this.prefixIcon,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? '',
            style: TextStyle(
                letterSpacing: 1,
                color: AppColors.black2Sd,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700),
          ).tr(),
          SizedBox(
            height: 8.h,
          ),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.colorWhite,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                      color: AppColors.colorPrimary, width: 1.0),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 13.h, horizontal: 16.w),
                hintText: '$hintText'.tr(),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColors.stockColor),
                ),
                suffixIcon: suffixIcon,
                prefixIcon: prefixIcon,
                hintStyle: const TextStyle(
                    fontSize: 14,
                    color: AppColors.hintTextColor,
                    fontWeight: FontWeight.w400),
                border: const OutlineInputBorder()),
          )
        ],
      ),
    );
  }
}
