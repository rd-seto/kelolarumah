import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/data/provider/tenant_property_details_provider.dart';
import 'package:landlord/pages/landlord/drawer/properties/properties_details/components/widgets/content_list_tile.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

class PropertyOwnerInfo extends StatelessWidget {
  const PropertyOwnerInfo({super.key, this.provider});

  final TenantPropertyDetailsProvider? provider;

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
                    height: 10.h,
                  ),
                  CustomText(
                    text: 'Landlord Information',
                    color: AppColors.titleTextColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    height: 1.75,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ContentListTile(
                    image: 'assets/drawer/size_ic.png',
                    color: AppColors.colorWhite,
                    title: "Name",
                    subTitle:
                        provider?.tenantPropertyDetailModel?.data?.user?.name ??
                            'N/A',
                  ),
                  ContentListTile(
                    image: 'assets/drawer/beds_ic.png',
                    color: Colors.transparent,
                    title: "Email",
                    subTitle: provider
                            ?.tenantPropertyDetailModel?.data?.user?.email ??
                        'N/A',
                  ),
                  ContentListTile(
                    image: 'assets/drawer/bath_ic.png',
                    color: Colors.white,
                    title: "Phone",
                    subTitle: provider
                            ?.tenantPropertyDetailModel?.data?.user?.phone ??
                        'N/A',
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
