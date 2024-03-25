import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_app_bar.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/components/elevated_button_widget.dart';
import 'package:landlord/components/text_form_field.dart';
import 'package:landlord/data/model/all_drop_down_model.dart';
import 'package:landlord/data/provider/add_property_provider.dart';
import 'package:landlord/pages/landlord/drawer/properties/add_property/location/country_screen.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

class AddPropertyScreen extends StatefulWidget {
  const AddPropertyScreen({super.key});

  @override
  State<AddPropertyScreen> createState() => _AddPropertyScreenState();
}

class _AddPropertyScreenState extends State<AddPropertyScreen> {
  String dropdownValue1 = 'Bangladesh';

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AddPropertyProvider>();
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBar(appBarName: 'Add_property'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'General_Information',
                color: AppColors.titleTextColor,
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(
                height: 20.h,
              ),
              FromField(
                controller: provider.propertyController,
                title: "Property_Name",
                hintText: "name",
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
                            'Property_type',
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
                            value: provider.dealTypeValue,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            hint: const Text('Select_Type').tr(),
                            elevation: 16,
                            style: const TextStyle(color: Color(0xff8A8A8A)),
                            onChanged: (String? newValue) {
                              setState(() {
                                provider.dealTypeValue = newValue!;
                              });
                            },
                            items: provider.type
                                ?.map<DropdownMenuItem<String>>((String value) {
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
                            'Category',
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
                          child: DropdownButton<Category?>(
                            isExpanded: true,
                            value: provider.categoryValue,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            hint: const Text('Select_Categories').tr(),
                            elevation: 16,
                            style: const TextStyle(color: Color(0xff8A8A8A)),
                            onChanged: (Category? newValue) {
                              setState(() {
                                provider.categoryValue = newValue!;
                              });
                            },
                            items: provider.categories
                                ?.map<DropdownMenuItem<Category>>(
                                    (Category? value) {
                              return DropdownMenuItem<Category>(
                                value: value,
                                child: Text(value?.name ?? ''),
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
                controller: provider.addressController,
                title: "Address",
                hintText: "Type_your_address",
              ),
              SizedBox(
                height: 16.h,
              ),
              InkWell(
                onTap: () {
                  NavUtil.navigateScreen(context, const CountryScreen());
                },
                child: IgnorePointer(
                  child: FromField(
                    controller: provider.countryController,
                    hintText: "Select Country",
                    title: "Country",
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              InkWell(
                onTap: () {
                  NavUtil.navigateScreen(context, const CountryScreen());
                },
                child: IgnorePointer(
                  child: FromField(
                    controller: provider.divisionsController,
                    hintText: "Select your State",
                    title: "State",
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              InkWell(
                onTap: () {
                  NavUtil.navigateScreen(context, const CountryScreen());
                },
                child: IgnorePointer(
                  child: FromField(
                    controller: provider.districtController,
                    hintText: "Select your City",
                    title: "City",
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              // InkWell(
              //   onTap: () {
              //     NavUtil.navigateScreen(context, const CountryScreen());
              //   },
              //   child: IgnorePointer(
              //     child: FromField(
              //       controller: provider.areaController,
              //       hintText: "Select_your_area",
              //       title: "Area",
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 16.h,
              ),
              const FromField(
                title: "Post_Code",
                hintText: "Type_post_code",
              ),
              SizedBox(
                height: 16.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 0.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Property Image',
                      color: AppColors.black2Sd,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    InkWell(
                      onTap: () {
                        provider.myAlert(context);
                      },
                      child: DottedBorder(
                        dashPattern: const [8, 4],
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(8),
                        color: AppColors.colorPrimary,
                        strokeWidth: 1,
                        child: provider.image != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.file(
                                  //to show image, you type like this.
                                  File(provider.image!.path),
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.height / 6,
                                  height: 93.h,
                                ),
                              )
                            : Container(
                                height: 93.h,
                                width: MediaQuery.of(context).size.height / 6,
                                decoration: BoxDecoration(
                                    color: AppColors.colorWhite,
                                    borderRadius: BorderRadius.circular(4.r)),
                                child: const Center(
                                  child: Icon(
                                    Icons.add,
                                    color: AppColors.colorPrimary,
                                    size: 36,
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              ElevatedButtonWidget(
                text: "Save",
                onPressed: () {
                  provider.createProperty(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
