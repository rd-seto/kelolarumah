import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_app_bar.dart';
import 'package:landlord/components/shimmer/shimmer_placeholders.dart';
import 'package:landlord/components/tenant_statistics_dashboard.dart';
import 'package:landlord/data/local/local_auth_provider.dart';
import 'package:landlord/data/tenant_provider/tenant_dashboard_provider.dart';
import 'package:landlord/pages/landlord/home/dashboard/components/greeting_scetion_cart.dart';
import 'package:landlord/pages/tenants/dashboard/content/purchase_history_tile.dart';
import 'package:landlord/utils/no_data_found_widget.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

class TenantDashboardScreen extends StatelessWidget {
  final bool? isBottomNav;

  const TenantDashboardScreen({super.key, this.isBottomNav});

  @override
  Widget build(BuildContext context) {
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GreetingsSectionCart(
                                name:
                                    "Hi ${userProvider.getUser()?.name ?? 'dd'}"
                                        .tr()),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TenantStatisticsCard(
                                  title: "total_order".tr(),
                                  value: provider.tenantsDashboard?.data
                                          ?.statistics?.totalOrder ??
                                      ''),
                            ),
                            SizedBox(width: 8.r),
                            Expanded(
                              child: TenantStatisticsCard(
                                  title: "wishlist",
                                  value: provider.tenantsDashboard?.data
                                          ?.statistics?.wishlist ??
                                      ''),
                            ),
                            SizedBox(width: 8.r),
                            Expanded(
                              child: TenantStatisticsCard(
                                  title: "purchase_amount".tr(),
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
                                  title: "used_coupons".tr(),
                                  value: provider.tenantsDashboard?.data
                                          ?.statistics?.usedCoupons ??
                                      ''),
                            ),
                            SizedBox(width: 8.r),
                            Expanded(
                              child: TenantStatisticsCard(
                                  title: "cart".tr(),
                                  value: provider.tenantsDashboard?.data
                                          ?.statistics?.cart ??
                                      ''),
                            ),
                            SizedBox(width: 8.r),
                            Expanded(
                              child: TenantStatisticsCard(
                                  title: "complete_order".tr(),
                                  value: provider.tenantsDashboard?.data
                                          ?.statistics?.completeOrder ??
                                      ''),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Text('purchase_history'.tr(),
                            style: const TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w600)),
                        const SizedBox(
                          height: 16,
                        ),
                        provider.isLoading == true
                            ? ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 5,
                                itemBuilder: (BuildContext context, int index) {
                                  return const ContentPlaceholder(
                                      lineType: ContentLineType.threeLines);
                                })
                            : provider.tenantsDashboard?.data?.orderHistory
                                        ?.isEmpty ==
                                    false
                                ? ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: provider.tenantsDashboard?.data
                                            ?.orderHistory?.length ??
                                        0,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final data = provider.tenantsDashboard
                                          ?.data?.orderHistory?[index];
                                      return PurchaseHistoryTile(
                                          invoice: data?.invoiceNo ?? '',
                                          date:
                                              '${data?.date?.day}-${data?.date?.month}-${data?.date?.year}',
                                          discountAmount:
                                              data?.discountAmount ?? '',
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
                                : const NoDataFoundWidget(),

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
