class Data {
  Data({
    required this.status,
    required this.message,
     this.data,
  });

  final bool? status;
  final String? message;
  final Data? data;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      status: json["status"],
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }



}

class Expense {
  final String? name;
  final int? amount;
  final DateTime? date;
  final String? invoice;
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  Expense({
    required this.name,
     required this.amount,
     this.date,
     this.invoice,
     this.id,
     this.createdAt,
     this.updatedAt,
     this.v,
  });



  factory Expense.fromJson(Map<String, dynamic> json){
    return Expense(
      name: json["name"],
      amount: json["amount"],
      date: DateTime.tryParse(json["date"] ?? ""),
      invoice: json["invoice"],
      id: json["_id"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }

}

