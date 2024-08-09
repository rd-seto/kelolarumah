import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/data/provider/profile_details_provider.dart';
import 'package:landlord/pages/landlord/drawer/tenants/components/summary_container_black.dart';
import 'package:landlord/pages/landlord/drawer/tenants/components/summary_container_white.dart';

class ProfileBasicInfo extends StatelessWidget {
  final ProfileDetailsProvider? provider;
  const ProfileBasicInfo({super.key, this.provider});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 18.0.w,
      ),
      child: Column(
        children: [
          SizedBox(height: 28.h,),
          SummaryContainerBlack(title: "Phone", subTitle: provider?.profileDetails?.data.profileInfo.phone ?? "N/A",),
          SummaryContainerWhite(title: "Occupation", subTitle: provider?.profileDetails?.data.profileInfo.occupation ?? "N/A",),
          // SummaryContainerBlack(title: "Designation", subTitle: provider?.profileDetails?.data.profileInfo.designation ?? "N/A",),
          SummaryContainerBlack(title: "Institution", subTitle: provider?.profileDetails?.data.profileInfo.institution ?? "N/A",),
          SummaryContainerWhite(title: "NID_No", subTitle: provider?.profileDetails?.data.profileInfo.nid ?? "N/A",),
          // SummaryContainerWhite(title: "Passport_No", subTitle: provider?.profileDetails?.data.profileInfo.passport ?? "N/A",),
          // SummaryContainerWhite(
          //   title: "Gender",
          //   subTitle: provider.profileDetails?.data
          //           ?.profileInfo?.gender ??
          //       "N/A",
          // ),
        ],
      ),
    );
  }
}
