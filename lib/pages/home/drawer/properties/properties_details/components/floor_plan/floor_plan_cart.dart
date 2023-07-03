import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/data/model/property_details_model.dart';
import 'package:landlord/pages/home/drawer/properties/properties_details/components/floor_plan/add_floor_plan/add_floor_plan.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class FloorPlanCart extends StatelessWidget {
  const FloorPlanCart({
    super.key,
    this.propertyFlorPlans,
  });
  final List<FloorPlan>? propertyFlorPlans;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.h,
          ),
          CustomText(
            text: 'Floor_Plans',
            color: AppColors.titleTextColor,
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(
            height: 20.h,
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: propertyFlorPlans?.length ?? 0,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 150,
                crossAxisCount: 2,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 4.0),
            itemBuilder: (BuildContext context, int index) {
              final data = propertyFlorPlans?[index];
              return Image.network(data?.path ?? '');
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.mainColorsh1),
                  color: AppColors.colorWhite,
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 8.h),
                child: CustomText(
                  text: 'Load_More',
                  color: AppColors.mainColorsh1,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  height: 1.75,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          InkWell(
            onTap: () {
              NavUtil.navigateScreen(context, const AddFloorPlanScreen());
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.all(16.sp),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.colorPrimary),
                    child: const Icon(
                      Icons.add,
                      color: AppColors.colorWhite,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}
