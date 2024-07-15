import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBar(appBarName: 'Occupied List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(color: Colors.grey, spreadRadius: 1),
                  ],
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    hint:  const Text("Occupied List",
                      style: TextStyle(fontSize: 14),
                    ),
                    value: context.watch<OccupiedProvider>().occupiedValue,
                    icon: const Icon(
                      Icons.arrow_downward,
                      size: 20,
                    ),
                    iconSize: 24,
                    elevation: 16,
                    onChanged: (String? newValue) {
                      context.read<OccupiedProvider>().dropdownMenu(newValue);
                    },
                    items: context.watch<OccupiedProvider>().occupiedListResponse?.map<DropdownMenuItem<String>>((OccupiedList value) {
                      return DropdownMenuItem<String>(value: value.propertyName,
                        child: Text(value.propertyName ?? "",
                          style: const TextStyle(fontSize: 14),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  provider.selectDate(context);
                },
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          provider.selectDate(context);
                        },
                        icon: const FaIcon(
                          FontAwesomeIcons.angleLeft,
                          size: 30,
                          color: AppColors.colorPrimary,
                        )),
                    const Spacer(),
                    Center(
                        child: Text(
                          provider.monthYear ?? "",
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        )),
                    const Spacer(),
                    IconButton(
                        onPressed: () {
                          provider.selectDate(context);
                        },
                        icon: const FaIcon(
                          FontAwesomeIcons.angleRight,
                          size: 30,
                          color: AppColors.colorPrimary,
                        )),
                  ],
                ),
              ),
            ],
        ),
      ),
    );
  }
}
