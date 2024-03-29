import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/text_form_field.dart';
import 'package:landlord/data/provider/tenant_edit_provider.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class EditBasicInfoContent extends StatelessWidget {
  final TenantEditProvider? provider;
  const EditBasicInfoContent({super.key, this.provider});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20.0.sp),
        child: Column(
          children: [
            SizedBox(
              height: 12.h,
            ),
            FromField(
              controller: provider?.name,
              hintText: "",
              title: "name",
            ),
            SizedBox(
              height: 16.h,
            ),
            FromField(
              hintText: provider?.dateOfJoining,
              title: "Join date",
              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.calendar_month_outlined,
                  color: AppColors.colorPrimary,
                ),
                onPressed: () {
                  provider?.selectDate(context);
                },
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            FromField(
              controller: provider?.phone,
              hintText: "",
              title: "Phone_Number",
              onChange: (val) {
                provider?.tenantEditBodyModel.phone = val;
              },
            ),
            SizedBox(
              height: 16.h,
            ),
            FromField(
              controller: provider?.email,
              hintText: "",
              title: "Email",
              onChange: (val) {
                provider?.tenantEditBodyModel.email = val;
              },
            ),
            SizedBox(
              height: 16.h,
            ),
            FromField(
              controller: provider?.occupation,
              hintText: "",
              title: "Occupation",
              onChange: (val) {
                provider?.tenantEditBodyModel.occupation = val;
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
            //     provider?.tenantEditBodyModel.designation = val;
            //   },
            // ),
            SizedBox(
              height: 16.h,
            ),
            FromField(
              controller: provider?.institution,
              hintText: "",
              title: "Institution",
              onChange: (val) {
                provider?.tenantEditBodyModel.institution = val;
              },
            ),
            SizedBox(
              height: 16.h,
            ),
            FromField(
              controller: provider?.nidNo,
              hintText: "",
              title: "NID_No",
              onChange: (val) {
                provider?.tenantEditBodyModel.nid = val;
              },
            ),
            SizedBox(
              height: 16.h,
            ),
            FromField(
              controller: provider?.presentAddress,
              hintText: "",
              title: "Permanent_Address",
              onChange: (val) {
                provider?.tenantEditBodyModel.presentAddress = val;
              },
            ),
            SizedBox(
              height: 16.h,
            ),
            FromField(
              controller: provider?.passportNumber,
              hintText: "",
              title: "Passport_No",
              onChange: (val) {
                provider?.tenantEditBodyModel.passport = val;
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            FromField(
              controller: provider?.nationality,
              hintText: "",
              title: "Nationality",
              onChange: (val) {
                provider?.tenantEditBodyModel.nationality = val;
              },
            ),
            SizedBox(
              height: 70.h,
            ),
          ],
        ),
      ),
    );
  }
}
