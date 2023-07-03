import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/data/model/property_details_model.dart';
import 'package:landlord/pages/home/drawer/properties/properties_details/components/property_facilities/edit_facilities/edit_facilities_screen.dart';
import 'package:landlord/pages/home/drawer/properties/properties_details/components/widgets/content_list_tile.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

class PropertyFacilitiesCart extends StatelessWidget {
  const PropertyFacilitiesCart({
    super.key,
    this.facilities,
  });

  final List<Facility>? facilities;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, __, _) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30.h,
              ),
              CustomText(
                text: 'Facilities',
                color: AppColors.titleTextColor,
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(
                height: 30.h,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: facilities?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  final data = facilities?[index];
                  return ContentListTile(
                    image: 'assets/drawer/size_ic.png',
                    color: Colors.white,
                    title: data?.name ?? '',
                    subTitle: data?.content ?? '',
                  );
                },
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
                            context, const EditFacilitiesScreen());
                      },
                      child: Image.asset(
                        'assets/dashboard/edit_float_img.png',
                        height: 64.h,
                        width: 64.w,
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
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
