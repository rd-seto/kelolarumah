import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_app_bar.dart';
import 'package:landlord/components/elevated_button_widget.dart';
import 'package:landlord/components/text_form_field.dart';
import 'package:landlord/data/model/tenant_body_model.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';
import '../../../../../data/provider/tenant_provider.dart';

class AddTenantsScreen extends StatefulWidget {
  const AddTenantsScreen({super.key});

  @override
  State<AddTenantsScreen> createState() => _AddTenantsScreenState();
}

class _AddTenantsScreenState extends State<AddTenantsScreen> {
  DateTime? selectedDate;
  String? monthYear;

  @override
  void initState() {
    context.read<TenantProvider>().getTenantProperties(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TenantProvider>(context);

    String dropdownValue = 'Monthly';

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBar(appBarName: 'Add_Tenants'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DottedBorder(
                dashPattern: const [8, 4],
                borderType: BorderType.RRect,
                radius: const Radius.circular(8),
                color: AppColors.backgroundColor,
                strokeWidth: 1,
                child: InkWell(
                  onTap: () {
                    provider.myAlert(context);
                  },
                  child: Container(
                    height: 93.h,
                    width: MediaQuery.of(context).size.width / 2.8,
                    decoration: BoxDecoration(
                        color: const Color(0xffF2F2F2),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: AppColors.colorPrimary)),

                    //color: AppColors.black2Sd,
                    child: provider.image != null ||
                            provider.filePickerResult != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: provider.filePickerResult == null
                                ? Image.file(
                                    //to show image, you type like this.
                                    File(provider.image!.path),
                                    fit: BoxFit.cover,
                                    width:
                                        MediaQuery.of(context).size.width / 2.8,
                                    height: 93.h,
                                  )
                                : Center(
                                    child: Center(
                                      child: Text("${provider.fileName}"),
                                    ),
                                  ),
                          )
                        : const Center(
                            child: Icon(
                              Icons.add,
                              color: AppColors.colorPrimary,
                              size: 36,
                            ),
                          ),
                  ),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              FromField(
                hintText: "name",
                title: "name",
                onChange: (val) {
                  provider.tenantBodyModel.name = val;
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              FromField(
                hintText: "example@gmail.com",
                title: "Email",
                onChange: (val) {
                  provider.tenantBodyModel.email = val;
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              FromField(
                hintText: "01xxxxxxxxxx",
                title: "Phone",
                onChange: (val) {
                  provider.tenantBodyModel.phone = val;
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.colorWhite,
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 12),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Properties',
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
                      SizedBox(
                        height: 8.h,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 0),
                        decoration: BoxDecoration(
                            color: AppColors.colorWhite,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: const Color(0xffD6D6D6))),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<TenantProperty>(
                            isExpanded: true,
                            value: provider.selectedTenant,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            elevation: 16,
                            style: const TextStyle(color: Color(0xff8A8A8A)),
                            onChanged: (TenantProperty? selectedTenant) {
                              if (selectedTenant != null) {
                                provider.onPropertySelect(
                                    property: selectedTenant);
                              }
                            },
                            items: provider.properties
                                .map<DropdownMenuItem<TenantProperty>>(
                                    (TenantProperty property) {
                              return DropdownMenuItem<TenantProperty>(
                                value: property,
                                child: Text(property.name ?? ''),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Move_In_Date',
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
                      SizedBox(
                        height: 8.h,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.stockColor2),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          children: [
                            Text(
                              provider.tenantBodyModel.moveIn ?? provider.now,
                              style: TextStyle(
                                  letterSpacing: 1,
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                            const Spacer(),
                            IconButton(
                              icon: const Icon(Icons.calendar_month_outlined),
                              onPressed: () {
                                provider.moveInDate(context: context);
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Move_out_Date',
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
                      SizedBox(
                        height: 8.h,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.stockColor2),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          children: [
                            Text(
                              provider.tenantBodyModel.moveOut ?? provider.now,
                              style: TextStyle(
                                  letterSpacing: 1,
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                            const Spacer(),
                            IconButton(
                              icon: const Icon(Icons.calendar_month_outlined),
                              onPressed: () {
                                provider.moveOutDate(context: context);
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              FromField(
                title: "Advance_Amount",
                hintText: "1000",
                onChange: (val) {
                  provider.tenantBodyModel.advanceAmount = val;
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.colorWhite,
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 12),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Rent_Type',
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
                      SizedBox(
                        height: 8.h,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 0),
                        decoration: BoxDecoration(
                            color: AppColors.colorWhite,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: const Color(0xffD6D6D6))),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: dropdownValue,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            elevation: 16,
                            style: const TextStyle(color: Color(0xff8A8A8A)),
                            onChanged: (String? val) {
                              provider.tenantBodyModel.rentType = val;
                            },
                            items: <String>[
                              'Monthly',
                              'Yearly',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              FromField(
                title: "Rent_Amount",
                hintText: "1000",
                onChange: (val) {
                  provider.tenantBodyModel.rentAmount = val;
                },
              ),
              SizedBox(
                height: 60.h,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: ElevatedButtonWidget(
          text: "Submit",
          onPressed: () {
            provider.addTenant(context);
          },
        ),
      ),
    );
  }
}
