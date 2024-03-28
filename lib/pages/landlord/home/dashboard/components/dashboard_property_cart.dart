import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/data/provider/dashboard_provider.dart';
import 'package:landlord/pages/landlord/drawer/properties/properties_details/properties_details_screen.dart';
import 'package:landlord/pages/landlord/drawer/properties/properties_screen/components/propertiesListContainer.dart';
import 'package:landlord/pages/landlord/drawer/properties/properties_screen/properties_screen.dart';
import 'package:landlord/pages/landlord/home/dashboard/components/see_all_container.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/no_data_found_widget.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class DashboardPropertyCart extends StatelessWidget {
  const DashboardPropertyCart({
    super.key,
    required this.provider,
  });

  final DashBoardProvider provider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 16.h,
        ),
        SeeAllContainer(
          onTap: () {
            NavUtil.navigateScreen(context, const PropertiesScreen());
          },
          title: "Properties",
        ),
        SizedBox(
          height: 8.h,
        ),
        provider.dashboardResponse?.data?.properties?.isNotEmpty == true
            ? Container(
                padding: EdgeInsets.all(10.sp),
                color: AppColors.colorWhite,
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: provider
                              .dashboardResponse?.data?.properties?.length ??
                          0,
                      itemBuilder: (context, index) {
                        final data = provider
                            .dashboardResponse?.data?.properties?[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0.h),
                          child: InkWell(
                            onTap: () {
                              NavUtil.navigateScreen(
                                context,
                                PropertiesDetailsScreen(
                                  propertyId: data!.id!,
                                ),
                              );
                            },
                            child: PropertiesListContainer(
                              image: data?.image,
                              title: data?.name,
                              tenanted: data?.dealType ?? "",
                              vacant: data?.type ?? "",
                              containerColor: AppColors.backgroundColor,
                              onSave: () {
                                provider.dashboardData(context);
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            : const NoDataFoundWidget(),
      ],
    );
  }
}
