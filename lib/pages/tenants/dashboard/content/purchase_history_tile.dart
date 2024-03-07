import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';

class PurchaseHistoryTile extends StatelessWidget {
  const PurchaseHistoryTile(
      {super.key,
      required this.invoice,
      required this.date,
      required this.discountAmount,
      required this.grandTotal,
      required this.paidAmount,
      required this.dueAmount,
      this.onTap});

  final String invoice;
  final String date;
  final String discountAmount;
  final String grandTotal;
  final String paidAmount;
  final String dueAmount;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 2),
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        text: invoice,
                        color: const Color(0xff087c7c),
                        fontSize: 12.h,
                        height: 1.6),
                    CustomText(
                        text: date,
                        color: const Color(0xff087c7c),
                        fontSize: 12.h,
                        height: 1.6),
                    Text.rich(
                      TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                            text: 'grand_total'.tr(),
                            style: TextStyle(
                              fontSize: 12.0.r,
                            ),
                          ),
                          TextSpan(
                            text: grandTotal,
                            style: TextStyle(
                                fontSize: 12.0.r,
                                fontWeight: FontWeight.bold,
                                height: 1.6),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                            text: 'discount_amount'.tr(),
                            style: TextStyle(
                              fontSize: 12.0.r,
                            ),
                          ),
                          TextSpan(
                            text: discountAmount,
                            style: TextStyle(
                                fontSize: 12.0.r,
                                fontWeight: FontWeight.bold,
                                height: 1.6),
                          ),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                            text: 'paid_amount'.tr(),
                            style: TextStyle(
                              fontSize: 12.0.r,
                            ),
                          ),
                          TextSpan(
                            text: paidAmount,
                            style: TextStyle(
                                fontSize: 12.0.r,
                                fontWeight: FontWeight.bold,
                                height: 1.6),
                          ),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                            text: 'due_amount'.tr(),
                            style: TextStyle(
                              fontSize: 12.0.r,
                            ),
                          ),
                          TextSpan(
                            text: dueAmount,
                            style: TextStyle(
                                fontSize: 12.0.r,
                                fontWeight: FontWeight.bold,
                                height: 1.6),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              )
            ],
          ),
        ),
      ),
    );
  }
}
