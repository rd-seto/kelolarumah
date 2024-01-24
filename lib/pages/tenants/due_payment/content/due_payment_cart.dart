import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/pages/tenants/purchase_history/content/purchase_history_details.dart';
import 'package:landlord/utils/nav_utail.dart';

class DuePaymentCart extends StatelessWidget {
  const DuePaymentCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      color: Colors.white,
      child: ListTile(
        onTap: () {
          NavUtil.navigateScreen(context, const PurchaseHistoryDetails());
        },
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            'assets/drawer/apartment_img.png',
            height: 80,
            width: 80,
          ),
        ),
        title: CustomText(
          text: "HubSpot's Service Hub",
          color: const Color(0xff087c7c),
          fontSize: 12.h,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 6.h),
            CustomText(
              text: "\$500",
              color: Colors.black,
              fontSize: 12.h,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 6.h),
            CustomText(
              text: "10 jul 2024",
              color: Colors.black,
              fontSize: 12.h,
            ),
          ],
        ),
        trailing: CustomText(
          text: "Pending",
          color: Colors.orange,
          fontSize: 12.h,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
