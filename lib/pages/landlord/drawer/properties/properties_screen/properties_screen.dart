import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_app_bar.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/data/provider/property_provider.dart';
import 'package:landlord/pages/landlord/drawer/properties/add_property/add_property_screen.dart';
import 'package:landlord/pages/landlord/drawer/properties/components/properties_dashboard_summary.dart';
import 'package:landlord/pages/landlord/drawer/properties/properties_screen/properties_list_search.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

import '../../../../../data/provider/dashboard_provider.dart';
import 'components/property_list_screen.dart';

class PropertiesScreen extends StatefulWidget {
  const PropertiesScreen({super.key,});

  @override
  State<PropertiesScreen> createState() => _PropertiesScreenState();
}

class _PropertiesScreenState extends State<PropertiesScreen> {
  @override
  void initState() {
    context.read<PropertyProvider>().propertyData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PropertyProvider(context),
      child: Consumer<PropertyProvider>(
        builder: (BuildContext context, provider, _) {
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(70.h),
              child: const CustomAppBar(appBarName: 'Properties'),
            ),
            body: Stack(
              children: [
                Positioned(
                  // top: MediaQuery.of(context).size.height / 4,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Image.asset(
                    'assets/dashboard/backgorund_img.png',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Dashboard//
                      PropertiesDashboardSummary(
                        provider: provider,
                          data: provider.propertyListResponse),
                      SizedBox(
                        height: 30.h,
                      ),
                      CustomText(
                        text: 'Properties',
                        color: AppColors.titleTextColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                NavUtil.navigateScreen(
                                    context, const PropertiesListSearch());
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.colorWhite,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: AppColors.stockColor)),
                                  child: Container(
                                    padding: EdgeInsets.only(left: 12.w),
                                    height: 45,
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.search,
                                          color: Colors.grey,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Search here',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 16.r),
                                        )
                                      ],
                                    ),
                                  )),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.0.w, vertical: 15.h),
                              child: const Icon(
                                Icons.filter_list,
                                color: AppColors.colorPrimary,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Expanded(
                          child: PropertyListScreen(
                        provider: provider,
                      )),
                    ],
                  ),
                ),
              ],
            ),
            floatingActionButton: InkWell(
              onTap: () {
                NavUtil.navigateScreen(context, const AddPropertyScreen());
              },
              child: Image.asset(
                'assets/dashboard/add_float_button.png',
                height: 64.h,
                width: 64.w,
              ),
            ),
          );
        },
      ),
    );
  }
}
