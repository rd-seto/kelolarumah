import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/data/model/tenants_details_model.dart';
import 'package:landlord/data/provider/tenants_details_provider.dart';
import 'package:landlord/pages/home/drawer/tenants/components/summary_container_black.dart';
import 'package:landlord/pages/home/drawer/tenants/components/summary_container_white.dart';
import 'package:landlord/pages/home/drawer/tenants/tenants_details/components/accounts/edit_accounts_info.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class AccountsSummaryCart extends StatelessWidget {
  final Account? accounts;
  final int tenantId;
  final TenantsDetailsProvider? provider;

  const AccountsSummaryCart({super.key, this.accounts ,required this.tenantId, this.provider});

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
                              title: "Account_No",
                              subTitle: accounts?.accountNumber ?? "N/A",
                            ),
                            SummaryContainerWhite(
                              title: "Account_Holder_Name",
                              subTitle: accounts?.accountName ?? "N/A",
                            ),
                            SummaryContainerBlack(
                              title: "Bank_Name",
                              subTitle: accounts?.name ?? "N/A",
                            ),
                            SummaryContainerWhite(
                              title: "Branch_Name",
                              subTitle: accounts?.branch ?? "N/A",
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  NavUtil.navigateScreen(context,  EditAccountsInfo(
                    tenantId: tenantId,
                    accounts: accounts,
                    onSave: (){
                      provider?.tenantsDetailsData(context, tenantId);
                    },
                  ));
                },
                child: Image.asset(
                  'assets/dashboard/edit_float_img.png',
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
