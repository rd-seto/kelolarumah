import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/data/model/tenant_deu_payment_model.dart';

class DuePaymentCart extends StatelessWidget {
  const DuePaymentCart({super.key, required this.list});

  final DuePaymentListElement list;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      color: Colors.white,
      child: ListTile(
        // onTap: () {
        //   NavUtil.navigateScreen(context, const PurchaseHistoryDetails());
        // },
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            list.property!.image!,
            height: 80,
            width: 80,
          ),
        ),
        title: CustomText(
          text: list.property!.name,
          color: const Color(0xff087c7c),
          fontSize: 12.h,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 6.h),
            CustomText(
              text: "Paid ${list.paidAmount}",
              color: Colors.black,
              fontSize: 12.h,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 6.h),
            CustomText(
              text: "Due ${list.dueAmount}",
              color: Colors.black,
              fontSize: 12.h,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
        trailing: CustomText(
          text: list.paymentStatus,
          color: Colors.orange,
          fontSize: 12.h,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
