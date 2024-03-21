import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_app_bar.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/data/provider/property_provider.dart';
import 'package:landlord/pages/landlord/drawer/properties/add_property/add_property_screen.dart';
import 'package:landlord/pages/landlord/drawer/properties/components/properties_dashboard_summary.dart';
import 'package:landlord/pages/landlord/drawer/properties/properties_details/properties_details_screen.dart';
import 'package:landlord/pages/landlord/drawer/properties/properties_screen/components/propertiesListContainer.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';

import 'components/property_list_screen.dart';

class PropertiesScreen extends StatefulWidget {
  const PropertiesScreen({super.key});

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
    // final provider = Provider.of<PropertyProvider>(context);
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
                            child: Container(
                              decoration: BoxDecoration(
                                  color: AppColors.colorWhite,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: AppColors.stockColor)),
                              child: TextFormField(
                                onChanged: (val) {
                                  provider.searchPropertyData(context, val);
                                },
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: Color(0xffBEBEBE),
                                    ),
                                    border: InputBorder.none),
                              ),
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
                      Expanded(child: PropertyListScreen(provider: provider,)),
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
