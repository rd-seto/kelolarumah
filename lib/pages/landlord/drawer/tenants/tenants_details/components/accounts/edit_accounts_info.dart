import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_app_bar.dart';
import 'package:landlord/components/text_form_field.dart';
import 'package:landlord/data/model/account_category_model.dart';
import 'package:landlord/data/model/tenants_details_model.dart';
import 'package:landlord/data/provider/tenant_edit_provider.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

class EditAccountsInfo extends StatefulWidget {
  final Account? accounts;
  final int tenantId;
  final VoidCallback onSave;
  final TenantsDetailsModel? tenantsDetailsResponse;

  const EditAccountsInfo(
      {super.key,
      this.accounts,
      required this.tenantId,
      required this.onSave,
      this.tenantsDetailsResponse});

  @override
  State<EditAccountsInfo> createState() => _EditAccountsInfoState();
}

class _EditAccountsInfoState extends State<EditAccountsInfo> {
  @override
  void initState() {
    // bankName = TextEditingController(text: widget.accounts?.name);
    // branchName = TextEditingController(text: widget.accounts?.branch);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          TenantEditProvider(context, widget.tenantsDetailsResponse),
      child: Consumer<TenantEditProvider>(builder: (context, provider, _) {
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
                        height: 8.h,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 16.h),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Account Category',
                                  style: TextStyle(
                                      letterSpacing: 1,
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700),
                                ).tr(),
                                Text(
                                  '*',
                                  style: TextStyle(
                                      letterSpacing: 1,
                                      color: Colors.red,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 0),
                              decoration: BoxDecoration(
                                  color: AppColors.colorWhite,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: const Color(0xffD6D6D6))),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<AccountCategory?>(
                                  isExpanded: true,
                                  value: provider.categoryValue,
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  hint: const Text('Accounts Category').tr(),
                                  elevation: 16,
                                  style:
                                      const TextStyle(color: Color(0xff8A8A8A)),
                                  onChanged: (AccountCategory? newValue) {
                                    setState(() {
                                      provider.categoryValue = newValue!;
                                    });
                                  },
                                  items: provider.categories
                                      ?.map<DropdownMenuItem<AccountCategory>>(
                                          (AccountCategory? value) {
                                    return DropdownMenuItem<AccountCategory>(
                                      value: value,
                                      child: Text(value?.type ?? ''),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      FromField(
                        controller: provider.accountNumber,
                        hintText: "Enter account number",
                        title: "Account_No",
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      FromField(
                        controller: provider.accountHolderName,
                        hintText: "Enter Account holder name",
                        title: "Account_Holder_Name",
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      FromField(
                        controller: provider.expenseAmount,
                        hintText: "0\$",
                        title: "Expanse Amount",
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      FromField(
                        controller: provider.bankName,
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
                        controller: provider.branchName,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      FromField(
                        hintText: "Add Note",
                        title: "Details",
                        controller: provider.accountsDetails,
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
                                    color: Colors.white,
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
      }),
    );
  }
}
