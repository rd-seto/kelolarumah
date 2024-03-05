import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_app_bar.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/components/elevated_button_widget.dart';
import 'package:landlord/data/model/property_facelities_model.dart';
import 'package:landlord/data/provider/property_details_edit_provider.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

class EditFacilitiesScreen extends StatefulWidget {
  final VoidCallback onSave;
  final int? propertyId;
  const EditFacilitiesScreen(
      {super.key, required this.onSave, this.propertyId});

  @override
  State<EditFacilitiesScreen> createState() => _EditFacilitiesScreenState();
}

class _EditFacilitiesScreenState extends State<EditFacilitiesScreen> {
  String dropdownValue = 'Electricity';
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
              child: const CustomAppBar(appBarName: 'Edit_Facilities'),
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
                          height: 20.h,
                        ),
                        Row(
                          children: [
                            CustomText(
                              text: 'Facilities',
                              color: AppColors.titleTextColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              height: 1.75,
                            ),
                            // const Spacer(),
                            // Container(
                            //   decoration: BoxDecoration(
                            //       color: AppColors.colorPrimary,
                            //       borderRadius: BorderRadius.circular(8)),
                            //   child: Padding(
                            //     padding: const EdgeInsets.all(6.0),
                            //     child: Row(
                            //       children: [
                            //         const Icon(
                            //           Icons.add,
                            //           color: AppColors.colorWhite,
                            //         ),
                            //         SizedBox(
                            //           width: 8.w,
                            //         ),
                            //         CustomText(
                            //           text: 'Add',
                            //           color: AppColors.colorWhite,
                            //           fontSize: 14.sp,
                            //           fontWeight: FontWeight.w700,
                            //           height: 1.75,
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // )
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.0.w, vertical: 12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 0),
                                          decoration: BoxDecoration(
                                              color: AppColors.colorWhite,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                  color:
                                                      const Color(0xffD6D6D6))),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton<FacilityType>(
                                              isExpanded: true,
                                              value:
                                                  provider.selectedfacilities,
                                              icon: const Icon(
                                                  Icons.keyboard_arrow_down),
                                              elevation: 16,
                                              style: const TextStyle(
                                                  color: Color(0xff8A8A8A)),
                                              onChanged: (FacilityType?
                                                  selectedfacilities) {
                                                if (selectedfacilities !=
                                                    null) {
                                                  provider.onPropertySelect(
                                                      selectId:
                                                          selectedfacilities);
                                                }
                                                // setState(() {
                                                //   provider.selectedfacilities =
                                                //       selectedfacilities;
                                                //   // dropdownValue = selectedfacilities!;
                                                //   // provider.FacilityType =
                                                //   //     dropdownValue;
                                                // });
                                              },
                                              items: provider.facilities.map<
                                                      DropdownMenuItem<
                                                          FacilityType>>(
                                                  (FacilityType value) {
                                                return DropdownMenuItem<
                                                    FacilityType>(
                                                  value: value,
                                                  child: Text(value.name ?? ''),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: TextFormField(
                                controller: provider.facilitiesController,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: AppColors.colorWhite,
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                          color: AppColors.colorPrimary,
                                          width: 1.0),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 13.h, horizontal: 16.w),
                                    hintText: '0',
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                          color: AppColors.stockColor),
                                    ),
                                    hintStyle: const TextStyle(
                                        fontSize: 14,
                                        color: AppColors.hintTextColor,
                                        fontWeight: FontWeight.w400),
                                    border: const OutlineInputBorder()),
                              )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        ElevatedButtonWidget(
                          text: "Save",
                          onPressed: () {
                            provider.addFacelities(context, () {
                              widget.onSave();
                            }, widget.propertyId!);
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
