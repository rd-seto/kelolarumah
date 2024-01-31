import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_app_bar.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/components/tenant_statistics_dashboard.dart';
import 'package:landlord/data/local/local_auth_provider.dart';
import 'package:landlord/data/provider/dashboard_provider.dart';
import 'package:landlord/data/tenant_provider/tenant_dashboard_provider.dart';
import 'package:landlord/pages/landlord/home/dashboard/components/greeting_scetion_cart.dart';
import 'package:landlord/pages/landlord/home/dashboard/components/grid_dashboard_summary_cart.dart';
import 'package:landlord/pages/tenants/dashboard/content/header_table_row.dart';
import 'package:landlord/pages/tenants/dashboard/content/purchase_history_cart.dart';
import 'package:landlord/pages/tenants/dashboard/content/purchase_history_tile.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

class TenantDashboardScreen extends StatelessWidget {
  final bool? isBottomNav;

  const TenantDashboardScreen({super.key, this.isBottomNav});

  @override
  Widget build(BuildContext context) {
    final dashboardProvider = Provider.of<DashBoardProvider>(context);
    final userProvider = Provider.of<LocalAutProvider>(context, listen: false);
    return ChangeNotifierProvider(
      create: (BuildContext context) => TenantDashboardProvider(context),
      child: Consumer<TenantDashboardProvider>(
        builder: (context, provider, _) {
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
                            name: "Hi ${userProvider
                                .getUser()
                                ?.name ?? 'dd'}"
                                .tr()),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TenantStatisticsCard(
                                  title: "Total Order",
                                  value: provider.tenantsDashboard?.data
                                      ?.statistics?.totalOrder ??
                                      ''),
                            ),
                            SizedBox(width: 8.r),
                            Expanded(
                              child: TenantStatisticsCard(
                                  title: "Wishlist",
                                  value: provider.tenantsDashboard?.data
                                      ?.statistics?.wishlist ??
                                      ''),
                            ),
                            SizedBox(width: 8.r),
                            Expanded(
                              child: TenantStatisticsCard(
                                  title: "Purchase Amount",
                                  value: provider.tenantsDashboard?.data
                                      ?.statistics?.purchaseAmount ??
                                      ''),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.r),
                        Row(
                          children: [
                            Expanded(
                              child: TenantStatisticsCard(
                                  title: "Used Coupons",
                                  value: provider.tenantsDashboard?.data
                                      ?.statistics?.usedCoupons ??
                                      ''),
                            ),
                            SizedBox(width: 8.r),
                            Expanded(
                              child: TenantStatisticsCard(
                                  title: "Cart",
                                  value: provider.tenantsDashboard?.data
                                      ?.statistics?.cart ??
                                      ''),
                            ),
                            SizedBox(width: 8.r),
                            Expanded(
                              child: TenantStatisticsCard(
                                  title: "Complete Order",
                                  value: provider.tenantsDashboard?.data
                                      ?.statistics?.completeOrder ??
                                      ''),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        const Text('Purchase History',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w600)),
                        const SizedBox(
                          height: 16,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: provider.tenantsDashboard?.data
                              ?.orderHistory?.length ??
                              0,
                          itemBuilder: (BuildContext context, int index) {
                            final data = provider
                                .tenantsDashboard?.data?.orderHistory?[index];
                            return PurchaseHistoryTile(invoice: data?.invoiceNo ?? '',
                                date: data?.invoiceNo ?? '',
                                discountAmount: data?.discountAmount ?? '',
                                grandTotal: data?.grandTotal ?? '',
                                paidAmount: data?.paidAmount ?? '',
                                dueAmount: data?.dueAmount ?? '');
                            /*Card(
                              margin: const EdgeInsets.symmetric(vertical: 2),
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            text: data?.invoiceNo ?? '',
                                            color: const Color(0xff087c7c),
                                            fontSize: 12.h,
                                              height: 1.6
                                          ),
                                          CustomText(
                                            text:
                                                '${data?.date?.day}-${data?.date?.month}-${data?.date?.year}',
                                            color: const Color(0xff087c7c),
                                            fontSize: 12.h,
                                              height: 1.6
                                          ),
                                          Text.rich(
                                            TextSpan(
                                              style: DefaultTextStyle.of(context)
                                                  .style,
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: 'Grand Total: ',
                                                  style: TextStyle(
                                                    fontSize: 12.0.r,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: data?.grandTotal ?? '',
                                                  style: TextStyle(
                                                    fontSize: 12.0.r,
                                                    fontWeight: FontWeight.bold,
                                                      height: 1.6
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text.rich(
                                            TextSpan(
                                              style: DefaultTextStyle.of(context)
                                                  .style,
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: 'Discount Amount: ',
                                                  style: TextStyle(
                                                    fontSize: 12.0.r,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: data?.discountAmount ?? '',
                                                  style: TextStyle(
                                                    fontSize: 12.0.r,
                                                    fontWeight: FontWeight.bold,
                                                      height: 1.6
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text.rich(
                                            TextSpan(
                                              style: DefaultTextStyle.of(context)
                                                  .style,
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: 'Paid Amount: ',
                                                  style: TextStyle(
                                                    fontSize: 12.0.r,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: data?.paidAmount ?? '',
                                                  style: TextStyle(
                                                    fontSize: 12.0.r,
                                                    fontWeight: FontWeight.bold,
                                                      height: 1.6
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text.rich(
                                            TextSpan(
                                              style: DefaultTextStyle.of(context)
                                                  .style,
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: 'Due Amount: ',
                                                  style: TextStyle(
                                                    fontSize: 12.0.r,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: data?.dueAmount ?? '',
                                                  style: TextStyle(
                                                    fontSize: 12.0.r,
                                                    fontWeight: FontWeight.bold,
                                                    height: 1.6
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Icon(Icons.arrow_forward_ios, size: 18,)
                                  ],
                                ),
                              ),
                            );*/
                          },
                        )

                        /*  Padding(
                          padding: EdgeInsets.zero,
                          child: Flexible(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Table(
                                border: TableBorder.all(width: 1),
                                columnWidths: const <int, TableColumnWidth>{
                                  0: IntrinsicColumnWidth(),
                                  1: IntrinsicColumnWidth(),
                                  2: IntrinsicColumnWidth(),
                                  3: IntrinsicColumnWidth(),
                                  4: IntrinsicColumnWidth(),
                                  5: IntrinsicColumnWidth(),
                                },
                                defaultVerticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                children: <TableRow>[
                                  TableRow(
                                    children: [
                                      HeaderTableRow(title: 'Date'.tr()),
                                      Center(
                                          child: HeaderTableRow(
                                              title: 'Invoice'.tr())),
                                      Center(
                                          child: HeaderTableRow(
                                              title: 'Grand Total'.tr())),
                                      Center(
                                        child:
                                            HeaderTableRow(title: 'Discount Amount'.tr()),
                                      ),
                                      HeaderTableRow(title: 'Paid Amount'.tr()),
                                      HeaderTableRow(title: 'Due Amount'.tr()),
                                    ],
                                  ),
                                  ...List.generate(
                                      provider.tenantsDashboard?.data
                                              ?.orderHistory?.length ??
                                          0, (index) {
                                    final data = provider.tenantsDashboard?.data
                                        ?.orderHistory?[index];
                                    return TableRow(
                                      decoration: BoxDecoration(
                                        color: Colors.white
                                      ),
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            '${data?.date?.day}-${data?.date?.month}-${data?.date?.year}',
                                            style: const TextStyle(
                                                fontStyle: FontStyle.italic),
                                          ).tr(),
                                        ),
                                        Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              data?.invoiceNo.toString() ?? '',
                                              style: const TextStyle(
                                                  fontStyle: FontStyle.italic),
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: Text(
                                            data?.grandTotal ?? '',
                                            style: const TextStyle(
                                                fontStyle: FontStyle.italic,
                                                decoration:
                                                    TextDecoration.underline),
                                          ),
                                        ),
                                        Center(
                                          child: Text(
                                            data?.discountAmount ?? '',
                                            style: const TextStyle(
                                                fontStyle: FontStyle.italic,
                                                decoration:
                                                    TextDecoration.underline),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            data?.paidAmount ?? '',
                                            style: const TextStyle(
                                                fontStyle: FontStyle.italic),
                                          ).tr(),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            data?.dueAmount ?? '',
                                            style: const TextStyle(
                                                fontStyle: FontStyle.italic),
                                          ).tr(),
                                        ),
                                      ],
                                    );
                                  })
                                ],
                              ),
                            ),
                          ),
                        ),*/
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
