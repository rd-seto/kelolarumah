import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_app_bar.dart';
import 'package:landlord/components/elevated_button_widget.dart';
import 'package:landlord/components/text_form_field.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

import '../../../../../../../data/provider/add_emergency_contact_provider.dart';

class AddEmergencyScreen extends StatefulWidget {

  final int? tenantId;

  const AddEmergencyScreen({super.key, required this.tenantId});

  @override
  State<AddEmergencyScreen> createState() => _AddEmergencyScreenState();
}

class _AddEmergencyScreenState extends State<AddEmergencyScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AddEmergencyContractProvider>();
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBar(appBarName: 'Add Emergency Contract'),
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
                  Center(
                    child: Stack(
                      children: [
                        InkWell(
                          onTap: () => provider.myAlert(context),
                          child: Container(
                            height: 110,
                            width: 110,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: const Color(0xFFE4E4E4),
                                    width: 8)),
                            child: provider.image == null
                                ? const Icon(
                              CupertinoIcons.person_solid,
                              color: Colors.grey,
                              size: 60,
                            )
                                : ClipOval(
                                child: Image.file(
                                  File(provider.image!.path),
                                  fit: BoxFit.cover,
                                  height: 100,
                                  width: 100,
                                )),
                          ),
                        ),
                        Positioned(
                          bottom: 6,
                          right: 6,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.colorPrimary),
                            child: const Icon(
                              size: 18.0,
                              Icons.edit,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                   FromField(
                    hintText: "Enter emergency contract name",
                    title: "name",
                    controller: provider.nameController,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                   FromField(
                    hintText: "Enter emergency contract phone number",
                    title: "Phone",
                    controller: provider.phoneController,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                   FromField(
                    hintText: "Enter emergency contract email address",
                    title: "Email",
                    controller: provider.emailController,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                   FromField(
                    hintText: "Relation",
                    title: "Relation",
                    controller: provider.relationController,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                   FromField(
                    hintText: "Occupation",
                    title: "occupation",
                    controller: provider.occupationController,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ElevatedButtonWidget(
                    text: "Save",
                    onPressed: () {
                      provider.addEmergencyContract(context, widget.tenantId);
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
