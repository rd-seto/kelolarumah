import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/data/provider/cash_management_provider.dart';
import 'package:landlord/pages/landlord/drawer/cash_management/cash_management_applicant_type_page.dart';
import 'package:landlord/pages/landlord/drawer/cash_management/cash_management_details/cash_management_details_screen.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../components/custom_app_bar.dart';
import '../../../../../components/custom_text.dart';
import '../../../../../utils/nav_utail.dart';
import '../../transaction/transaction_list/transaction_history_list_container.dart';

class CashManagementDashboardScreen extends StatelessWidget {
  const CashManagementDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CashManagementListProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBar(appBarName: 'Cash_Management'),
      ),
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Opacity(
              opacity: 1,
              child: Image.asset(
                'assets/dashboard/backgorund_img.png',
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20.0.sp),
              child: provider.cashManagementListResponse?.data?.items != null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 100.h,
                                decoration: BoxDecoration(
                                    color: const Color(0xff00B3DA),
                                    borderRadius: BorderRadius.circular(12.r)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(
                                      text: 'Balance',
                                      color: AppColors.colorWhite,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    CustomText(
                                      text:
                                          "${provider.cashManagementListResponse?.data?.balance ?? ""}",
                                      color: AppColors.colorWhite,
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w700,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: Container(
                                height: 100.h,
                                decoration: BoxDecoration(
                                    color: AppColors.mainColorsh1,
                                    borderRadius: BorderRadius.circular(12.r)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(
                                      text: 'Income',
                                      color: AppColors.colorWhite,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    CustomText(
                                      text:
                                          "${provider.cashManagementListResponse?.data?.income ?? ""}",
                                      color: AppColors.colorWhite,
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w700,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: Container(
                                height: 100.h,
                                decoration: BoxDecoration(
                                    color: AppColors.color2Orange,
                                    borderRadius: BorderRadius.circular(12.r)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(
                                      text: 'Expenses',
                                      color: AppColors.colorWhite,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    CustomText(
                                      text:
                                          "${provider.cashManagementListResponse?.data?.income ?? ""}",
                                      color: AppColors.colorWhite,
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w700,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          padding: EdgeInsets.all(16.sp),
                          width: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                              color: AppColors.colorWhite,
                              borderRadius: BorderRadius.circular(8.sp)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "History",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold),
                              ).tr(),
                              Text(
                                "See_All",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                              ).tr(),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: provider.cashManagementListResponse?.data
                                    ?.items?.list?.length ??
                                0,
                            itemBuilder: (context, index) {
                              final data = provider.cashManagementListResponse
                                  ?.data?.items?.list?[index];
                              if (kDebugMode) {
                                print(data);
                              }
                              return TransactionHistoryListContainer(
                                onTap: () {
                                  NavUtil.navigateScreen(
                                      context,
                                      CashManagementDetailsScreen(
                                        cashManagementDetailsData: data,
                                      ));
                                },
                                tittle: data?.tenant?.name,
                                propertyName: data?.property,
                                date: data?.appDate,
                                amount: "${data?.amount}",
                              );
                            })
                      ],
                    )
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
                    ),
            ),
          )
        ],
      ),
      floatingActionButton: InkWell(
        onTap: () {
          NavUtil.navigateScreen(
              context, const CashManagementApplicantTypePage());
        },
        child: Image.asset(
          'assets/dashboard/add_float_button.png',
          height: 64.h,
          width: 64.w,
        ),
      ),
    );
  }
}
