class PaymentReport {
  final int? id;
  final String? invoiceNo;
  final String? date;
  final String? property;
  final String? tenant;
  final String? trxNo;
  final String? paymentMethod;
  final String? amount;

  PaymentReport(
      {this.id, this.invoiceNo, this.date, this.property, this.tenant, this.trxNo, this.paymentMethod, this.amount});

  factory PaymentReport.fromJson(Map<String, dynamic> json) {
    return PaymentReport(
        id: json['id'],
        invoiceNo: json['invoice_no'],
        date: json['date'],
        property: json['property'],
        tenant: json['tenant'],
        trxNo: json['trx_no'],
        paymentMethod: json['payment_method'],
        amount: json['amount']);
  }
}
