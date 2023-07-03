

class TransactionDetailsModel {
  TransactionDetailsModel({
    this.lists,
  });

  Lists? lists;

  factory TransactionDetailsModel.fromJson(Map<String, dynamic> json) => TransactionDetailsModel(
    lists: json["lists"] == null ? null : Lists.fromJson(json["lists"]),
  );

  Map<String, dynamic> toJson() => {
    "lists": lists?.toJson(),
  };
}

class Lists {
  Lists({
    this.id,
    this.property,
    this.appDate,
    this.attachment,
    this.tenant,
    this.rentalAgreement,
    this.amount,
    this.type,
    this.date,
    this.note,
    this.paymentDetails,
    this.invoice,
  });

  int? id;
  String? property;
  String? appDate;
  String? attachment;
  Tenant? tenant;
  RentalAgreement? rentalAgreement;
  int? amount;
  String? type;
  DateTime? date;
  String? note;
  PaymentDetails? paymentDetails;
  Invoice? invoice;

  factory Lists.fromJson(Map<String, dynamic> json) => Lists(
    id: json["id"],
    property: json["property"],
    appDate: json["app_date"],
    attachment: json["attachment"],
    tenant: json["tenant"] == null ? null : Tenant.fromJson(json["tenant"]),
    rentalAgreement: json["rental_agreement"] == null ? null : RentalAgreement.fromJson(json["rental_agreement"]),
    amount: json["amount"],
    type: json["type"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    note: json["note"],
    paymentDetails: json["payment_details"] == null ? null : PaymentDetails.fromJson(json["payment_details"]),
    invoice: json["invoice"] == null ? null : Invoice.fromJson(json["invoice"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "property": property,
    "app_date": appDate,
    "attachment": attachment,
    "tenant": tenant?.toJson(),
    "rental_agreement": rentalAgreement?.toJson(),
    "amount": amount,
    "type": type,
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "note": note,
    "payment_details": paymentDetails?.toJson(),
    "invoice": invoice?.toJson(),
  };
}

class Invoice {
  Invoice({
    this.invoiceNumber,
    this.invoiceDate,
    this.appInvoiceDate,
  });

  String? invoiceNumber;
  DateTime? invoiceDate;
  String? appInvoiceDate;

  factory Invoice.fromJson(Map<String, dynamic> json) => Invoice(
    invoiceNumber: json["invoice_number"],
    invoiceDate: json["invoice_date"] == null ? null : DateTime.parse(json["invoice_date"]),
    appInvoiceDate: json["app_invoice_date"],
  );

  Map<String, dynamic> toJson() => {
    "invoice_number": invoiceNumber,
    "invoice_date": "${invoiceDate!.year.toString().padLeft(4, '0')}-${invoiceDate!.month.toString().padLeft(2, '0')}-${invoiceDate!.day.toString().padLeft(2, '0')}",
    "app_invoice_date": appInvoiceDate,
  };
}

class PaymentDetails {
  PaymentDetails({
    this.paymentMethod,
    this.chequeNumber,
    this.bankName,
    this.bankBranch,
    this.bankAccountNumber,
    this.bankAccountName,
    this.onlinePaymentMethod,
    this.onlinePaymentTransactionId,
    this.onlinePaymentTransactionStatus,
    this.paymentStatus,
  });

  String? paymentMethod;
  String? chequeNumber;
  String? bankName;
  String? bankBranch;
  String? bankAccountNumber;
  String? bankAccountName;
  dynamic onlinePaymentMethod;
  dynamic onlinePaymentTransactionId;
  dynamic onlinePaymentTransactionStatus;
  String? paymentStatus;

  factory PaymentDetails.fromJson(Map<String, dynamic> json) => PaymentDetails(
    paymentMethod: json["payment_method"],
    chequeNumber: json["cheque_number"],
    bankName: json["bank_name"],
    bankBranch: json["bank_branch"],
    bankAccountNumber: json["bank_account_number"],
    bankAccountName: json["bank_account_name"],
    onlinePaymentMethod: json["online_payment_method"],
    onlinePaymentTransactionId: json["online_payment_transaction_id"],
    onlinePaymentTransactionStatus: json["online_payment_transaction_status"],
    paymentStatus: json["payment_status"],
  );

  Map<String, dynamic> toJson() => {
    "payment_method": paymentMethod,
    "cheque_number": chequeNumber,
    "bank_name": bankName,
    "bank_branch": bankBranch,
    "bank_account_number": bankAccountNumber,
    "bank_account_name": bankAccountName,
    "online_payment_method": onlinePaymentMethod,
    "online_payment_transaction_id": onlinePaymentTransactionId,
    "online_payment_transaction_status": onlinePaymentTransactionStatus,
    "payment_status": paymentStatus,
  };
}

class RentalAgreement {
  RentalAgreement({
    this.id,
    this.amount,
    this.startDate,
    this.endDate,
    this.note,
  });

  int? id;
  int? amount;
  DateTime? startDate;
  DateTime? endDate;
  String? note;

  factory RentalAgreement.fromJson(Map<String, dynamic> json) => RentalAgreement(
    id: json["id"],
    amount: json["amount"],
    startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
    endDate: json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
    note: json["note"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "amount": amount,
    "start_date": "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
    "end_date": "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
    "note": note,
  };
}

class Tenant {
  Tenant({
    this.id,
    this.name,
    this.email,
    this.phone,
  });

  int? id;
  String? name;
  String? email;
  String? phone;

  factory Tenant.fromJson(Map<String, dynamic> json) => Tenant(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
  };
}
