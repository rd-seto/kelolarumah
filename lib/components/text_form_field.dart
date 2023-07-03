import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class FromField extends StatelessWidget {
  final Function(String)? onChange;
  final TextEditingController? controller;
  final String? title;
  final String? hintText;
  final IconButton? suffixIcon;
  final Icon? prefixIcon;
  const FromField(
      {Key? key,
      this.hintText,
      this.title,
      this.suffixIcon,
      this.controller,
      this.prefixIcon,
      this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '$title',
                  style: TextStyle(
                      letterSpacing: 1,
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700),
                ).tr(),
                Text(
                  '*',
                  style: TextStyle(
                      letterSpacing: 1,
                      color: Colors.red,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            TextFormField(
              controller: controller,
              onChanged: onChange,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.colorWhite,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:

                        const BorderSide(color: AppColors.colorPrimary, width: 1.0),

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
      ),
    );
  }
}
