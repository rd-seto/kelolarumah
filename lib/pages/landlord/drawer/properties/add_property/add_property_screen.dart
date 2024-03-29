import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_app_bar.dart';
import 'package:landlord/components/elevated_button_widget.dart';
import 'package:landlord/data/provider/add_property_provider.dart';
import 'package:landlord/pages/landlord/drawer/properties/add_property/add_property_content.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

class AddPropertyScreen extends StatefulWidget {
  const AddPropertyScreen({super.key});

  @override
  State<AddPropertyScreen> createState() => _AddPropertyScreenState();
}

class _AddPropertyScreenState extends State<AddPropertyScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AddPropertyProvider>();
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBar(appBarName: 'Add_property'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Add property Field content
              AddPropertyContent(provider: provider),
              ElevatedButtonWidget(
                text: "Save",
                onPressed: () {
                  provider.createProperty(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
