import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/data/model/payment_report.dart';
import 'package:landlord/data/provider/dashboard_provider.dart';
import 'package:landlord/pages/landlord/drawer/document/add_document/add_document_screen.dart';
import 'package:landlord/pages/landlord/drawer/properties/add_property/add_property_screen.dart';
import 'package:landlord/pages/landlord/drawer/report/report_screen/payment_report_screen.dart';
import 'package:landlord/pages/landlord/drawer/report/report_screen/tenant_report_screen.dart';
import 'package:landlord/pages/landlord/drawer/tenants/add_tenants/add_tenants_screen.dart';
import 'package:landlord/pages/landlord/drawer/tenants/tenants_screen/tenants_screen.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class GridDashboardSummaryCart extends StatelessWidget {
  final List<DashboardDummyData>? gridDashboardData;

  const GridDashboardSummaryCart({super.key, this.gridDashboardData});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: gridDashboardData?.length ?? 0,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisExtent: 86,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0),
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            navigationMethod(index, context);
          },
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppColors.stockColor)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  gridDashboardData?[index].assetImage ?? '',
                  height: 20.h,
                ),
                const SizedBox(
                  height: 6,
                ),
                CustomText(
                  text: gridDashboardData?[index].title ?? '',
                  color: AppColors.paraTxt1,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  height: 1.75,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void navigationMethod(int index, BuildContext context) {
    int command = index;
    switch (command) {
      case 0:
        NavUtil.navigateScreen(context, const AddPropertyScreen());
        break;
      case 1:
        NavUtil.navigateScreen(
            context,
            const TenantsScreen(
              isBottomNav: false,
            ));
        break;
      case 2:
        NavUtil.navigateScreen(context, const AddDocumentsScreen());
        break;
      case 3:
        NavUtil.navigateScreen(context, const PaymentReportScreen());
        break;
      case 4:
        NavUtil.navigateScreen(context, const TenantReportScreen());
        break;
      case 5:
        NavUtil.navigateScreen(context, const AddTenantsScreen());
        break;
      default:
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("No Screen Found"),
        ));
    }
  }
}
