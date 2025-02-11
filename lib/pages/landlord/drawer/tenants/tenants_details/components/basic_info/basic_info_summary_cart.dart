import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/data/model/tenants_details_model.dart';
import 'package:landlord/pages/landlord/drawer/tenants/components/summary_container_black.dart';
import 'package:landlord/pages/landlord/drawer/tenants/components/summary_container_white.dart';
import 'package:landlord/pages/landlord/drawer/tenants/tenants_details/components/basic_info/edit_basic_info.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/theme/app_colors.dart';

import '../../../../../../../data/provider/tenants_details_provider.dart';

class BasicInfoSummaryCart extends StatelessWidget {
  final BasicInfo? basicInfo;
  final int? tenantsId;
  final TenantsDetailsProvider? provider;


  const BasicInfoSummaryCart(
      {super.key, this.basicInfo, this.tenantsId, this.provider});

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
              Container(
                decoration: BoxDecoration(
                  color: AppColors.colorWhite,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 18.0.w,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 28.h,
                      ),
                      SummaryContainerBlack(
                        title: "Join_Date",
                        subTitle: basicInfo?.joinDate == null ? "N/A" : basicInfo?.joinDate.toString(),
                      ),
                      SummaryContainerWhite(
                        title: "Occupation",
                        subTitle: basicInfo?.occupation ?? "N/A",
                      ),
                      SummaryContainerBlack(
                        title: "Institution",
                        subTitle: basicInfo?.institution ?? "N/A",
                      ),
                      SummaryContainerWhite(
                        title: "NID_No",
                        subTitle: basicInfo?.nid ?? "N/A",
                      ),
                      SummaryContainerBlack(
                        title: "Passport No",
                        subTitle: basicInfo?.passport ?? "N/A",
                      ),
                      SizedBox(
                        height: 28.h,
                      ),
                    ],
                  ),
                ),
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
            child: InkWell(
              onTap: () {
                NavUtil.navigateScreen(
                    context,
                    EditBasicInfo(
                      basicInfo: basicInfo,
                      tenantsId: provider?.tenantsDetailsResponse?.data?.id,
                      onSave: () {
                        provider?.tenantsDetailsData(context,
                            provider?.tenantsDetailsResponse?.data?.id);
                      },
                      provider: provider,
                      tenantsDetailsResponse: provider?.tenantsDetailsResponse,
                    ));
              },
              child: Container(
                  decoration: const BoxDecoration(
                      color: AppColors.colorPrimary, shape: BoxShape.circle),
                  padding: const EdgeInsets.all(16),
                  child: const Icon(
                    Icons.edit,
                    color: Colors.white,
                  )),
            )),
      ],
    );
  }
}
