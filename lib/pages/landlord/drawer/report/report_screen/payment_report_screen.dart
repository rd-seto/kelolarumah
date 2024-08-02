import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/data/provider/report_provider.dart';
import 'package:landlord/utils/no_data_found_widget.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../components/custom_app_bar.dart';
import '../../../../../components/custom_text.dart';

class PaymentReportScreen extends StatelessWidget {
  const PaymentReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ReportProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBar(appBarName: 'Payment report'),
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
              child: provider.payments.isNotEmpty ? provider.payments != null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: provider.payments.length,
                            itemBuilder: (context, index) {
                              final data = provider.payments[index];
                              return Container(
                                margin: const EdgeInsets.only(bottom: 8),
                                decoration: BoxDecoration(
                                    color: AppColors.colorWhite,
                                    borderRadius: BorderRadius.circular(8.r),
                                    border: Border.all(color: AppColors.stockColor2)),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 16.h),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            CustomText(
                                              text: data.tenant ?? "",
                                              color: AppColors.titleTextColor,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w600,
                                              height: 1.75,
                                            ),
                                            CustomText(
                                              text: data.property ?? "",
                                              color: AppColors.titleTextColor,
                                              maxLine: 2,
                                              fontSize: 11.sp,
                                            ),
                                            CustomText(
                                              text: data.date ?? "",
                                              color: AppColors.black2Sd,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                              height: 1.75,
                                            ),
                                            Row(
                                              children: [
                                                Image.asset('assets/dashboard/propertise_vector.png', height: 16.h),
                                                SizedBox(
                                                  width: 8.w,
                                                ),
                                                CustomText(
                                                  text: data.paymentMethod,
                                                  color: AppColors.black2Sd,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w500,
                                                  height: 1.75,
                                                  maxLine: 1,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          CustomText(
                                            text: "${data.amount}",
                                            color: const Color(0xff00BF08),
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w700,
                                            height: 1.75,
                                          ),
                                          SizedBox(
                                            height: 6.h,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
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
                    ) :const NoDataFoundWidget()
            ),
          )
        ],
      ),
    );
  }
}
