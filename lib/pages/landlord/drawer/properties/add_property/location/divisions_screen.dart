import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_app_bar.dart';
import 'package:landlord/data/provider/add_property_provider.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

class DivisionsScreen extends StatelessWidget {
  const DivisionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddPropertyProvider>(context);
    return Consumer<AddPropertyProvider>(
      builder: (context, __, _) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(70.h),
            child: const CustomAppBar(appBarName: 'State'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: provider.locationModel?.data?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                final countryName = provider.locationModel?.data?[index];
                return InkWell(
                    onTap: () {
                      provider.setDivisions(countryName, context);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 5.0),
                      decoration: BoxDecoration(
                        color: AppColors.colorWhite,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0.w, vertical: 10.h),
                        child: Text(
                          countryName?.name ?? '',
                          style: TextStyle(
                              color: AppColors.black2Sd,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              height: 1.75),
                        ),
                      ),
                    ));
              },
            ),
          ),
        );
      },
    );
  }
}
