import 'dart:convert';

class CartResponseModel {
  final bool status;
  final String message;
  final List<CartItem> data;

  CartResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CartResponseModel.fromJson(Map<String, dynamic> json) =>
      CartResponseModel(
        status: json["status"],
        message: json["message"],
        data: List<CartItem>.from(
            json["data"].map((x) => CartItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() =>
      {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CartItem {
  final int id;
  final int productId;
  final String name;
  final String price;
  final int quantity;
  final String image;

  CartItem({
    required this.id,
    required this.productId,
    required this.name,
    required this.price,
    required this.quantity,
    required this.image,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      CartItem(
        id: json["id"],
        productId: json["product_id"],
        name: json["name"],
        price: json["price"],
        quantity: json["quantity"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "product_id": productId,
        "name": name,
        "price": price,
        "quantity": quantity,
        "image": image,
      };
}

// Helper function to parse the JSON string
CartResponseModel cartResponseFromJson(String str) =>
    CartResponseModel.fromJson(json.decode(str));

// Helper function to convert to JSON string
String cartResponseToJson(CartResponseModel data) => json.encode(data.toJson());