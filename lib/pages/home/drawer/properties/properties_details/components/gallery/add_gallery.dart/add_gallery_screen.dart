import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_app_bar.dart';
import 'package:landlord/components/elevated_button_widget.dart';
import 'package:landlord/components/new_text_form_field.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class AddGalleryScreen extends StatelessWidget {
  const AddGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBar(appBarName: 'Add_Gallery'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0.sp),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: const NewTextFromField(
                title: "Title",
                hintText: "Bedroom",
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: DottedBorder(
                  dashPattern: const [8, 4],
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(8),
                  color: AppColors.colorPrimary,
                  strokeWidth: 1,
                  child: Container(
                    height: 88.h,
                    width: double.infinity,
                    color: AppColors.colorWhite,
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                            text: "Choose_a_file".tr(),
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.titleTextColor,
                            ),
                            children: [
                              TextSpan(
                                text: 'Or_drag_it_here'.tr(),
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff828282),
                                ),
                              )
                            ]),
                      ),
                    ),
                  )),
            ),
            SizedBox(
              height: 20.h,
            ),
            ElevatedButtonWidget(
              text: "Save",
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
