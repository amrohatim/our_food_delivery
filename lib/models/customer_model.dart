// ignore_for_file: non_constant_identifier_names

class Customer {
  int id;
  String name;
  String phoneNumber;
  List<OutgoingProduct> outgoingProducts;

  Customer({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.outgoingProducts,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'],
      name: json['name'],
      phoneNumber: json['phone_number'],
      outgoingProducts: List<OutgoingProduct>.from(
          json['outgoing_products'].map((x) => OutgoingProduct.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone_number': phoneNumber,
      'outgoing_products': outgoingProducts,
    };
  }
}

class OutgoingProduct {
  int? product_id;
  int? quantity;
  String? product_name;
  int? price;
  int? total_price;
  String? date;
  String? resturant_name;

  OutgoingProduct({
    this.product_id,
    this.quantity,
    this.product_name,
    this.price,
    this.total_price,
    this.date,
    this.resturant_name,
  });

  factory OutgoingProduct.fromJson(Map<String, dynamic> json) {
    return OutgoingProduct(
      product_id: json['product_id'],
      quantity: json['quantity'],
      product_name: json['product_name'],
      price: json['price'],
      total_price: json['total_price'],
      date: json['date'],
      resturant_name: json['resturant_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product_id': product_id,
      'quantity': quantity,
      'product_name': product_name,
      'price': price,
      'total_price': total_price,
      'date': date,
      'resturant_name': resturant_name,
    };
  }
}
