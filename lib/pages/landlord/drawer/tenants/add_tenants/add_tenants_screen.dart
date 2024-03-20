import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:landlord/components/custom_app_bar.dart';
import 'package:landlord/components/elevated_button_widget.dart';
import 'package:landlord/components/text_form_field.dart';
import 'package:landlord/pages/landlord/drawer/tenants/components/Landlord_location/country_screen.dart';
import 'package:landlord/utils/nav_utail.dart';
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
                    child: provider.image != null ||
                            provider.filePickerResult != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: provider.filePickerResult == null
                                ? Image.file(
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
                controller: provider.nameController,
              ),
              SizedBox(
                height: 16.h,
              ),
              FromField(
                hintText: "example@gmail.com",
                title: "Email",
                controller: provider.emailController,
              ),
              SizedBox(
                height: 16.h,
              ),
              FromField(
                hintText: "01xxxxxxxxxx",
                title: "Phone",
                controller: provider.phoneController,
              ),
              SizedBox(
                height: 16.h,
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
              FromField(
                hintText: "*****",
                title: "Password",
                controller: provider.passController,
              ),
              SizedBox(
                height: 16.h,
              ),
              FromField(
                hintText: "*****",
                title: "Confirm Password",
                controller: provider.confirmPassController,
              ),
              SizedBox(
                height: 50.h,
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
