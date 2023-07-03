import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_app_bar.dart';
import 'package:landlord/components/elevated_button_widget.dart';
import 'package:landlord/components/text_form_field.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class AddAgreementsScreen extends StatefulWidget {
  const AddAgreementsScreen({super.key});

  @override
  State<AddAgreementsScreen> createState() => _AddAgreementsScreenState();
}

class _AddAgreementsScreenState extends State<AddAgreementsScreen> {
  String dropdownValue = 'Name';
  String dropdownValue1 = 'Monthly';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBar(appBarName: 'Add_Agreements'),
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
                                'Property_Name',
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
                                  });
                                },
                                items: <String>[
                                  'Name',
                                  'Cash',
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
                    hintText: "2023/02/15",
                    title: "Move_In_Date",
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_month_outlined),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  FromField(
                    hintText: "2023/02/15",
                    title: "Move_out_Date",
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_month_outlined),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  const FromField(
                    hintText: "15235328",
                    title: "Rent_Amount",
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
                                'Property_Name',
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
                                  });
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
                  const FromField(
                    hintText: "3",
                    title: "Rent_For",
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  FromField(
                    hintText: "2023/02/15",
                    title: "Reminder_Date",
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_month_outlined),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  const FromField(
                    hintText: "Note",
                    title: "Note",
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  ElevatedButtonWidget(
                    text: "Save",
                    onPressed: () {},
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
