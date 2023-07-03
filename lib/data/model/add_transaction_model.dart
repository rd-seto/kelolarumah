
class AddTransactionModel {
  AddTransactionModel({
    this.result,
    this.apiEndPoint,
    this.message,
    this.data,
  });

  bool? result;
  String? apiEndPoint;
  String? message;
  Data? data;

  factory AddTransactionModel.fromJson(Map<String, dynamic> json) => AddTransactionModel(
    result: json["result"],
    apiEndPoint: json["api_end_point"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

}

class Data {
  Data({
    this.messages,
    this.paymentMethod,
    this.tenants,
    this.properties,
    this.categories,
  });

  String? messages;
  List<PaymentMethod>? paymentMethod;
  List<Tenant>? tenants;
  List<Property>? properties;
  Categories? categories;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    messages: json["messages"],
    paymentMethod: json["payment_method"] == null ? [] : List<PaymentMethod>.from(json["payment_method"]!.map((x) => PaymentMethod.fromJson(x))),
    tenants: json["tenants"] == null ? [] : List<Tenant>.from(json["tenants"]!.map((x) => Tenant.fromJson(x))),
    properties: json["properties"] == null ? [] : List<Property>.from(json["properties"]!.map((x) => Property.fromJson(x))),
    categories: json["categories"] == null ? null : Categories.fromJson(json["categories"]),
  );

}

class Categories {
  Categories({
    this.income,
    this.expense,
  });

  List<Expense>? income;
  List<Expense>? expense;

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
    income: json["income"] == null ? [] : List<Expense>.from(json["income"]!.map((x) => Expense.fromJson(x))),
    expense: json["expense"] == null ? [] : List<Expense>.from(json["expense"]!.map((x) => Expense.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "income": income == null ? [] : List<dynamic>.from(income!.map((x) => x.toJson())),
    "expense": expense == null ? [] : List<dynamic>.from(expense!.map((x) => x.toJson())),
  };
}

class Expense {
  Expense({
    this.id,
    this.title,
  });

  int? id;
  String? title;

  factory Expense.fromJson(Map<String, dynamic> json) => Expense(
    id: json["id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
  };
}

class PaymentMethod {
  PaymentMethod({
    this.name,
  });

  String? name;

  factory PaymentMethod.fromJson(Map<String, dynamic> json) => PaymentMethod(
    name: json["name"],
  );
}

class Property {
  Property({
    this.id,
    this.name,
    this.tenant,
  });

  int? id;
  String? name;
  String? tenant;

  factory Property.fromJson(Map<String, dynamic> json) => Property(
    id: json["id"],
    name: json["name"],
    tenant: json["tenant"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "tenant": tenant,
  };
}

class Tenant {
  Tenant({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory Tenant.fromJson(Map<String, dynamic> json) => Tenant(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
