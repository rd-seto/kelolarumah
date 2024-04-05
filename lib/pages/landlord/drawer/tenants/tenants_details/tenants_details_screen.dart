import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_app_bar.dart';
import 'package:landlord/data/provider/tenants_details_provider.dart';
import 'package:landlord/pages/landlord/drawer/tenants/tenants_details/components/accounts/accounts_summary_chart.dart';
import 'package:landlord/pages/landlord/drawer/tenants/tenants_details/components/basic_info/basic_info_summary_cart.dart';
import 'package:landlord/pages/landlord/drawer/tenants/tenants_details/components/tenants_profile_details_cart.dart';
import 'package:landlord/pages/landlord/drawer/tenants/tenants_details/components/transaction/transaction_summary_chart.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

import '../../properties/properties_details/components/widgets/property_details_shimmer.dart';

class TenantsDetailsScreen extends StatefulWidget {
  final int tenantsId;

  const TenantsDetailsScreen({super.key, required this.tenantsId});

  @override
  State<TenantsDetailsScreen> createState() => _TenantsDetailsScreenState();
}

class _TenantsDetailsScreenState extends State<TenantsDetailsScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) =>
          TenantsDetailsProvider(context, widget.tenantsId),
      child: Consumer<TenantsDetailsProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(70.h),
              child: const CustomAppBar(appBarName: 'Tenants_Details'),
            ),
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
                provider.tenantsDetailsResponse?.data != null
                ? Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 13.h),
                  child: Column(
                    children: [
                      TenantsRowItem(
                        basicInfo:
                            provider.tenantsDetailsResponse?.data?.basicInfo,
                        provider: provider,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        decoration:
                            const BoxDecoration(color: AppColors.colorWhite),
                        child: TabBar(
                          tabAlignment: TabAlignment.start,
                          isScrollable: true,
                          unselectedLabelColor: AppColors.black2Sd,
                          labelColor: AppColors.colorPrimary,
                          labelStyle: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          tabs: [
                            Tab(
                              text: 'Basic_Info'.tr(),
                            ),
                            Tab(
                              text: 'Accounts'.tr(),
                            ),
                            Tab(
                              text: 'Transaction'.tr(),
                            ),
                          ],
                          indicatorColor: AppColors.colorPrimary,
                          controller: _tabController,
                          indicatorSize: TabBarIndicatorSize.values.last,
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: _tabController,
                          children: [
                            BasicInfoSummaryCart(
                              basicInfo: provider
                                  .tenantsDetailsResponse?.data?.basicInfo,
                              tenantsId: widget.tenantsId,
                              provider: provider,
                            ),
                            // EmergencySummaryCart(
                            //   emergencyContact: provider.tenantsDetailsResponse
                            //       ?.data?.emergencyContact,
                            //   tenantId: provider.tenantsDetailsResponse?.data
                            //           ?.basicInfo?.id ??
                            //       0,
                            //   tenantDetailsProvider: provider,
                            // ),
                            AccountsSummaryCart(
                                tenantId: widget.tenantsId, provider: provider),
                            TransactionSummaryCart(
                              provider: provider,
                            ),
                            // AgreementsSummaryCart(
                            //   agreement: provider
                            //       .tenantsDetailsResponse?.data?.agreement,
                            //   tenantId: widget.tenantsId,
                            //   provider: provider,
                            // )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
                          : const PropertyDetailsShimmer(),
              ],
            ),
          );
        },
      ),
    );
  }
}
