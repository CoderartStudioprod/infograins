import 'dart:convert';

class Listofpriduct {
  String? id;
  int? v;
  String? name;
  int? price;
  String? description;

  Listofpriduct({
    this.id,
    this.v,
    this.name,
    this.price,
    this.description,
  });

  factory Listofpriduct.fromJson(String str) =>
      Listofpriduct.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Listofpriduct.fromMap(Map<String, dynamic> json) => Listofpriduct(
        id: json["_id"] == null ? "" : json["_id"],
        v: json["__v"] == null ? "" : json["__v"],
        name: json["name"] == null ? "" : json["name"],
        price: json["price"] == null ? "" : json["price"],
        description: json["description"] == null ? "" : json["description"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "__v": v,
        "name": name,
        "price": price,
        "description": description,
      };
}
