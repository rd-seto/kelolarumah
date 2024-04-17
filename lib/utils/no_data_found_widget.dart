import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoDataFoundWidget extends StatelessWidget {
  // final String title;
  final String assetImage;

  const NoDataFoundWidget(
      {super.key,
      // this.title = 'No_data_found'.tr(),
      this.assetImage = 'assets/dashboard/no_data_found.json'});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(assetImage, repeat: false, height: 200),
        Text(
          'No_data_found'.tr(),
          style: TextStyle(
              color: Colors.black.withOpacity(0.4),
              fontSize: 18,
              fontWeight: FontWeight.w500),
        ),
      ],
    ));
  }
}
