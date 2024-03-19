import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/data/model/property_details_model.dart';
import 'package:landlord/data/provider/property_details_provider.dart';
import 'package:landlord/pages/landlord/drawer/tenants/components/tenants_list_container.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class PropertyTenantsContainer extends StatelessWidget {
  const PropertyTenantsContainer({super.key, this.provider});

  final PropertyDetailsProvider? provider;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30.h,
          ),
          CustomText(
            text: 'Current_Tenant',
            color: AppColors.titleTextColor,
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
          // SizedBox(
          //   height: 30.h,
          // ),
          // TenantsListContainer(
          //   currentTenant: propertyDetails?.data?.currentTenant,
          // ),
          SizedBox(
            height: 30.h,
          ),
          CustomText(
            text: 'History',
            color: AppColors.titleTextColor,
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(
            height: 20.h,
          ),
          Visibility(
            visible: false,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.colorWhite,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.stockColor)),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Color(0xffBEBEBE),
                        ),
                        border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.colorWhite,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.stockColor)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.calendar_month_outlined,
                          color: AppColors.black2Sd,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        CustomText(
                          text: '01-01-2021',
                          color: AppColors.black2Sd,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        CustomText(
                          text: 'to',
                          color: AppColors.black2Sd,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        CustomText(
                          text: '31-12-2021',
                          color: AppColors.black2Sd,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
          provider?.propertyDetailsResponse?.data?.currentTenant == true
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: provider?.propertyDetailsResponse?.data
                          ?.currentTenant?.length ??
                      0,
                  itemBuilder: (context, index) {
                    final data = provider
                        ?.propertyDetailsResponse?.data?.currentTenant?[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.stockColor)),
                      child: Padding(
                        padding: EdgeInsets.all(8.0.sp),
                        child: Row(
                          children: [
                            Image.network(
                              data?.image ?? '',
                              height: 54.h,
                              width: 54.w,
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        height: 1,
                                        text: data?.name ?? '',
                                        color: AppColors.titleTextColor,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      SizedBox(
                                        height: 6.h,
                                      ),
                                      // Row(
                                      //   children: [
                                      //     const Icon(
                                      //       Icons.calendar_month_outlined,
                                      //       color: AppColors.black2Sd,
                                      //     ),
                                      //     SizedBox(
                                      //       width: 10.w,
                                      //     ),
                                      //     CustomText(
                                      //       text: '${data?.startDate}',
                                      //       color: AppColors.black2Sd,
                                      //       fontSize: 14.sp,
                                      //       fontWeight: FontWeight.w600,
                                      //     ),
                                      //     SizedBox(
                                      //       width: 4.w,
                                      //     ),
                                      //     CustomText(
                                      //       text: 'to',
                                      //       color: AppColors.black2Sd,
                                      //       fontSize: 14.sp,
                                      //       fontWeight: FontWeight.w600,
                                      //     ),
                                      //     SizedBox(
                                      //       width: 4.w,
                                      //     ),
                                      //     CustomText(
                                      //       text: '${data?.endDate}',
                                      //       color: AppColors.black2Sd,
                                      //       fontSize: 14.sp,
                                      //       fontWeight: FontWeight.w600,
                                      //     ),
                                      //   ],
                                      // ),
                                    ],
                                  )),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                )
              : CustomText(
                  height: 1,
                  text: 'No History Found',
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                )
        ],
      ),
    );
  }
}
