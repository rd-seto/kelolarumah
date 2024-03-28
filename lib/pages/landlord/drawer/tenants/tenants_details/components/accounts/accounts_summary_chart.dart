import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/data/provider/tenants_details_provider.dart';
import 'package:landlord/pages/landlord/drawer/tenants/components/summary_container_black.dart';
import 'package:landlord/pages/landlord/drawer/tenants/components/summary_container_white.dart';
import 'package:landlord/pages/landlord/drawer/tenants/tenants_details/components/accounts/edit_accounts_info.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/no_data_found_widget.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class AccountsSummaryCart extends StatelessWidget {
  final int tenantId;
  final TenantsDetailsProvider? provider;

  const AccountsSummaryCart({super.key, required this.tenantId, this.provider});

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
              provider?.tenantsDetailsResponse?.data?.accounts?.isEmpty == false
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: provider?.tenantsDetailsResponse?.data
                              ?.accounts?.length ??
                          0,
                      itemBuilder: (context, index) {
                        final data = provider
                            ?.tenantsDetailsResponse?.data?.accounts?[index];
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
                                  subTitle: data?.accountNumber ?? "N/A",
                                ),
                                SummaryContainerWhite(
                                  title: "Account Category",
                                  subTitle: data?.accountCategory ?? "N/A",
                                ),
                                SummaryContainerBlack(
                                  title: "Branch_Name",
                                  subTitle: data?.bankBranch ?? "N/A",
                                ),
                                SizedBox(
                                  height: 28.h,
                                ),
                                // SummaryContainerWhite(
                                //   title: "Branch_Name",
                                //   subTitle: accounts?.branch ?? "N/A",
                                // ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : const NoDataFoundWidget(),
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
                  NavUtil.navigateScreen(
                      context,
                      EditAccountsInfo(
                        tenantId: tenantId,
                        // accounts: accounts,
                        onSave: () {
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
