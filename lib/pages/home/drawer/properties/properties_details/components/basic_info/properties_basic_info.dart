import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/data/model/property_details_model.dart';
import 'package:landlord/data/provider/property_details_edit_provider.dart';
import 'package:landlord/data/provider/property_details_provider.dart';
import 'package:landlord/data/provider/property_provider.dart';
import 'package:landlord/pages/home/drawer/properties/properties_details/components/basic_info/edit_basic_info/edit_property_basic_info_screen.dart';
import 'package:landlord/pages/home/drawer/properties/properties_details/components/widgets/content_list_tile.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

class PropertiesBasicInfo extends StatelessWidget {
  const PropertiesBasicInfo(
      {super.key, this.propertyBasicInfo, this.pID, this.provider});
  final Property? propertyBasicInfo;
  final int? pID;
  final PropertyDetailsProvider? provider;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, __, _) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              CustomText(
                text: 'Overview',
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
                title: "Size",
                subTitle: propertyBasicInfo?.size ?? 'N/A',
              ),
              ContentListTile(
                image: 'assets/drawer/beds_ic.png',
                color: Colors.transparent,
                title: "Beds",
                subTitle: "${propertyBasicInfo?.bedroom ?? 'N/A'}",
              ),
              ContentListTile(
                image: 'assets/drawer/bath_ic.png',
                color: Colors.white,
                title: "Bath",
                subTitle: "${propertyBasicInfo?.bathroom ?? 'N/A'}",
              ),
              ContentListTile(
                image: 'assets/drawer/rent_ic.png',
                color: Colors.transparent,
                title: "Rent",
                subTitle: "${propertyBasicInfo?.rentAmount ?? 'N/A'}",
              ),
              ContentListTile(
                image: 'assets/drawer/type-ic.png',
                color: Colors.white,
                title: "Type",
                subTitle: propertyBasicInfo?.type ?? 'N/A',
              ),
              ContentListTile(
                image: 'assets/drawer/completion-ic.png',
                color: Colors.transparent,
                title: "Completion",
                subTitle: propertyBasicInfo?.completion ?? 'N/A',
              ),
              SizedBox(
                height: 30.h,
              ),
              CustomText(
                text: "Description",
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
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        NavUtil.navigateScreen(
                            context,
                            EditPropertyBasicInfo(
                              propertyId: pID,
                              onSave: () {
                                provider?.propertyDetails(context, pID);
                              },
                            ));
                      },
                      child: Image.asset(
                        'assets/dashboard/edit_float_img.png',
                        height: 64.h,
                        width: 64.w,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
