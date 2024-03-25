import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/data/provider/tenants_details_provider.dart';
import 'package:landlord/pages/landlord/drawer/tenants/tenants_details/components/transaction_details/transaction_details_screen.dart';
import 'package:landlord/pages/landlord/drawer/transaction/transaction_list/transaction_history_list_container.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class TransactionSummaryCart extends StatelessWidget {
  final TenantsDetailsProvider? provider;

  const TransactionSummaryCart({super.key, this.provider});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30.h,
              ),
              CustomText(
                text: 'Transaction_History',
                color: AppColors.titleTextColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                height: 1.75,
              ),
              SizedBox(
                height: 30.h,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: provider
                        ?.tenantsDetailsResponse?.data?.transactions?.length ??
                    0,
                itemBuilder: (context, index) {
                  final data = provider
                      ?.tenantsDetailsResponse?.data?.transactions?[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0.h),
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
                      date: data?.date.toString() ?? "",
                      amount: "${data?.amount}",
                    ),
                  );
                },
              ),
              SizedBox(
                height: 30.h,
              ),
            ],
          ),
        ),
        // Positioned(
        //   bottom: 0,
        //   right: 0,
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.end,
        //     children: [
        //       InkWell(
        //         onTap: () {
        //           NavUtil.navigateScreen(context, const AddTransactionScreen());
        //         },
        //         child: Image.asset(
        //           'assets/dashboard/add_float_button.png',
        //           height: 64.h,
        //           width: 64.w,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
