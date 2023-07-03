import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_app_bar.dart';
import 'package:landlord/components/custom_divider.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/data/model/report_details_model.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class ReportTransactionDetails extends StatelessWidget {
  const ReportTransactionDetails({super.key, required this.reportDetails});

  final ReportDetailsModel reportDetails;

  @override
  Widget build(BuildContext context) {
    final data = reportDetails.data?.transactions?.first;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBar(appBarName: 'Report_Details'),
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
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                    decoration:
                        const BoxDecoration(color: AppColors.colorPrimary),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.0.w, vertical: 12.h),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: 'Report_For',
                                    color: AppColors.colorWhite,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    height: 1.75,
                                  ),
                                  CustomText(
                                    text: data?.property ?? '',
                                    color: AppColors.colorWhite,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                    height: 1.75,
                                  ),
                                  CustomText(
                                    maxLine: 2,
                                    text:
                                        'Report From: ${data?.rentalAgreement?.startDate}  -  ${data?.rentalAgreement?.endDate}',
                                    color: AppColors.colorWhite,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    height: 1.75,
                                  ),
                                ],
                              )),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  CustomText(
                                    text: 'Date',
                                    color: AppColors.colorWhite,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    height: 1.75,
                                  ),
                                  CustomText(
                                    text: data?.appDate ?? '',
                                    color: AppColors.colorWhite,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    height: 1.75,
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: AppColors.colorWhite,
                    child: Column(
                      children: [
                        ReportTextTile(
                          title: 'Invoice',
                          subTitle: data?.invoice?.invoiceNumber ?? '',
                        ),
                        const CustomDivider(),
                        ReportTextTile(
                          title: 'Total_Rent',
                          subTitle: '\$ ${data?.rentalAgreement?.amount ?? ''}',
                        ),
                        const CustomDivider(),
                        ReportTextTile(
                          title: 'Payment_Method',
                          subTitle: data?.paymentDetails?.paymentMethod ?? '',
                        ),
                        const CustomDivider(),
                        ReportTextTile(
                          title: 'Total_Expense',
                          subTitle: '\$ ${data?.amount ?? ''}',
                        ),
                        const CustomDivider(),
                        ReportTextTile(
                          title: 'Payment_Status',
                          subTitle: data?.paymentDetails?.paymentStatus ?? '',
                        ),
                        const CustomDivider(),
                      ],
                    ),
                  ),
                  // Container(
                  //   color: const Color(0xffE8E8E8),
                  //   child: Padding(
                  //     padding: EdgeInsets.symmetric(
                  //         horizontal: 10.0.w, vertical: 18.h),
                  //     child: Row(
                  //       children: [
                  //         CustomText(
                  //           text: "Net Cash Flow:",
                  //           color: AppColors.colorPrimary,
                  //           fontSize: 20.sp,
                  //           fontWeight: FontWeight.w700,
                  //           height: 1.75,
                  //         ),
                  //         const Spacer(),
                  //         CustomText(
                  //           text: "\$ N/A",
                  //           color: AppColors.colorPrimary,
                  //           fontSize: 20.sp,
                  //           fontWeight: FontWeight.w700,
                  //           height: 1.75,
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 20.h,
                  ),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: SizedBox(
                  //         height: 52.h,
                  //         width: double.infinity,
                  //         child: ElevatedButton(
                  //             style: ElevatedButton.styleFrom(
                  //                 shape: RoundedRectangleBorder(
                  //                     side: const BorderSide(
                  //                         color: AppColors.mainColorsh1),
                  //                     borderRadius: BorderRadius.circular(8.0)),
                  //                 backgroundColor: AppColors.colorWhite),
                  //             onPressed: () {},
                  //             child: Text(
                  //               'Save as Pdf',
                  //               style: TextStyle(
                  //                 color: AppColors.mainColorsh1,
                  //                 letterSpacing: 1.sp,
                  //                 fontSize: 14.sp,
                  //                 fontWeight: FontWeight.w700,
                  //               ),
                  //             )),
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: 10.w,
                  //     ),
                  //     Expanded(
                  //       child: ElevatedButtonWidget(
                  //         text: "Download",
                  //         onPressed: () {},
                  //       ),
                  //     ),
                  //   ],
                  // )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ReportTextTile extends StatelessWidget {
  final String? title;
  final String? subTitle;
  const ReportTextTile({super.key, this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 20.h),
      child: Row(
        children: [
          CustomText(
            text: title,
            color: AppColors.black2Sd,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            height: 1.75,
          ),
          const Spacer(),
          CustomText(
            text: subTitle,
            color: AppColors.black2Sd,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            height: 1.75,
          ),
        ],
      ),
    );
  }
}
