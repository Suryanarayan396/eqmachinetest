import 'dart:convert';

class PersonDetailModel {
  String? name;
  String? phone;
  String? email;
  List<dynamic>? address;
  int? id;

  PersonDetailModel({
    this.name,
    this.phone,
    this.email,
    this.address,
    this.id,
  });

  factory PersonDetailModel.fromRawJson(String str) =>
      PersonDetailModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PersonDetailModel.fromJson(Map<String, dynamic> json) =>
      PersonDetailModel(
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        address: json["address"] == null
            ? []
            : List<dynamic>.from(json["address"]!.map((x) => x)),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone": phone,
        "email": email,
        "address":
            address == null ? [] : List<dynamic>.from(address!.map((x) => x)),
        "id": id,
      };
}
