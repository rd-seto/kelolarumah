import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_app_bar.dart';
import 'package:landlord/data/model/tenant_purchase_history_model.dart';
import 'package:landlord/data/tenant_provider/tenant_purchase_history_provider.dart';
import 'package:landlord/pages/tenants/dashboard/content/purchase_history_cart.dart';
import 'package:landlord/pages/tenants/dashboard/content/purchase_history_tile.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

class PurchaseHistoryPage extends StatelessWidget {
  final bool? isBottomNav;

  const PurchaseHistoryPage({super.key, this.isBottomNav});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => TenantPurchaseHistoryProvider(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: isBottomNav == false
            ? PreferredSize(
                preferredSize: Size.fromHeight(60.h),
                child: CustomAppBar(appBarName: "Purchase History".tr()),
              )
            : const PreferredSize(
                // ignore: sort_child_properties_last
                child: SizedBox(),
                preferredSize: Size.fromHeight(0)),
        body: Consumer<TenantPurchaseHistoryProvider>(
          builder: (BuildContext context, provider, _) {
            return FutureBuilder<TenantPurchaseHistoryModel?>(
              future: provider.purchaseHistoryData(context),
              builder: ( context, snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: EdgeInsets.all(20.0.sp),
                    child: ListView.builder(
                      itemCount: snapshot.data?.data?.purchaseHistoryList?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        final data = snapshot.data?.data?.purchaseHistoryList?[index];
                        return PurchaseHistoryTile(
                            invoice: data?.invoiceNo ?? '',
                            date:
                                '${data?.date?.day}-${data?.date?.month}-${data?.date?.year}',
                            discountAmount: data?.discountAmount ?? '',
                            grandTotal: data?.grandTotal ?? '',
                            paidAmount: data?.paidAmount ?? '',
                            dueAmount: data?.dueAmount ?? '');
                      },
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
