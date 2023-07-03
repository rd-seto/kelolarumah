import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/data/model/tenants_details_model.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class DocumentsSummaryCart extends StatelessWidget {
  final List<Document>? document;
  const DocumentsSummaryCart({super.key, this.document});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          ListView.builder(
              shrinkWrap: true,
              itemCount: document?.length ?? 0,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  color: AppColors.colorWhite,
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
                              text: document?[index].filename ?? "N/A",
                              color: AppColors.titleTextColor,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              height: 1.75,
                            ),
                            CustomText(
                              text: document?[index].date ?? "N/A",
                              color: AppColors.titleTextColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              height: 1.75,
                            ),
                          ],
                        ),
                        const Spacer(),
                        CustomText(
                          text: document?[index].size ?? "N/A",
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
                );
              }),
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
                  color: const Color(0xffF2F2F2),
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
        ],
      ),
    );
  }
}
