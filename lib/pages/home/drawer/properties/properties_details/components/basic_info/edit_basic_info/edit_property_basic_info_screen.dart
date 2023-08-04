import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_app_bar.dart';
import 'package:landlord/components/elevated_button_widget.dart';
import 'package:landlord/components/new_text_form_field.dart';
import 'package:landlord/data/provider/property_details_edit_provider.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

class EditPropertyBasicInfo extends StatefulWidget {
  final int? propertyId;
  final VoidCallback onSave;
  const EditPropertyBasicInfo(
      {super.key, required this.onSave, this.propertyId});

  @override
  State<EditPropertyBasicInfo> createState() => _EditPropertyBasicInfoState();
}

class _EditPropertyBasicInfoState extends State<EditPropertyBasicInfo> {
  String dropdownValue = 'Residential';
  String dropdownValue1 = 'Complete';
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PropertyDetailsEditProvider>(context);
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
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      children: [
                        Expanded(
                            child: NewTextFromField(
                          title: "Size_of_property",
                          hintText: "2566",
                          onChange: (val) {
                            provider.propertyEditBodyModel.size = val;
                          },
                        )),
                        Expanded(
                            child: NewTextFromField(
                          title: "Rent_Price",
                          hintText: "\$2566",
                          onChange: (val) {
                            provider.propertyEditBodyModel.rentAmount = val;
                          },
                        )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      children: [
                        Expanded(
                            child: NewTextFromField(
                          title: "Bedroom",
                          hintText: "2",
                          onChange: (val) {
                            provider.propertyEditBodyModel.bedroom = val;
                          },
                        )),
                        Expanded(
                            child: NewTextFromField(
                          title: "bathrooms",
                          hintText: "1",
                          onChange: (val) {
                            provider.propertyEditBodyModel.bathroom = val;
                          },
                        )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      children: [
                        Expanded(
                            child: NewTextFromField(
                          title: "Parking",
                          hintText: "2",
                          onChange: (val) {
                            provider.propertyEditBodyModel.size = val;
                          },
                        )),
                        Expanded(
                            child: NewTextFromField(
                          title: "Flat_Number",
                          hintText: "A1",
                          onChange: (val) {
                            provider.propertyEditBodyModel.flatNo = val;
                          },
                        )),
                      ],
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Property_type',
                            style: TextStyle(
                                letterSpacing: 1,
                                color: AppColors.black2Sd,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700),
                          ).tr(),
                          SizedBox(
                            height: 8.h,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 0),
                            decoration: BoxDecoration(
                                color: AppColors.colorWhite,
                                borderRadius: BorderRadius.circular(5),
                                border:
                                    Border.all(color: const Color(0xffD6D6D6))),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                isExpanded: true,
                                value: dropdownValue,
                                icon: const Icon(Icons.keyboard_arrow_down),
                                elevation: 16,
                                style:
                                    const TextStyle(color: Color(0xff8A8A8A)),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownValue = newValue!;
                                    provider.propertyEditBodyModel.type =
                                        dropdownValue;
                                  });
                                },
                                items: <String>[
                                  'Residential',
                                  'Commercial',
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
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.colorWhite,
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Completion',
                            style: TextStyle(
                                letterSpacing: 1,
                                color: AppColors.black2Sd,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700),
                          ).tr(),
                          SizedBox(
                            height: 8.h,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 0),
                            decoration: BoxDecoration(
                                color: AppColors.colorWhite,
                                borderRadius: BorderRadius.circular(5),
                                border:
                                    Border.all(color: const Color(0xffD6D6D6))),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                isExpanded: true,
                                value: dropdownValue1,
                                icon: const Icon(Icons.keyboard_arrow_down),
                                elevation: 16,
                                style:
                                    const TextStyle(color: Color(0xff8A8A8A)),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownValue1 = newValue!;
                                    provider.propertyEditBodyModel.completion =
                                        dropdownValue1;
                                  });
                                },
                                items: <String>[
                                  'Complete',
                                  'Under Construction',
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
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: NewTextFromField(
                      title: "Description",
                      hintText: "Description",
                      onChange: (val) {
                        provider.propertyEditBodyModel.description = val;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ElevatedButtonWidget(
                    text: "Save",
                    onPressed: () {
                      provider.editPropertyBasicInfo(context, widget.propertyId,
                          () {
                        widget.onSave();
                      });
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
