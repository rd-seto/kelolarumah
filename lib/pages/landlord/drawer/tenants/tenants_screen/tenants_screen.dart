import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_app_bar.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/data/provider/tenant_provider.dart';
import 'package:landlord/pages/landlord/drawer/tenants/add_tenants/add_tenants_screen.dart';
import 'package:landlord/pages/landlord/drawer/tenants/components/search_tenant_list.dart';
import 'package:landlord/pages/landlord/drawer/tenants/tenant_search/tenant_search_page.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

import '../components/tenant_list.dart';

class TenantsScreen extends StatefulWidget {
  final bool? isBottomNav;

  const TenantsScreen({super.key, this.isBottomNav});

  @override
  State<TenantsScreen> createState() => _TenantsScreenState();
}

class _TenantsScreenState extends State<TenantsScreen> {
  @override
  void initState() {
    context.read<TenantProvider>().tenantData(context);
    context.read<TenantProvider>().getTenantProperties(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TenantProvider>(context);
    return RefreshIndicator(
      onRefresh: () async {
        provider.tenantData(context);
      },
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: widget.isBottomNav == false
            ? PreferredSize(
                preferredSize: Size.fromHeight(70.h),
                child: const CustomAppBar(appBarName: 'Tenants'),
              )
            : const PreferredSize(
                // ignore: sort_child_properties_last
                child: SizedBox(),
                preferredSize: Size.fromHeight(0)),
        body: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height / 4,
              left: 0,
              right: 0,
              bottom: 0,
              child: Opacity(
                opacity: 0.5,
                child: Image.asset(
                  'assets/dashboard/backgorund_img.png',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // TenantsSummaryChart(
                  //   tenantModel: provider.tenantModel,
                  // ),
                  SizedBox(
                    height: 0.h,
                  ),
                  CustomText(
                    text: 'Tenants_List',
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
                                context, const TenantsSearchScreen());
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  color: AppColors.colorWhite,
                                  borderRadius: BorderRadius.circular(8),
                                  border:
                                      Border.all(color: AppColors.stockColor)),
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
                                          color: Colors.grey, fontSize: 16.r),
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
                    height: 8.h,
                  ),
                  Expanded(
                    child: TenantList(provider: provider),
                  ),
                  // : ListView.builder(
                  //     shrinkWrap: true,
                  //     physics: const NeverScrollableScrollPhysics(),
                  //     itemCount: 2,
                  //     itemBuilder: (context, index) {
                  //       return Padding(
                  //         padding: const EdgeInsets.all(16.0),
                  //         child: Shimmer.fromColors(
                  //           baseColor: const Color(0xFFE8E8E8),
                  //           highlightColor: Colors.white,
                  //           child: Container(
                  //             height: 120,
                  //             decoration: BoxDecoration(
                  //               color: const Color(0xFFE8E8E8),
                  //               borderRadius: BorderRadius.circular(8),
                  //             ),
                  //           ),
                  //         ),
                  //       );
                  //     },
                  //   ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: InkWell(
          onTap: () {
            NavUtil.navigateScreen(context, const AddTenantsScreen());
          },
          child: Image.asset(
            'assets/dashboard/add_float_button.png',
            height: 64.h,
            width: 64.w,
          ),
        ),
      ),
    );
  }
}
