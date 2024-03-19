import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_app_bar.dart';
import 'package:landlord/data/local/local_auth_provider.dart';
import 'package:landlord/data/provider/dashboard_provider.dart';
import 'package:landlord/pages/landlord/home/dashboard/components/dashbaord_info_list_cart.dart';
import 'package:landlord/pages/landlord/home/dashboard/components/greeting_scetion_cart.dart';
import 'package:landlord/pages/landlord/home/dashboard/components/grid_dashboard_summary_cart.dart';
import 'package:landlord/pages/landlord/home/dashboard/components/see_all_container.dart';
import 'package:landlord/pages/landlord/drawer/properties/properties_details/properties_details_screen.dart';
import 'package:landlord/pages/landlord/drawer/properties/properties_screen/properties_screen.dart';
import 'package:landlord/pages/landlord/drawer/tenants/tenants_details/components/transaction_details/transaction_details_screen.dart';
import 'package:landlord/pages/landlord/drawer/transaction/transaction_list/transaction_list_screen.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';
import '../../drawer/properties/properties_screen/components/propertiesListContainer.dart';
import '../../drawer/transaction/transaction_list/transaction_history_list_container.dart';

class DashboardScreen extends StatelessWidget {
  final bool? isBottomNav;

  const DashboardScreen({super.key, this.isBottomNav});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DashBoardProvider>(context);
    final userProvider = Provider.of<LocalAutProvider>(context, listen: false);
    return Consumer(
      builder: (context, __, _) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          appBar: isBottomNav == false
              ? PreferredSize(
                  preferredSize: Size.fromHeight(60.h),
                  child: CustomAppBar(appBarName: "Dashboard".tr()),
                )
              : const PreferredSize(
                  // ignore: sort_child_properties_last
                  child: SizedBox(),
                  preferredSize: Size.fromHeight(0)),
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
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20.0.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GreetingsSectionCart(
                          name:
                              "Hi ${userProvider.getUser()?.name ?? ''}".tr()),
                      SizedBox(
                        height: 20.h,
                      ),
                      GridDashboardSummaryCart(
                          gridDashboardData: provider.gridDashboardData),
                      SizedBox(
                        height: 24.h,
                      ),
                      DashboardInfoListCart(
                        title: "Total_Property".tr(),
                        subTitle: provider
                            .dashboardRespone?.data?.totalProperties
                            .toString(),
                        containerColor: const Color(0xff00B3DA),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      DashboardInfoListCart(
                        title: "Occupied",
                        subTitle: provider.dashboardRespone?.data?.totalOccupied
                            .toString(),
                        containerColor: AppColors.colorPrimary,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      DashboardInfoListCart(
                        title: "Vacant",
                        subTitle: provider.dashboardRespone?.data?.totalVacant
                            .toString(),
                        containerColor: AppColors.color2Sd,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      SeeAllContainer(
                          onTap: () {
                            NavUtil.navigateScreen(
                                context, const PropertiesScreen());
                          },
                          title: "Properties",
                          subTitle: "See_All"),
                      SizedBox(
                        height: 8.h,
                      ),
                      Container(
                        padding: EdgeInsets.all(10.sp),
                        color: AppColors.colorWhite,
                        child: Column(
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: provider.dashboardRespone?.data
                                      ?.properties?.length ??
                                  0,
                              itemBuilder: (context, index) {
                                final data = provider
                                    .dashboardRespone?.data?.properties?[index];
                                return Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 8.0.h),
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
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SeeAllContainer(
                          onTap: () {
                            NavUtil.navigateScreen(
                                context, const TransactionListScreen());
                          },
                          title: "Transaction_History",
                          subTitle: "See_All"),
                      SizedBox(
                        height: 8.h,
                      ),
                      Container(
                        padding: EdgeInsets.all(10.sp),
                        color: AppColors.colorWhite,
                        child: Column(
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: provider.dashboardRespone?.data
                                      ?.transactions?.length ??
                                  0,
                              itemBuilder: (context, index) {
                                final data = provider.dashboardRespone?.data
                                    ?.transactions?[index];
                                return Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 8.0.h),
                                  child: TransactionHistoryListContainer(
                                    containerColor: AppColors.backgroundColor,
                                    onTap: () {
                                      NavUtil.navigateScreen(
                                          context,
                                          TransactionsDetailsScreen(
                                            transactionId: data?.id,
                                          ));
                                    },
                                    tittle: data?.paymentMethod ?? "",
                                    propertyName: data?.type ?? "",
                                    date: data?.date ?? "",
                                    amount: "${data?.amount}",
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
