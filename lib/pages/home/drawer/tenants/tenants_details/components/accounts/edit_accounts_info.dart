import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_app_bar.dart';
import 'package:landlord/components/text_form_field.dart';
import 'package:landlord/data/model/tenants_details_model.dart';
import 'package:landlord/data/provider/tenant_edit_provider.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

class EditAccountsInfo extends StatefulWidget {
  final Account? accounts;
  final int tenantId;
  final VoidCallback onSave;

  const EditAccountsInfo(
      {super.key, this.accounts, required this.tenantId, required this.onSave});

  @override
  State<EditAccountsInfo> createState() => _EditAccountsInfoState();
}

class _EditAccountsInfoState extends State<EditAccountsInfo> {
  late TextEditingController accountNumber;
  late TextEditingController accountHolderName;
  late TextEditingController bankName;
  late TextEditingController branchName;

  @override
  void initState() {
    accountNumber = TextEditingController(text: widget.accounts?.accountNumber);
    accountHolderName =
        TextEditingController(text: widget.accounts?.accountName);
    bankName = TextEditingController(text: widget.accounts?.name);
    branchName = TextEditingController(text: widget.accounts?.branch);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TenantEditProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBar(appBarName: 'Edit_Accounts'),
      ),
      body: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height / 4,
            left: 0,
            right: 0,
            bottom: 0,
            child: Opacity(
              opacity: 0.5,
              child: Image.asset(
                'assets/dashboard/backgorund_img.png',
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20.0.sp),
              child: Column(
                children: [
                  SizedBox(
                    height: 12.h,
                  ),
                  FromField(
                    controller: accountNumber,
                    hintText: "Enter account number",
                    title: "Account_No",
                    onChange: (val) {
                      provider.tenantAccountEditBodyModel.accountNumber = val;
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  FromField(
                    controller: accountHolderName,
                    hintText: "Enter Account holder name",
                    title: "Account_Holder_Name",
                    onChange: (val) {
                      provider.tenantAccountEditBodyModel.accountName = val;
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  FromField(
                    controller: bankName,
                    hintText: "Enter Bank Name",
                    title: "Bank_Name",
                    onChange: (val) {
                      provider.tenantAccountEditBodyModel.name = val;
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  FromField(
                    hintText: "Enter branch name",
                    title: "Branch_Name",
                    controller: branchName,
                    onChange: (val) {
                      provider.tenantAccountEditBodyModel.branch = val;
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  SizedBox(
                    height: 50,
                    width: 150,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            backgroundColor: AppColors.colorPrimary),
                        onPressed: () {
                          provider.tenantDetailsEditAccount(
                              context, widget.tenantId, () {
                            widget.onSave();
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/dashboard/save_vector.png',
                              height: 24.h,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              'Save',
                              style: TextStyle(
                                letterSpacing: 1.sp,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ).tr(),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
