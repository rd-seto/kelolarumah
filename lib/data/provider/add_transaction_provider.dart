import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:landlord/data/model/add_transaction_model.dart';
import 'package:landlord/data/network/repository/repository.dart';
import 'package:landlord/pages/home/drawer/transaction/transaction_list/transaction_list_screen.dart';
import '../../pages/home/drawer/tenants/tenants_details/components/transaction/transaction_bill_model/transtion_add_bill_model.dart';
import '../../pages/home/drawer/tenants/tenants_details/components/transaction/widget/expense_widget.dart';
import '../../utils/nav_utail.dart';
import '../../utils/theme/app_colors.dart';

class AddTransactionProvider extends ChangeNotifier {
  AddTransactionModel? addTransactionResponse;

  TextEditingController dueController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  List<Property>? propertyList;
  List<Expense>? incomeList;
  List<Expense>? expenseList;
  List<Tenant>? tenantList;
  List<int>? indexes;
  List<PaymentMethod>? paymentList;

  XFile? image;

  PlatformFile? filePickerResult;
  String? fileName;

  final ImagePicker picker = ImagePicker();

  Property? property;
  Expense? incomeValueData;
  Expense? expenseValueData;
  Tenant? tenant;
  PaymentMethod? paymentType;

  String transactionValue = 'income';

  List<TransactionBillModel> transactionsList = [];

  List<ExpenseWidget> expenseWidgetList = [];
  List<String> expensePrice = [];

  List<String> incomePrice = [];

  final List<Expense>? income = [];
  final List<String> incomeStrList = [];
  late List<int> incomeIdList = [];
  late List<String> incomePriceList = [];
  TextEditingController price = TextEditingController();
  List<String> priceList = [];

  final List<Expense>? expense = [];
  final List<String> expenseStrList = [];

  String now = DateFormat('yyyy-MM-dd').format(DateTime.now());
  DateTime? setDate;
  String? finalSelectedDate;

  addDynamic(income) {
    if (incomePrice.isNotEmpty) {
      incomePrice = [];
      transactionsList = [];
    }
    notifyListeners();
    transactionsList.add(TransactionBillModel(
      title: "",
    ));

    incomeIdList = List.filled(transactionsList.length, 0);
    incomePriceList = List.filled(transactionsList.length, "");
  }

  addExpense(expense) {
    if (expensePrice.isNotEmpty) {
      expensePrice = [];
      expenseWidgetList = [];
    }
    notifyListeners();
    transactionsList.add(TransactionBillModel());
  }

  AddTransactionProvider(BuildContext context) {
    getAddTransactionData(context);
  }
  void getAddTransactionData(BuildContext context) async {
    var apiResponse = await RepositoryImpl(context).getAddTransactionData();
    if (apiResponse != null) {
      addTransactionResponse = apiResponse;
      propertyList = addTransactionResponse?.data?.properties;
      incomeList = addTransactionResponse?.data?.categories?.income;
      expenseList = addTransactionResponse?.data?.categories?.expense;
      tenantList = addTransactionResponse?.data?.tenants;
      paymentList = addTransactionResponse?.data?.paymentMethod;
      incomeList?.forEach((expense) {
        incomeStrList.add(expense.title!);
      });

      expenseList?.forEach((expense) {
        expenseStrList.add(expense.title!);
      });
    }
    notifyListeners();
  }

  int getIdByIncome({required String title, required int index}) {
    final id = incomeList!.firstWhere((element) => element.title == title).id!;
    incomeIdList[index] = id;

    return id;
  }

  void notify() {
    notifyListeners();
  }

  int getIdByExpense({required String title}) {
    return expenseList!.firstWhere((element) => element.title == title).id!;
  }

  void notifyExp() {
    notifyListeners();
  }

  selectPaymentType(PaymentMethod paymentValue) {
    paymentType = paymentValue;
    notifyListeners();
  }

  ///dropdown for property type
  selectProperty(Property propertyValue) {
    property = propertyValue;
    notifyListeners();
  }

  ///dropdown for tenant type
  selectTenant(Tenant tenantValue) {
    tenant = tenantValue;
    notifyListeners();
  }

  ///dropdown for income type
  selectIncome(Expense incomeValue) {
    incomeValueData = incomeValue;
    print(incomeValue);
    notifyListeners();
  }

  ///dropdown for expense type
  selectExpense(Expense expenseValue) {
    expenseValueData = expenseValue;
    print(expenseValue);
    notifyListeners();
  }

  void selectDate(BuildContext context) async {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2015, 8),
            lastDate: DateTime(2101))
        .then((value) {
      if (value != null) {
        setDate = value;
        finalSelectedDate = DateFormat('yyyy-MM-dd').format(value);
      }
      notifyListeners();
    });
  }

  void myAlert(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Center(
                child: const Text('Please_choose_media_to_select',
                        textAlign: TextAlign.center)
                    .tr()),
            content: SizedBox(
              height: MediaQuery.of(context).size.height / 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.colorPrimary),
                    child: Row(
                      children: [
                        const Icon(Icons.image),
                        SizedBox(
                          width: 16.w,
                        ),
                        const Text('From_Gallery').tr(),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.colorPrimary),
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.camera),
                        SizedBox(
                          width: 16.w,
                        ),
                        const Text('From_Camera').tr(),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.colorPrimary),
                    onPressed: () {
                      Navigator.pop(context);
                      _pickFile();
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.camera),
                        SizedBox(
                          width: 16.w,
                        ),
                        const Text('Upload_Pdf_File').tr(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    filePickerResult = null;
    var img = await picker.pickImage(source: media);
    image = img;
    notifyListeners();
  }

  void _pickFile() async {
    image = null;
    final pickFile = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (pickFile == null) return;

    filePickerResult = pickFile.files.first;
    fileName = filePickerResult?.path?.split("/").last;
    //print("...........${filePickerResult?.path}");
    notifyListeners();
  }
  //  @override
  // void dispose() {
  //   // TODO: implement dispose
  //
  //
  //   super.dispose();
  //
  // }

  void createTransaction(BuildContext context) async {
    priceList.addAll(transactionsList.map((e) => e.price ?? ""));

    final data = {
      "type": transactionValue,
      "date": finalSelectedDate,
      "amount": dueController.text,
      "property_id": property?.id,
      "attachment_id": File(image?.path ?? ""),
      "category_ids": incomeIdList.join(','),
      "values": priceList.join(','),
      "tenant_id": tenant?.id,
      //"note": noteController.text,
      "payment_method": paymentType?.name,
    };

    if (kDebugMode) {
      print("Add transaction value............$data");
    }

    RepositoryImpl(context).createTransaction(data).then((value) {
      if (value) {
        image = null;

        Fluttertoast.showToast(msg: 'transaction add successful');
        NavUtil.replaceScreen(context, const TransactionListScreen());
      }
    });
    // if(apiResponse['result'] == true){
    //   Fluttertoast.showToast(msg: apiResponse['message']);
    //   NavUtil.replaceScreen(context, TransactionListScreen());
    // }
    notifyListeners();
  }
}
