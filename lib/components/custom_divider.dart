import 'package:flutter/material.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(color: AppColors.stockColor.withOpacity(0.6), height: 1);
  }
}
