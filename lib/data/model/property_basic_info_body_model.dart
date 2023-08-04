class PropertyBasicInfoModel {
  PropertyBasicInfoModel({
    this.size,
    this.rentAmount,
    this.bedroom,
    this.bathroom,
    this.flatNo,
    this.type,
    this.completion,
    this.description,
  });

  String? size;
  String? rentAmount;
  String? bedroom;
  String? bathroom;
  String? flatNo;
  String? type;
  String? completion;
  String? description;

  Map<String, dynamic> toJson() => {
        "size": size,
        "rent_amount": rentAmount,
        "bedroom": bedroom,
        "bathroom": bathroom,
        "flat_no": flatNo,
        "type": type,
        "completion": completion,
        "description": description
      };
}
