
class DashboardModel {
  DashboardModel({
    this.user,
    this.properties,
    this.transactions,
    this.totalProperties,
    this.totalOccupied,
    this.vacant,
  });

  List<User>? user;
  List<Property>? properties;
  Transactions? transactions;
  int? totalProperties;
  int? totalOccupied;
  int? vacant;

  factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
    user: json["user"] == null ? [] : List<User>.from(json["user"]!.map((x) => User.fromJson(x))),
    properties: json["properties"] == null ? [] : List<Property>.from(json["properties"]!.map((x) => Property.fromJson(x))),
    transactions: json["transactions"] == null ? null : Transactions.fromJson(json["transactions"]),
    totalProperties: json["total_properties"],
    totalOccupied: json["total_occupied"],
    vacant: json["vacant"],
  );

  Map<String, dynamic> toJson() => {
    "user": user == null ? [] : List<dynamic>.from(user!.map((x) => x.toJson())),
    "properties": properties == null ? [] : List<dynamic>.from(properties!.map((x) => x.toJson())),
    "transactions": transactions?.toJson(),
    "total_properties": totalProperties,
    "total_occupied": totalOccupied,
    "vacant": vacant,
  };
}

class Property {
  Property({
    this.id,
    this.name,
    this.image,
    this.dealType,
    this.type,
    this.completion,
    this.totalUnit,
    this.totalOccupied,
    this.totalRent,
    this.totalSell,
  });

  int? id;
  String? name;
  String? image;
  String? dealType;
  String? type;
  String? completion;
  int? totalUnit;
  int? totalOccupied;
  int? totalRent;
  int? totalSell;

  factory Property.fromJson(Map<String, dynamic> json) => Property(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    dealType: json["deal_type"],
    type: json["type"],
    completion: json["completion"],
    totalUnit: json["total_unit"],
    totalOccupied: json["total_occupied"],
    totalRent: json["total_rent"],
    totalSell: json["total_sell"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "deal_type": dealType,
    "type": type,
    "completion": completion,
    "total_unit": totalUnit,
    "total_occupied": totalOccupied,
    "total_rent": totalRent,
    "total_sell": totalSell,
  };
}

class Transactions {
  Transactions({
    this.list,
    this.links,
    this.pagination,
  });

  List<ListElement>? list;
  Links? links;
  Pagination? pagination;

  factory Transactions.fromJson(Map<String, dynamic> json) => Transactions(
    list: json["list"] == null ? [] : List<ListElement>.from(json["list"]!.map((x) => ListElement.fromJson(x))),
    links: json["links"] == null ? null : Links.fromJson(json["links"]),
    pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "list": list == null ? [] : List<dynamic>.from(list!.map((x) => x.toJson())),
    "links": links?.toJson(),
    "pagination": pagination?.toJson(),
  };
}

class Links {
  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  String? first;
  String? last;
  dynamic prev;
  dynamic next;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    first: json["first"],
    last: json["last"],
    prev: json["prev"],
    next: json["next"],
  );

  Map<String, dynamic> toJson() => {
    "first": first,
    "last": last,
    "prev": prev,
    "next": next,
  };
}

class ListElement {
  ListElement({
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

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
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

class Pagination {
  Pagination({
    this.total,
    this.count,
    this.perPage,
    this.currentPage,
    this.totalPages,
  });

  int? total;
  int? count;
  int? perPage;
  int? currentPage;
  int? totalPages;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    total: json["total"],
    count: json["count"],
    perPage: json["per_page"],
    currentPage: json["current_page"],
    totalPages: json["total_pages"],
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "count": count,
    "per_page": perPage,
    "current_page": currentPage,
    "total_pages": totalPages,
  };
}

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.dateOfBirth,
    this.nid,
    this.passport,
    this.gender,
    this.roleId,
  });

  int? id;
  String? name;
  String? email;
  String? phone;
  DateTime? dateOfBirth;
  String? nid;
  String? passport;
  String? gender;
  int? roleId;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    dateOfBirth: json["date_of_birth"] == null ? null : DateTime.parse(json["date_of_birth"]),
    nid: json["nid"],
    passport: json["passport"],
    gender: json["gender"],
    roleId: json["role_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "date_of_birth": "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
    "nid": nid,
    "passport": passport,
    "gender": gender,
    "role_id": roleId,
  };
}
