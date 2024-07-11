class TenantReport {
  final int? id;
  final String? name;
  final String? email;
  final String? property;
  final String? reason;
  final String? startDate;
  final String? endDate;
  final String? status;

  TenantReport({this.id, this.name, this.email, this.property, this.reason, this.startDate, this.endDate, this.status});

  factory TenantReport.fromJson(Map<String, dynamic> json) {
    return TenantReport(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      property: json['property'],
      reason: json['for'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      status: json['status'],
    );
  }
}
