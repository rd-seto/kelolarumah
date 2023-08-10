import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_app_bar.dart';
import 'package:landlord/components/elevated_button_widget.dart';
import 'package:landlord/components/new_text_form_field.dart';
import 'package:landlord/data/provider/property_details_edit_provider.dart';
import 'package:landlord/data/provider/property_details_provider.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

class AddGalleryScreen extends StatelessWidget {
  final int? propertyId;
  final VoidCallback onSave;
  const AddGalleryScreen({super.key, required this.onSave, this.propertyId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PropertyDetailsEditProvider(context),
      child: Consumer<PropertyDetailsEditProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(70.h),
              child: const CustomAppBar(appBarName: 'Add_Gallery'),
            ),
            body: Padding(
              padding: EdgeInsets.all(20.0.sp),
              child: Column(
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
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: NewTextFromField(
                      controller: provider.titleController,
                      title: "Title",
                      hintText: "Bedroom",
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ElevatedButtonWidget(
                    text: "Save",
                    onPressed: () {
                      provider.addImage(context, propertyId, () {
                        onSave();
                      }, 'gallery');
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
