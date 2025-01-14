import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/data/model/tenant_property_details.dart';
import 'package:landlord/data/provider/property_details_provider.dart';
import 'package:landlord/pages/landlord/drawer/properties/properties_details/components/widgets/content_list_tile.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

class TenantPropertiesBasicInfo extends StatelessWidget {
  const TenantPropertiesBasicInfo(
      {super.key, this.propertyBasicInfo, this.pID, this.provider});
  final Property? propertyBasicInfo;
  final int? pID;
  final PropertyDetailsProvider? provider;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, __, _) {
        return Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomText(
                    text: 'overview',
                    color: AppColors.titleTextColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    height: 1.75,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ContentListTile(
                    image: 'assets/drawer/size_ic.png',
                    color: AppColors.colorWhite,
                    title: "Size".tr(),
                    subTitle: propertyBasicInfo?.size ?? 'N/A',
                  ),
                  ContentListTile(
                    image: 'assets/drawer/beds_ic.png',
                    color: Colors.transparent,
                    title: "beds".tr(),
                    subTitle: "${propertyBasicInfo?.bedroom ?? 'N/A'}",
                  ),
                  ContentListTile(
                    image: 'assets/drawer/bath_ic.png',
                    color: Colors.white,
                    title: "bath".tr(),
                    subTitle: "${propertyBasicInfo?.bathroom ?? 'N/A'}",
                  ),
                  ContentListTile(
                    image: 'assets/drawer/rent_ic.png',
                    color: Colors.transparent,
                    title: "Rent".tr(),
                    subTitle: "${propertyBasicInfo?.totalRent ?? 'N/A'}",
                  ),
                  ContentListTile(
                    image: 'assets/drawer/type-ic.png',
                    color: Colors.white,
                    title: "Type".tr(),
                    subTitle: propertyBasicInfo?.type ?? 'N/A',
                  ),
                  ContentListTile(
                    image: 'assets/drawer/completion-ic.png',
                    color: Colors.transparent,
                    title: "Completion".tr(),
                    subTitle: propertyBasicInfo?.completion ?? 'N/A',
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomText(
                    text: "Description".tr(),
                    color: AppColors.titleTextColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    height: 1.75,
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  CustomText(
                    text: propertyBasicInfo?.description ?? '',
                    color: AppColors.black2Sd,
                    textAlign: TextAlign.justify,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    height: 1.75,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            ),
            // Positioned(
            //   bottom: 0,
            //   right: 0,
            //   child: Padding(
            //     padding: const EdgeInsets.only(right: 10.0),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.end,
            //       children: [
            //         InkWell(
            //           onTap: () {
            //             NavUtil.navigateScreen(
            //                 context,
            //                 EditPropertyBasicInfo(
            //                   propertyId: pID,
            //                   onSave: () {
            //                     provider?.propertyDetails(context, pID);
            //                   },
            //                 ));
            //           },
            //           child: Image.asset(
            //             'assets/dashboard/edit_float_img.png',
            //             height: 64.h,
            //             width: 64.w,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // )
          ],
        );
      },
    );
  }
}
