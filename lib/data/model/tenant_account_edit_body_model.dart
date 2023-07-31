class TenantAccountEditBodyModel {


  TenantAccountEditBodyModel({
    this.id,
    this.name,
    this.branch,
    this.accountNumber,
    this.accountName,
  });

  int? id;
  String? name;
  String? branch;
  String? accountNumber;
  String? accountName;

  Map<String, dynamic> toJson() => {

    "id" : id,
    "name" : name,
    "branch" : branch,
    "account_number" : accountNumber,
    "account_name" : accountName

  };

}