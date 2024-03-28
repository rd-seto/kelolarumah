import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_app_bar.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/components/elevated_button_widget.dart';
import 'package:landlord/components/new_text_form_field.dart';
import 'package:landlord/data/model/property_details_model.dart';
import 'package:landlord/data/provider/property_details_edit_provider.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

class AddFloorPlanScreen extends StatelessWidget {
  final int? propertyId;
  final VoidCallback onSave;
  const AddFloorPlanScreen({
    super.key,
    required this.onSave,
    this.propertyId,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PropertyDetailsEditProvider(context: context),
      child: Consumer<PropertyDetailsEditProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(70.h),
              child: const CustomAppBar(appBarName: 'Add_Floor_Plan'),
            ),
            body: Padding(
              padding: EdgeInsets.all(20.0.sp),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: InkWell(
                        onTap: () {
                          provider.imgagePicker(context);
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
                                    width:
                                        MediaQuery.of(context).size.height / 6,
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
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomText(
                      text: 'Floor_Plans',
                      color: AppColors.titleTextColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: NewTextFromField(
                        title: "Title",
                        hintText: "Enter Floor plan Title",
                        controller: provider.titleController,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ElevatedButtonWidget(
                      text: "SAVE",
                      onPressed: () {
                        provider.floorPlanImageAdd(context, propertyId, () {
                          onSave();
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
