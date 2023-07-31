import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_app_bar.dart';
import 'package:landlord/components/elevated_button_widget.dart';
import 'package:landlord/components/text_form_field.dart';
import 'package:landlord/data/provider/tenant_edit_provider.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

import '../../../../../../../data/model/tenants_details_model.dart';

class AddAgreementsScreen extends StatefulWidget {

  final Agreement? agreement;
  final int tenantId;
  final VoidCallback onSave;

  const AddAgreementsScreen({super.key, this.agreement, required this.tenantId, required this.onSave});

  @override
  State<AddAgreementsScreen> createState() => _AddAgreementsScreenState();
}

class _AddAgreementsScreenState extends State<AddAgreementsScreen> {
  String dropdownValue = 'Name';
  String dropdownValue1 = 'Monthly';

  late TextEditingController moveIn;
  late TextEditingController moveOut;
  late TextEditingController rentAmount;
  late TextEditingController advanceAmount;
  late TextEditingController rentType;
  late TextEditingController reminderDate;
  late TextEditingController note;

  @override
  void initState(){
    moveIn = TextEditingController(text: widget.agreement?.moveIn);
    moveOut = TextEditingController(text: widget.agreement?.moveOut);
    rentAmount = TextEditingController(text: widget.agreement?.rentAmount);
    advanceAmount = TextEditingController(text: widget.agreement?.advanceAmount);
    rentType = TextEditingController(text: widget.agreement?.rentType);
    reminderDate = TextEditingController(text: widget.agreement?.reminderDate);
    note = TextEditingController(text: widget.agreement?.note);
    super.initState();
  }
  Widget build(BuildContext context) {
    final provider = Provider.of<TenantEditProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBar(appBarName: 'Update Agreement'),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 16.h,
                  ),
                  FromField(
                    hintText: provider.dateOfMoveIn ?? widget.agreement?.moveIn,
                    title: "Move_In_Date",
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_month_outlined, color: AppColors.colorPrimary,),
                      onPressed: () {
                        provider.selectMoveInDate(context);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  FromField(
                    hintText: provider.dateOfMoveOut ?? widget.agreement?.moveOut,
                    title: "Move_out_Date",
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_month_outlined, color: AppColors.colorPrimary,),
                      onPressed: () {
                        provider.selectMoveOutDate(context);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  FromField(
                    hintText: "Enter Rent Amount",
                    title: "Rent_Amount",
                    controller: rentAmount,
                    onChange: (val){
                      provider.agreementEditModel.rentAmount = val;
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  FromField(
                    hintText: "Enter Advance Amount",
                    title: "Advance Amount",
                    controller: advanceAmount,
                    onChange: (val){
                      provider.agreementEditModel.advanceAmount = val;
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                   FromField(
                    hintText: "Monthly / Yearly",
                    title: "Rent Type",
                    controller: rentType,
                     onChange: (val){
                      provider.agreementEditModel.rentType = val;
                     },
                  ),

                  // SizedBox(
                  //   height: 16.h,
                  // ),
                  // const FromField(
                  //   hintText: "3",
                  //   title: "Rent_For",
                  // ),
                  SizedBox(
                    height: 16.h,
                  ),
                  FromField(
                    hintText: provider.dateOfReminder ?? widget.agreement?.reminderDate,
                    title: "Reminder_Date",
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_month_outlined, color: AppColors.colorPrimary,),
                      onPressed: () {
                        provider.selectReminderDate(context);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                   FromField(
                    hintText: "Enter your note",
                    title: "Note",
                    controller: note,
                     onChange: (val){
                      provider.agreementEditModel.note = val;
                     },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  ElevatedButtonWidget(
                    text: "Save",
                    onPressed: () {
                        provider.tenantDetailsEditAgreement(context, widget.tenantId, () {
                          widget.onSave();
                        });
                    },
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
