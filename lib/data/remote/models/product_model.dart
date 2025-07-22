import 'dart:convert';

ProductDataModel productModelFromJson(String str) =>
    ProductDataModel.fromJson(json.decode(str));

String productModelToJson(ProductDataModel data) => json.encode(data.toJson());

class ProductDataModel {
  final bool status;
  final String message;
  final List<ProductModel> data;

  ProductDataModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ProductDataModel.fromJson(Map<String, dynamic> json) =>
      ProductDataModel(
        status: json["status"],
        message: json["message"],
        data: List<ProductModel>.from(json["data"].map((x) => ProductModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() =>
      {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ProductModel {
  final String id; // Changed to String
  final String name;
  final String price;
  final String image;
  final String categoryId; // Changed to String
  final String status; // Changed to String
  final DateTime createdAt;
  final DateTime updatedAt;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.categoryId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      ProductModel(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        image: json["image"],
        categoryId: json["category_id"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "name": name,
        "price": price,
        "image": image,
        "category_id": categoryId,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}