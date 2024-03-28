import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/data/provider/dashboard_provider.dart';
import 'package:landlord/pages/landlord/drawer/tenants/tenants_details/components/transaction_details/transaction_details_screen.dart';
import 'package:landlord/pages/landlord/drawer/transaction/transaction_list/transaction_history_list_container.dart';
import 'package:landlord/pages/landlord/drawer/transaction/transaction_list/transaction_list_screen.dart';
import 'package:landlord/pages/landlord/home/dashboard/components/see_all_container.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/no_data_found_widget.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class DashboardTransactionCart extends StatelessWidget {
  const DashboardTransactionCart({
    super.key,
    required this.provider,
  });

  final DashBoardProvider provider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        SeeAllContainer(
            onTap: () {
              NavUtil.navigateScreen(context, const TransactionListScreen());
            },
            title: "Transaction_History",
            subTitle: "See_All"),
        SizedBox(
          height: 8.h,
        ),
        provider.dashboardResponse?.data?.transactions?.isEmpty == false
            ? Container(
                padding: EdgeInsets.all(10.sp),
                color: AppColors.colorWhite,
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: provider
                              .dashboardResponse?.data?.transactions?.length ??
                          0,
                      itemBuilder: (context, index) {
                        final data = provider
                            .dashboardResponse?.data?.transactions?[index];
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
                            date: data?.date ?? "",
                            amount: "${data?.amount}",
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            : const NoDataFoundWidget(),
      ],
    );
  }
}
