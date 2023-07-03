import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_app_bar.dart';
import 'package:landlord/components/elevated_button_widget.dart';
import 'package:landlord/components/text_form_field.dart';
import 'package:landlord/data/model/add_transaction_model.dart';
import 'package:landlord/pages/home/drawer/tenants/tenants_details/components/transaction/widget/expense_widget.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';
import '../../../../../../../../data/provider/add_transaction_provider.dart';
import '../widget/incomeWidget.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddTransactionProvider>(context);

    Widget incomeDynamicTextField = ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: provider.transactionsList.length,
        itemBuilder: (_, index) {
          return IncomeWidget(
            item: provider.transactionsList.elementAt(index),
            itemIndex: index,
          );
        });

    Widget expenseDynamicTextField = ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: provider.transactionsList.length,
      itemBuilder: (_, index) {
        return ExpenseWidget(
          item: provider.transactionsList.elementAt(index),
          itemIndex: index,
        );
      },
    );

    return Consumer(
      builder: (BuildContext context, __, _) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(70.h),
            child: const CustomAppBar(appBarName: 'Add_Transaction'),
          ),
          body: Stack(
            children: [
              Positioned(
                top: MediaQuery.of(context).size.height / 4,
                left: 0,
                right: 0,
                bottom: 0,
                child: Opacity(
                  opacity: 0.5,
                  child: Image.asset(
                    'assets/dashboard/backgorund_img.png',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0.sp),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    DottedBorder(
                      dashPattern: const [8, 4],
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(8),
                      color: AppColors.backgroundColor,
                      strokeWidth: 1,
                      child: InkWell(
                        onTap: () {
                          provider.myAlert(context);
                        },
                        child: Container(
                          height: 93.h,
                          width: MediaQuery.of(context).size.width / 2.8,
                          decoration: BoxDecoration(
                              color: const Color(0xffF2F2F2),
                              borderRadius: BorderRadius.circular(5),
                              border:
                                  Border.all(color: AppColors.colorPrimary)),
                          child: provider.image != null ||
                                  provider.filePickerResult != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: provider.filePickerResult == null
                                      ? Image.file(
                                          //to show image, you type like this.
                                          File(provider.image!.path),
                                          fit: BoxFit.fill,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.8,
                                          height: 93.h,
                                        )
                                      : Center(
                                          child: Text("${provider.fileName}"),
                                        ),
                                )
                              : const Center(
                                  child: Icon(
                                    Icons.add,
                                    color: AppColors.colorPrimary,
                                    size: 36,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),

                    ///Property
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.colorWhite,
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0.w, vertical: 12),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Property_Name',
                                  style: TextStyle(
                                      letterSpacing: 1,
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700),
                                ).tr(),
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

                            ///property dropdown
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 0),
                              decoration: BoxDecoration(
                                  color: AppColors.colorWhite,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: const Color(0xffD6D6D6))),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<Property>(
                                  isExpanded: true,
                                  value: provider.property,
                                  hint: const Text("Select_Property").tr(),
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  elevation: 16,
                                  style:
                                      const TextStyle(color: Color(0xff8A8A8A)),
                                  onChanged: (Property? newValue) {
                                    provider.selectProperty(newValue!);
                                  },
                                  items: provider.propertyList
                                      ?.map<DropdownMenuItem<Property>>(
                                          (Property value) {
                                    return DropdownMenuItem<Property>(
                                      value: value,
                                      child: Text(value.name ?? ""),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),

                    ///transaction Type Drop Down
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.colorWhite,
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0.w, vertical: 12),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Transaction_Type',
                                  style: TextStyle(
                                      letterSpacing: 1,
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700),
                                ).tr(),
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
                            Container(
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
                                  value: provider.transactionValue,
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  elevation: 16,
                                  style:
                                      const TextStyle(color: Color(0xff8A8A8A)),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      provider.transactionValue = newValue!;
                                    });
                                  },
                                  items: <String>[
                                    'income',
                                    'expense',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),

                    ///add transaction bill button
                    SizedBox(
                      child: InkWell(
                        onTap: () {
                          provider.transactionValue == "income"
                              ? provider.addDynamic(provider
                                  .addTransactionResponse
                                  ?.data
                                  ?.categories
                                  ?.income)
                              : provider.addExpense(provider
                                  .addTransactionResponse
                                  ?.data
                                  ?.categories
                                  ?.expense);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 14.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.colorPrimary),
                          child: const Text(
                            "Add_bill",
                            style: TextStyle(
                                color: AppColors.colorWhite,
                                fontWeight: FontWeight.bold),
                          ).tr(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),

                    ///transaction bill input list
                    provider.transactionValue == "income"
                        ? incomeDynamicTextField
                        : expenseDynamicTextField,
                    SizedBox(
                      height: 12.h,
                    ),

                    ///Tenants Drop Down
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.colorWhite,
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0.w, vertical: 12),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Tenants_Name',
                                  style: TextStyle(
                                      letterSpacing: 1,
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700),
                                ).tr(),
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
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 0),
                              decoration: BoxDecoration(
                                  color: AppColors.colorWhite,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: const Color(0xffD6D6D6))),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<Tenant>(
                                  hint: const Text("Select Tenant"),
                                  isExpanded: true,
                                  value: provider.tenant,
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  elevation: 16,
                                  style:
                                      const TextStyle(color: Color(0xff8A8A8A)),
                                  onChanged: (Tenant? newValue) {
                                    setState(() {
                                      provider.tenant = newValue!;
                                    });
                                  },
                                  items: provider.tenantList
                                      ?.map<DropdownMenuItem<Tenant>>(
                                          (Tenant value) {
                                    return DropdownMenuItem<Tenant>(
                                      value: value,
                                      child: Text(value.name ?? ""),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 16.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Date',
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
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.stockColor2),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Row(
                                children: [
                                  Text(
                                    provider.finalSelectedDate ?? provider.now,
                                    style: TextStyle(
                                        letterSpacing: 1,
                                        color: Colors.black,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    icon: const Icon(
                                        Icons.calendar_month_outlined),
                                    onPressed: () {
                                      provider.selectDate(context);
                                    },
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    FromField(
                      controller: provider.dueController,
                      hintText: "15235328",
                      title: "Due",
                    ),

                    SizedBox(
                      height: 16.h,
                    ),

                    ///Payment Drop Down
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.colorWhite,
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0.w, vertical: 12),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Payment_Type',
                                  style: TextStyle(
                                      letterSpacing: 1,
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700),
                                ).tr(),
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
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 0),
                              decoration: BoxDecoration(
                                  color: AppColors.colorWhite,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: const Color(0xffD6D6D6))),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<PaymentMethod>(
                                  hint: const Text("Select payment"),
                                  isExpanded: true,
                                  value: provider.paymentType,
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  elevation: 16,
                                  style:
                                      const TextStyle(color: Color(0xff8A8A8A)),
                                  onChanged: (PaymentMethod? newValue) {
                                    setState(() {
                                      provider.paymentType = newValue!;
                                    });
                                  },
                                  items: provider.paymentList
                                      ?.map<DropdownMenuItem<PaymentMethod>>(
                                          (PaymentMethod value) {
                                    return DropdownMenuItem<PaymentMethod>(
                                      value: value,
                                      child: Text(value.name ?? ""),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),

                    FromField(
                      controller: provider.noteController,
                      hintText: "Note",
                      title: "Note",
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    ElevatedButtonWidget(
                      text: "Save",
                      onPressed: () {
                        provider.createTransaction(context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
