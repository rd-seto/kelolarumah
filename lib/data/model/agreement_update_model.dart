
class AgreementUpdateModel {
  AgreementUpdateModel({

    this.property,
    this.moveIn,
    this.moveOut,
    this.rentAmount,
    this.rentType,
    this.reminderDate,
    this.note,
    this.advanceAmount,
  });

  String? property;
  String? moveIn;
  String? moveOut;
  String? rentAmount;
  String? rentType;
  String? reminderDate;
  String? note;
  String? advanceAmount;

  Map<String, dynamic> toJson() => {
    "move_in" : moveIn,
    "move_out" : moveOut,
    "rent_amount" : rentAmount,
    "rent_type" : rentType,
    "reminder_date" : reminderDate,
    "advance_amount" : advanceAmount,
    "note" : note
  };
}
