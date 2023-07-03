import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_app_bar.dart';
import 'package:landlord/components/elevated_button_widget.dart';
import 'package:landlord/data/model/report_property_list_model.dart';
import 'package:landlord/data/model/report_tenant_list_model.dart';
import 'package:landlord/data/provider/report_provider.dart';
import 'package:landlord/pages/home/drawer/report/report_transaction_details/report_transaction_details.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  String dropdownValue = 'Tenants';
  String dropdownValue1 = 'All Property';
  String dropdownValue2 = 'Last_12_Month'.tr();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ReportProvider(context),
      child: Consumer<ReportProvider>(builder: (context, provider, _) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(70.h),
            child: const CustomAppBar(appBarName: 'Report'),
          ),
          body: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Opacity(
                  opacity: 1,
                  child: Image.asset(
                    'assets/dashboard/backgorund_img.png',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 8.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.colorWhite,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0.w, vertical: 16.h),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 0),
                          decoration: BoxDecoration(
                              color: AppColors.colorWhite,
                              borderRadius: BorderRadius.circular(5),
                              border:
                                  Border.all(color: AppColors.mainColorsh1)),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<ReportProperty>(
                              hint: const Text('All_Property').tr(),
                              isExpanded: true,
                              value: provider.selectProperty,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              elevation: 16,
                              style: const TextStyle(color: Color(0xff8A8A8A)),
                              onChanged: (ReportProperty? newValue) {
                                setState(() {
                                  provider.selectProperty = newValue!;
                                  provider.tenantsDataByPropertyId(
                                      context, newValue);
                                });
                              },
                              items: provider.propertyList
                                  ?.map<DropdownMenuItem<ReportProperty>>(
                                      (ReportProperty? value) {
                                return DropdownMenuItem<ReportProperty>(
                                  value: value,
                                  child: Text(value?.name ?? ''),
                                );
                              }).toList(),
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
                        color: AppColors.colorWhite,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0.w, vertical: 16.h),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 0),
                          decoration: BoxDecoration(
                              color: AppColors.colorWhite,
                              borderRadius: BorderRadius.circular(5),
                              border:
                                  Border.all(color: AppColors.mainColorsh1)),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<ReportTenants>(
                              hint: const Text('Tenants').tr(),
                              isExpanded: true,
                              value: provider.selectTenant,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              elevation: 16,
                              style: const TextStyle(color: Color(0xff8A8A8A)),
                              onChanged: (ReportTenants? newValue) {
                                setState(() {
                                  provider.selectTenant = newValue!;
                                });
                              },
                              items: provider.tenantList
                                  ?.map<DropdownMenuItem<ReportTenants>>(
                                      (ReportTenants? value) {
                                return DropdownMenuItem<ReportTenants>(
                                  value: value,
                                  child: Text(value?.name ?? ''),
                                );
                              }).toList(),
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
                        color: AppColors.colorWhite,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0.w, vertical: 16.h),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 0),
                          decoration: BoxDecoration(
                              color: AppColors.colorWhite,
                              borderRadius: BorderRadius.circular(5),
                              border:
                                  Border.all(color: AppColors.mainColorsh1)),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: dropdownValue2,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              elevation: 16,
                              style: const TextStyle(color: Color(0xff8A8A8A)),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue2 = newValue!;
                                });
                              },
                              items: <String>[
                                'Last_12_Month'.tr(),
                                'Last_6_Month'.tr(),
                                'Last_3_Month'.tr(),
                                'Last_Month'.tr(),
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    ElevatedButtonWidget(
                      onPressed: () {
                        provider.reportDetails(context);
                      },
                      text: "Submit",
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
