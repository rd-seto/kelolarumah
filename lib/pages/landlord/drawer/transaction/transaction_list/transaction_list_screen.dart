import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_app_bar.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/pages/landlord/drawer/tenants/tenants_details/components/transaction/add_transaction/add_transaction_screen.dart';
import 'package:landlord/pages/landlord/drawer/tenants/tenants_details/components/transaction_details/transaction_details_screen.dart';
import 'package:landlord/pages/landlord/drawer/transaction/transaction_list/transaction_history_list_container.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/no_data_found_widget.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../data/provider/transaction_list_provider.dart';

class TransactionListScreen extends StatelessWidget {
  const TransactionListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<TransactionListProvider>(context);

    return ChangeNotifierProvider(
      create: (context) => TransactionListProvider(context),
      child: Consumer<TransactionListProvider>(builder: (context, provider, _) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(70.h),
            child: const CustomAppBar(appBarName: 'Transaction'),
          ),
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
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView(
                  children: [
                    // Container(
                    //   decoration: BoxDecoration(
                    //       color: AppColors.colorWhite,
                    //       borderRadius: BorderRadius.circular(8),
                    //       border: Border.all(color: AppColors.stockColor)),
                    //   child: TextFormField(
                    //     onChanged: (val) {
                    //       provider.searchTransactionData(context, val);
                    //     },
                    //     decoration: const InputDecoration(
                    //         prefixIcon: Icon(
                    //           Icons.search,
                    //           color: Color(0xffBEBEBE),
                    //         ),
                    //         border: InputBorder.none),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 20.h,
                    // ),
                    CustomText(
                      text: 'Transaction_History',
                      color: AppColors.titleTextColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      height: 1.75,
                    ),
                    // SizedBox(
                    //   height: 30.h,
                    // ),
                    provider.transactionListResponse?.data?.list != null
                        ? provider.transactionListResponse?.data?.list
                                    ?.isEmpty ==
                                false
                            ? ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: provider.transactionListResponse
                                        ?.data?.list?.length ??
                                    0,
                                itemBuilder: (context, index) {
                                  final data = provider.transactionListResponse
                                      ?.data?.list?[index];
                                  return TransactionHistoryListContainer(
                                    tittle: data?.paymentMethod,
                                    propertyName: data?.type,
                                    date: data?.date.toString(),
                                    amount: "${data?.amount}",
                                  );
                                })
                            : const NoDataFoundWidget()
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 8,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Shimmer.fromColors(
                                  baseColor: const Color(0xFFE8E8E8),
                                  highlightColor: Colors.white,
                                  child: Container(
                                    height: 120,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFE8E8E8),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                  ],
                ),
              ),
            ],
          ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     NavUtil.navigateScreen(context, const AddTransactionScreen());
          //   },
          //   child: Image.asset(
          //     'assets/dashboard/add_float_button.png',
          //     height: 64.h,
          //     width: 64.w,
          //   ),
          // ),
        );
      }),
    );
  }
}
