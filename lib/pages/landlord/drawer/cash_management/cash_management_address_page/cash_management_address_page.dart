import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_app_bar.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/components/text_form_field.dart';
import 'package:landlord/pages/landlord/drawer/cash_management/successfully_page/successfully_page.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class CashManagementAddressPage extends StatefulWidget {
  const CashManagementAddressPage({super.key});

  @override
  State<CashManagementAddressPage> createState() =>
      _CashManagementAddressPageState();
}

class _CashManagementAddressPageState extends State<CashManagementAddressPage> {
  String dropdownValue = 'Bangladeshi';
  String dropdownValue1 = 'Education';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBar(appBarName: 'Cash Management'),
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
                  const FromField(
                    hintText: "4140 Parker Rd. Allentown, New Mexico31134",
                    title: "Address",
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  const FromField(
                    hintText: "Celina",
                    title: "City",
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  const FromField(
                    hintText: "Celina",
                    title: "Zip Code",
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  const FromField(
                    hintText: "Celina",
                    title: "State",
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  const FromField(
                    hintText: "BDXXXXXXXXXX",
                    title: "Passport No",
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.colorWhite,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0.w, vertical: 16.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: 'Country',
                            color: AppColors.titleTextColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
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
                                    Border.all(color: AppColors.stockColor)),
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
                                  'Bangladeshi',
                                  'USA',
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
                    height: 20.h,
                  ),
                  const FromField(
                    hintText: "123456789",
                    title: "Employer ID Number ",
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.colorWhite,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0.w, vertical: 16.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: 'Industry',
                            color: AppColors.titleTextColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
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
                                    Border.all(color: AppColors.stockColor)),
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
                                  'Education',
                                  'Business',
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
                    height: 20.h,
                  ),
                  CustomText(
                    text:
                        'By filling out this application, you understand and agree that Unit’s use of your data is governed by its  Privacy Policy. Your data will be automatically saved until you complete and submit this application.',
                    color: AppColors.black2Sd,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 18.h,
                        width: 18.w,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.stockColor),
                            borderRadius: BorderRadius.circular(4.r)),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Expanded(
                        child: CustomText(
                          text:
                              'I agree to the Stessa Privacy Policy, Consent to Electronic Disclosures, Deposit Terms & Conditions, Client Terms of Service,',
                          color: AppColors.black2Sd,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  SizedBox(
                    height: 52.h,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            backgroundColor: AppColors.mainColorsh1),
                        onPressed: () {},
                        child: Row(
                          children: [
                            Text(
                              '3/3',
                              style: TextStyle(
                                letterSpacing: 1.sp,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              'NEXT',
                              style: TextStyle(
                                letterSpacing: 1.sp,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const Spacer(),
                            InkWell(
                                onTap: () {
                                  NavUtil.navigateScreen(
                                      context, const SuccessfullyPage());
                                },
                                child: const Icon(Icons.double_arrow_outlined))
                          ],
                        )),
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
