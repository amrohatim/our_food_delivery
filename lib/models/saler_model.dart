class Saler {
  String id;
  String restaurantName;
  String phoneNumber;
  String email;
  String password;
  String img;
  String description;

  Saler({
    required this.id,
    required this.restaurantName,
    required this.phoneNumber,
    required this.email,
    required this.password,
    required this.img,
    required this.description,
  });

  factory Saler.fromJson(Map<String, dynamic> json) {
    return Saler(
      id: json['_id'],
      restaurantName: json['restaurant_name'],
      phoneNumber: json['phone_number'],
      email: json['email'],
      password: json['password'],
      img: json['img'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'restaurant_name': restaurantName,
      'phone_number': phoneNumber,
      'email': email,
      'password': password,
      'img': img,
      'description': description,
    };
  }
}
