import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_app_bar.dart';
import 'package:landlord/data/local/local_auth_provider.dart';
import 'package:landlord/data/provider/dashboard_provider.dart';
import 'package:landlord/pages/landlord/home/dashboard/components/greeting_scetion_cart.dart';
import 'package:landlord/pages/landlord/home/dashboard/components/grid_dashboard_summary_cart.dart';
import 'package:landlord/pages/tenants/dashboard/content/purchase_history_cart.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

class TenantDashboardScreen extends StatelessWidget {
  final bool? isBottomNav;

  const TenantDashboardScreen({super.key, this.isBottomNav});

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
                // top: MediaQuery.of(context).size.height / 8,
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
                          name: "Hi ${userProvider.getUser()?.name ?? 'dd'}"
                              .tr()),
                      SizedBox(
                        height: 20.h,
                      ),
                      GridDashboardSummaryCart(
                          gridDashboardData: provider.gridDashboardData),
                      SizedBox(
                        height: 24.h,
                      ),
                      const Text('Purchase History',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w600)),
                      const SizedBox(
                        height: 16,
                      ),
                      const PurchaseHistoryCart(),
                      const PurchaseHistoryCart(),
                      const PurchaseHistoryCart(),
                      const PurchaseHistoryCart(),
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
