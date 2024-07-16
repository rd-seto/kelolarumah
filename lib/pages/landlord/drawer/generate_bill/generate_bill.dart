import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/elevated_button_widget.dart';
import 'package:landlord/data/provider/occupied_list_provider.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

import '../../../../components/custom_app_bar.dart';
import '../../../../data/model/occupied_list_,model.dart';

class GenerateBills extends StatelessWidget {
  const GenerateBills({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBar(appBarName: 'Occupied List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
            children: [
              Container(padding: const EdgeInsets.symmetric(horizontal: 10), width: double.infinity, decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.white, boxShadow: const [BoxShadow(color: Colors.grey, spreadRadius: 1),],),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<OccupiedList>(isExpanded: true, hint:  const Text("Occupied List", style: TextStyle(fontSize: 14),),
                    value: context.watch<OccupiedProvider>().occupiedValue, icon: const Icon(Icons.arrow_downward, size: 20,), iconSize: 24, elevation: 16,
                    onChanged: (OccupiedList? newValue) {
                      context.read<OccupiedProvider>().dropdownMenu(newValue);
                    },
                    items: context.watch<OccupiedProvider>().occupiedListResponse?.map<DropdownMenuItem<OccupiedList>>((OccupiedList value) {
                      return DropdownMenuItem<OccupiedList>(value: value.propertyName != null ? value : null, child: Text(value.propertyName ?? "", style: const TextStyle(fontSize: 14),),);}).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 16,),
              InkWell(
                onTap: () {
                  context.read<OccupiedProvider>().selectDate(context);
                },
                child: Container(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 14), width: double.infinity,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.white, boxShadow: const [BoxShadow(color: Colors.grey, spreadRadius: 1),],),
                  child: Row(
                    children: [
                      Center(child: Text(context.read<OccupiedProvider>().monthYear ?? "Select Month", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),)),
                      const Spacer(),
                      const Icon(Icons.calendar_month_outlined, color: AppColors.colorPrimary, size: 20,),
                    ],
                  ),
                ),
              ),
            ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 10.0,bottom: 10, right:10.0, left: 35.0),
        child: ElevatedButtonWidget(
          text: "Generate Bill",
          onPressed: () {
            context.read<OccupiedProvider>().generateBillSubmit(context);
          },
        ),
      ),
    );
  }
}
