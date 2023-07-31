import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/data/model/tenants_details_model.dart';
import 'package:landlord/pages/home/drawer/tenants/tenants_details/components/transaction/add_transaction/add_transaction_screen.dart';
import 'package:landlord/pages/home/drawer/tenants/tenants_details/components/transaction_details/transaction_details_screen.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class TransactionSummaryCart extends StatelessWidget {
  final List<TenantTransaction>? tenantTransaction;

  const TransactionSummaryCart({super.key, this.tenantTransaction});

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
              ListView.separated(
                shrinkWrap: true,
                itemCount: tenantTransaction?.length ?? 0,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      NavUtil.navigateScreen(
                          context,
                          TransactionsDetailsScreen(
                            transactionId: tenantTransaction?[index].id,
                          ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.colorWhite,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.0.w, vertical: 16.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: tenantTransaction?[index].property ?? 'N/A',
                                  color: AppColors.titleTextColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  height: 1.75,
                                ),
                                Row(
                                  children: [
                                    Image.asset('assets/dashboard/file_vector.png',
                                        height: 16.h),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    CustomText(
                                      text: tenantTransaction?[index]
                                              .attachmentCount.toString() ??
                                          "N/A",
                                      color: AppColors.black2Sd,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      height: 1.75,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                        'assets/dashboard/propertise_vector.png',
                                        height: 16.h),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    CustomText(
                                      text: tenantTransaction?[index].property ??
                                          'N/A',
                                      color: AppColors.black2Sd,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      height: 1.75,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                CustomText(
                                  text:
                                      tenantTransaction?[index].amount.toString() ??
                                          "N/A",
                                  color: const Color(0xff00BF08),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                  height: 1.75,
                                ),
                                SizedBox(
                                  height: 6.h,
                                ),
                                CustomText(
                                  text: tenantTransaction?[index].date.toString() ?? "N/A",
                                  color: AppColors.black2Sd,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  height: 1.75,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    thickness: 0,
                    color: Colors.transparent,
                  );
                },
              ),
              SizedBox(
                height: 30.h,
              ),

            ],
          ),
        ),

        Positioned(
          bottom: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  NavUtil.navigateScreen(context, const AddTransactionScreen());
                },
                child: Image.asset(
                  'assets/dashboard/add_float_button.png',
                  height: 64.h,
                  width: 64.w,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
