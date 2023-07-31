import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/data/model/tenants_details_model.dart';
import 'package:landlord/data/provider/tenants_details_provider.dart';
import 'package:landlord/pages/home/drawer/tenants/components/summary_container_black.dart';
import 'package:landlord/pages/home/drawer/tenants/components/summary_container_white.dart';
import 'package:landlord/pages/home/drawer/tenants/tenants_details/components/agreements/add_agreements.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class AgreementsSummaryCart extends StatelessWidget {
  final Agreement? agreement;
  final int? tenantId;
  final TenantsDetailsProvider? provider;

  const AgreementsSummaryCart({super.key, this.agreement, this.tenantId,this.provider});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                    title: "Property_Name",
                    subTitle: agreement?.property ?? "N/A",
                  ),
                  SummaryContainerWhite(
                    title: "Move_In_Date",
                    subTitle: agreement?.moveIn ?? "N/A",
                  ),
                  SummaryContainerBlack(
                    title: "Move_out_Date",
                    subTitle: agreement?.moveOut ?? "N/A",
                  ),
                  SummaryContainerWhite(
                    title: "Rent_Amount",
                    subTitle: agreement?.rentAmount.toString() ?? "N/A",
                  ),
                  SummaryContainerBlack(
                    title: "Rent_Type",
                    subTitle: agreement?.rentType ?? "N/A",
                  ),
                  SummaryContainerWhite(
                    title: "Rent_For",
                    subTitle: agreement?.rentFor.toString() ?? "N/A",
                  ),
                  SummaryContainerBlack(
                    title: "Reminder_Date",
                    subTitle: agreement?.reminderDate ?? "N/A",
                  ),
                  SizedBox(
                    height: 16.h,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  NavUtil.navigateScreen(context, const AddAgreementsScreen());
                },
                child: Image.asset(
                  'assets/dashboard/edit_float_img.png',
                  height: 64.h,
                  width: 64.w,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
