import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_app_bar.dart';
import 'package:landlord/components/elevated_button_widget.dart';
import 'package:landlord/components/text_form_field.dart';
import 'package:landlord/data/model/tenants_details_model.dart';
import 'package:landlord/data/provider/tenant_edit_provider.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

class EditBasicInfo extends StatefulWidget {
  final BasicInfo? basicInfo;
  final int? tenantsId;
  final VoidCallback onSave;

  const EditBasicInfo(
      {super.key, this.basicInfo, this.tenantsId, required this.onSave});

  @override
  State<EditBasicInfo> createState() => _EditBasicInfoState();
}

class _EditBasicInfoState extends State<EditBasicInfo> {
  late TextEditingController name;
  late TextEditingController phone;
  late TextEditingController email;
  late TextEditingController occupation;
  late TextEditingController designation;
  late TextEditingController institution;
  late TextEditingController date;
  late TextEditingController nidNo;
  late TextEditingController permanentAddress;
  late TextEditingController passportNumber;
  late TextEditingController nationality;

  @override
  void initState() {
    // TODO: implement initState
    name = TextEditingController(text: widget.basicInfo?.name);
    phone = TextEditingController(text: widget.basicInfo?.phone);
    email = TextEditingController(text: widget.basicInfo?.email);
    occupation = TextEditingController(text: widget.basicInfo?.occupation);
    //designation = TextEditingController(text: widget.basicInfo?.designation);
    institution = TextEditingController(text: widget.basicInfo?.institution);
    date = TextEditingController(text: widget.basicInfo?.joinDate);
    nidNo = TextEditingController(text: widget.basicInfo?.nid);
    permanentAddress =
        TextEditingController(text: widget.basicInfo?.presentAddress);
    passportNumber = TextEditingController(text: widget.basicInfo?.passport);
    nationality = TextEditingController(text: widget.basicInfo?.nationality);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TenantEditProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBar(appBarName: 'Edit_Basic_Info'),
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
                    controller: name,
                    hintText: "",
                    title: "name",
                    onChange: (val) {
                      provider.tenantEditBodyModel.name = val;
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  FromField(
                    hintText:
                        provider.dateOfJoining ?? widget.basicInfo?.joinDate,
                    title: "Join date",
                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.calendar_month_outlined,
                        color: AppColors.colorPrimary,
                      ),
                      onPressed: () {
                        provider.selectDate(context);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  FromField(
                    controller: phone,
                    hintText: "",
                    title: "Phone_Number",
                    onChange: (val) {
                      provider.tenantEditBodyModel.phone = val;
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  FromField(
                    controller: email,
                    hintText: "",
                    title: "Email",
                    onChange: (val) {
                      provider.tenantEditBodyModel.email = val;
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  FromField(
                    controller: occupation,
                    hintText: "",
                    title: "Occupation",
                    onChange: (val) {
                      provider.tenantEditBodyModel.occupation = val;
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  // FromField(
                  //   controller: designation,
                  //   hintText: "Manager",
                  //   title: "Designation",
                  //   onChange: (val) {
                  //     provider.tenantEditBodyModel.designation = val;
                  //   },
                  // ),
                  SizedBox(
                    height: 16.h,
                  ),
                  FromField(
                    controller: institution,
                    hintText: "",
                    title: "Institution",
                    onChange: (val) {
                      provider.tenantEditBodyModel.institution = val;
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  FromField(
                    controller: nidNo,
                    hintText: "",
                    title: "NID_No",
                    onChange: (val) {
                      provider.tenantEditBodyModel.nid = val;
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  FromField(
                    controller: permanentAddress,
                    hintText: "",
                    title: "Permanent_Address",
                    onChange: (val) {
                      provider.tenantEditBodyModel.presentAddress = val;
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  FromField(
                    controller: passportNumber,
                    hintText: "",
                    title: "Passport_No",
                    onChange: (val) {
                      provider.tenantEditBodyModel.passport = val;
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  FromField(
                    controller: nationality,
                    hintText: "",
                    title: "Nationality",
                    onChange: (val) {
                      provider.tenantEditBodyModel.nationality = val;
                    },
                  ),
                  SizedBox(
                    height: 70.h,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: ElevatedButtonWidget(
              text: "Save",
              onPressed: () {
                provider.tenantEditApi(context, widget.tenantsId, () {
                  widget.onSave();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
