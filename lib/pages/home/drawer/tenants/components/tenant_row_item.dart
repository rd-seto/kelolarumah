import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/data/model/tenant_model.dart';
import 'package:landlord/utils/theme/app_colors.dart';

import '../../../../../utils/nav_utail.dart';
import '../tenants_details/tenants_details_screen.dart';

class TenantRowItem extends StatelessWidget {
  final Tenant? tenant;

  const TenantRowItem({Key? key, required this.tenant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavUtil.navigateScreen(
            context,
            TenantsDetailsScreen(
              tenantsId: tenant?.id,
            ));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.stockColor)),
        child: Padding(
          padding: EdgeInsets.all(8.0.sp),
          child: Row(
            children: [
              // Image.asset(
              //   "assets/dashboard/tenants_img.png",
              //   height: 54.h,
              //   width: 54.w,
              // ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: CachedNetworkImage(
                  height: 54.h,
                  width: 54.w,
                  fit: BoxFit.cover,
                  imageUrl: tenant?.image ??
                      "https://t3.ftcdn.net/jpg/04/62/93/66/360_F_462936689_BpEEcxfgMuYPfTaIAOC1tCDurmsno7Sp.jpg",
                  placeholder: (context, url) => Center(
                    child: Image.asset("assets/drawer/app_logo.png"),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            height: 1,
                            text: tenant?.name ?? 'N/A',
                            color: AppColors.titleTextColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/dashboard/home_vector.png',
                                height: 15.h,
                                width: 15.w,
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              Expanded(
                                child: CustomText(
                                  text: tenant?.propertyName ?? 'N/A',
                                  color: const Color(0xff828282),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/dashboard/Map-Line_vector.png',
                                height: 15.h,
                                width: 15.w,
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              Expanded(
                                child: CustomText(
                                  height: 1,
                                  maxLine: 3,
                                  text: tenant?.propertyAddress ?? 'N/A',
                                  color: const Color(0xff828282),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Image.asset(
                          'assets/dashboard/call_vector.png',
                          height: 20.h,
                          width: 20.w,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Image.asset(
                          'assets/dashboard/message_vector.png',
                          height: 20.h,
                          width: 20.w,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Image.asset(
                          'assets/dashboard/more_vector.png',
                          height: 20.h,
                          width: 20.w,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
