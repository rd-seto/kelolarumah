import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../data/model/add_transaction_model.dart';
import '../../../../../../../../data/provider/add_transaction_provider.dart';
import '../../../../../../../../utils/theme/app_colors.dart';
import '../transaction_bill_model/transtion_add_bill_model.dart';

class IncomeWidget extends StatefulWidget {
  final TransactionBillModel item;
  final int itemIndex;

  IncomeWidget({
    super.key,
    required this.item,
    required this.itemIndex,
  });

  @override
  State<IncomeWidget> createState() => _IncomeWidgetState();
}

class _IncomeWidgetState extends State<IncomeWidget> {
  TextEditingController product = TextEditingController();

  @override
  void initState() {
    widget.item.title =
        context.read<AddTransactionProvider>().incomeList!.first.title;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddTransactionProvider>(context);

    return ListBody(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.colorWhite,
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 12),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Income Type',
                            style: TextStyle(
                                letterSpacing: 1,
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            '*',
                            style: TextStyle(
                                letterSpacing: 1,
                                color: Colors.red,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 0),
                              decoration: BoxDecoration(
                                  color: AppColors.colorWhite,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: const Color(0xffD6D6D6))),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  value: widget.item.title,
                                  hint: const Text("Select Income"),
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  elevation: 16,
                                  style:
                                      const TextStyle(color: Color(0xff8A8A8A)),
                                  onChanged: (String? title) {
                                    widget.item.title = title;
                                    provider.getIdByIncome(
                                      title: title!,
                                      index: widget.itemIndex,
                                    );
                                    provider.notify();
                                  },
                                  items: provider.incomeStrList
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 50.h,
                              child: TextFormField(
                                // controller: provider.transactionsList[widget.itemIndex].price,
                                decoration: const InputDecoration(
                                    labelText: 'Price',
                                    border: OutlineInputBorder()),
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  setState(() {
                                    provider.transactionsList[widget.itemIndex]
                                        .price = value;
                                  });
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }
}
