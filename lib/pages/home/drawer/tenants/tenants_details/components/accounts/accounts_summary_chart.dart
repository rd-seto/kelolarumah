import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/data/model/tenants_details_model.dart';
import 'package:landlord/pages/home/drawer/tenants/components/summary_container_black.dart';
import 'package:landlord/pages/home/drawer/tenants/components/summary_container_white.dart';
import 'package:landlord/pages/home/drawer/tenants/tenants_details/components/accounts/edit_accounts_info.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class AccountsSummaryCart extends StatelessWidget {
  final List<Account>? accounts;

  const AccountsSummaryCart({super.key, this.accounts});

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
            text: 'Accounts',
            color: AppColors.titleTextColor,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            height: 1.75,
          ),
          SizedBox(
            height: 30.h,
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: accounts?.length ?? 0,
              itemBuilder: (context, index) {
                return Container(
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
                          title: "Account_No",
                          subTitle: accounts?[index].accountNumber ?? "N/A",
                        ),
                        SummaryContainerWhite(
                          title: "Account_Holder_Name",
                          subTitle: accounts?[index].name ?? "N/A",
                        ),
                        SummaryContainerBlack(
                          title: "Bank_Name",
                          subTitle: accounts?[index].name ?? "N/A",
                        ),
                        SummaryContainerWhite(
                          title: "Branch_Name",
                          subTitle: accounts?[index].branch ?? "N/A",
                        ),
                      ],
                    ),
                  ),
                );
              }),
          SizedBox(
            height: 30.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  NavUtil.navigateScreen(context, const EditAccountsInfo());
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
