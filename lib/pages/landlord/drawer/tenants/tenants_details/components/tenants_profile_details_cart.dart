import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/data/model/tenants_details_model.dart';
import 'package:landlord/data/provider/tenants_details_provider.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class TenantsRowItem extends StatelessWidget {
  final BasicInfo? basicInfo;
  final TenantsDetailsProvider? provider;

  const TenantsRowItem({super.key, this.basicInfo, this.provider});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 20.h),
        child: Row(
          children: [
            ClipOval(
              child: CachedNetworkImage(
                height: 86.h,
                width: 86.w,
                fit: BoxFit.cover,
                imageUrl: provider?.tenantsDetailsResponse?.data?.avater ??
                    "https://t3.ftcdn.net/jpg/04/62/93/66/360_F_462936689_BpEEcxfgMuYPfTaIAOC1tCDurmsno7Sp.jpg",
                placeholder: (context, url) => Center(
                  child: Image.asset("assets/drawer/app_logo.png"),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            SizedBox(
              width: 16.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: provider?.tenantsDetailsResponse?.data?.name ?? "N/A",
                    color: AppColors.titleTextColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                  CustomText(
                    text: 'Contact No: ${provider?.tenantsDetailsResponse?.data?.phone == null ? "N/A" : provider?.tenantsDetailsResponse?.data?.phone.toString()} ',
                    color: AppColors.titleTextColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    height: 1.75,
                  ),
                  CustomText(
                    text:
                        'Email: ${provider?.tenantsDetailsResponse?.data?.email ?? "N/A"}',
                    color: AppColors.titleTextColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    height: 1.75,
                  ),
                  CustomText(
                    text:
                        'Address: ${provider?.tenantsDetailsResponse?.data?.presentAddress?.address ?? "N/A"}',
                    color: AppColors.titleTextColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    height: 1.75,
                  ),
                  CustomText(
                    text: 'Joined: ${basicInfo?.joinDate ?? "N/A"}',
                    color: AppColors.titleTextColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    height: 1.75,
                  ),
                  CustomText(
                    text:
                        'Nationality - ${provider?.tenantsDetailsResponse?.data?.nationality ?? "N/A"}',
                    color: AppColors.titleTextColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    height: 1.75,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
