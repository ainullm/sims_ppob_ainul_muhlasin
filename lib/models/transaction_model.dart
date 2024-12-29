class TransactionModel {
  int? status;
  String? message;
  Data? data;

  TransactionModel({this.status, this.message, this.data});

  TransactionModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? offset;
  String? limit;
  List<Records>? records;

  Data({this.offset, this.limit, this.records});

  Data.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    limit = json['limit'];
    if (json['records'] != null) {
      records = <Records>[];
      json['records'].forEach((v) {
        records!.add(Records.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['offset'] = offset;
    data['limit'] = limit;
    if (records != null) {
      data['records'] = records!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Records {
  String? invoiceNumber;
  String? transactionType;
  String? description;
  int? totalAmount;
  String? createdOn;

  Records(
      {this.invoiceNumber,
      this.transactionType,
      this.description,
      this.totalAmount,
      this.createdOn});

  Records.fromJson(Map<String, dynamic> json) {
    invoiceNumber = json['invoice_number'];
    transactionType = json['transaction_type'];
    description = json['description'];
    totalAmount = json['total_amount'];
    createdOn = json['created_on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['invoice_number'] = invoiceNumber;
    data['transaction_type'] = transactionType;
    data['description'] = description;
    data['total_amount'] = totalAmount;
    data['created_on'] = createdOn;
    return data;
  }
}
