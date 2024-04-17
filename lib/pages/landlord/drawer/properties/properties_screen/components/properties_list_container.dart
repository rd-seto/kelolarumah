import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/data/provider/property_provider.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

class PropertiesListContainer extends StatelessWidget {
  final String? title;
  final String? tenanted;
  final String? vacant;
  final String? image;
  final int? id;
  final VoidCallback onSave;
  final Color? containerColor;
  final Function()? onTap;
  const PropertiesListContainer(
      {super.key,
      this.containerColor,
      this.title,
      this.id,
      this.tenanted,
      this.vacant,
      this.onTap,
      required this.onSave,
      this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: containerColor ?? AppColors.colorWhite,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.stockColor)),
        child: Padding(
          padding: EdgeInsets.all(8.0.sp),
          child: Row(
            children: [
              Container(
                height: 54.h,
                width: 54.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  image: DecorationImage(
                      image: NetworkImage(
                        image ?? '',
                      ),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(
                width: 16.w,
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            height: 1,
                            text: title ?? '',
                            color: AppColors.titleTextColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(height: 8.h),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 6.r,
                                backgroundColor: AppColors.mainColorsh2,
                              ),
                              SizedBox(width: 4.w),
                              CustomText(
                                height: 1,
                                text: '${tenanted == "null" ? '0' : tenanted}'
                                    .tr(),
                                color: AppColors.mainColorsh2,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),
                              SizedBox(width: 16.w),
                              CircleAvatar(
                                radius: 6.r,
                                backgroundColor: AppColors.color2Sd,
                              ),
                              SizedBox(width: 4.w),
                              CustomText(
                                height: 1,
                                text: '${vacant == "null" ? "0" : vacant}',
                                color: AppColors.color2Sd,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    PopupMenuButton(
                      color: Colors.white,
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          onTap: () {
                            context
                                .read<PropertyProvider>()
                                .propertyDelete(context, id, () {
                              onSave();
                            });
                          },
                          child: const Row(
                            children: [
                              Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text('Delete'),
                            ],
                          ),
                        ),
                        // const PopupMenuItem(
                        //   child: Row(
                        //     children: [
                        //       Icon(
                        //         Icons.edit_document,
                        //         color: Colors.green,
                        //       ),
                        //       SizedBox(
                        //         width: 8,
                        //       ),
                        //       Text('Update'),
                        //     ],
                        //   ),
                        // ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
