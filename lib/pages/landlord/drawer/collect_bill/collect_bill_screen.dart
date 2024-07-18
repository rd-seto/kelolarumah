import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/data/provider/collect_bill_provider.dart';
import 'package:provider/provider.dart';
import '../../../../components/custom_app_bar.dart';
import '../../../../components/elevated_button_widget.dart';
import '../../../../data/model/bill_management_model.dart';
import '../../../../data/model/tenant_account_model.dart';
import '../../../../utils/theme/app_colors.dart';

class CollectBillScreen extends StatelessWidget {
  final ListElement? billData;
  const CollectBillScreen({super.key,this.billData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBar(appBarName: 'Collect Bill'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(padding: const EdgeInsets.symmetric(horizontal: 10), width: double.infinity, decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.white, boxShadow: const [BoxShadow(color: Colors.grey, spreadRadius: 1),],),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<AccountList>(isExpanded: true, hint:  const Text("Occupied List", style: TextStyle(fontSize: 14),),
                    value: context.watch<CollectBillProvider>().occupiedValue, icon: const Icon(Icons.arrow_downward, size: 20,), iconSize: 24, elevation: 16,
                    onChanged: (AccountList? newValue) {
                      context.read<CollectBillProvider>().dropdownMenu(newValue);
                    },
                    items: context.watch<CollectBillProvider>().accountListResponse?.map<DropdownMenuItem<AccountList>>((AccountList value) {
                      return DropdownMenuItem<AccountList>(value: value.name != null ? value : null, child: Text(value.name ?? "", style: const TextStyle(fontSize: 14),),);}).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              const Text("Additional info", style: TextStyle(fontWeight: FontWeight.bold),),
              const SizedBox(height: 16,),
               TextField(
                controller: context.read<CollectBillProvider>().additionalTextController,
                maxLines: 5,
                keyboardType: TextInputType.name,
                decoration:  const InputDecoration(floatingLabelBehavior: FloatingLabelBehavior.always, hintText: "Write additional info", hintStyle: TextStyle(fontSize: 14),
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)),),),
              ),
              const SizedBox(
                height: 25,
              ),
              // const Text("Attachment", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
              // const SizedBox(height: 16,),
              // InkWell(
              //   onTap: () {
              //     context.read<CollectBillProvider>().updateAttachmentImage(context);
              //   },
              //   child: Container(
              //     decoration: BoxDecoration(border: Border.all(color: Colors.green, style: BorderStyle.solid, width: 0.0,), color: Colors.grey[200], borderRadius: BorderRadius.circular(3.0),),
              //     child: DottedBorder(color: const Color(0xffC7C7C7), borderType: BorderType.RRect, radius: const Radius.circular(3), padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14), strokeWidth: 2,
              //       child: const Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children:  [
              //           Icon(Icons.upload_file, color: Colors.grey,),
              //           SizedBox(width: 8,),
              //           Text("Upload your file", style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w600),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(padding: const EdgeInsets.only(top: 10.0,bottom: 10, right:10.0, left: 35.0),
        child: ElevatedButtonWidget(text: "Collect Bill",
          onPressed: () {
            context.read<CollectBillProvider>().collectBillApi(context);
          },
        ),
      ),
    );
  }
}
