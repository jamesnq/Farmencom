class SignUpModel {
  String? name;
  String? phone;
  String? password;
  String? address;
  String? type;
  String? error;

  SignUpModel(
      {this.name,
      this.phone,
      this.password,
      this.address,
      this.type,
      this.error});

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      name: json['name'],
      phone: json['phone'],
      password: json['password'],
      address: json['address'],
      type: json['type'],
      error: json['error'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'password': password,
      'address': address,
      'type': type,
      'error': error,
    };
  }
}

class LoginModel {
  String? uid;
  String? phone;
  String? name;
  String? accessToken;
  String? expirationTime;
  String? error;

  LoginModel(
      {this.uid,
      this.phone,
      this.name,
      this.accessToken,
      this.expirationTime,
      this.error});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      uid: json['uid'],
      phone: json['phone'],
      name: json['name'],
      accessToken: json['accessToken'],
      expirationTime: json['expirationTime'],
      error: json['error'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'phone': phone,
      'name': name,
      'accessToken': accessToken,
      'expirationTime': expirationTime,
      'error': error,
    };
  }
}

class ItemModel {
  String? id;
  String? name;
  num? price;
  String? owner;
  num? quantity;
  String? unit;
  String? description;
  String? type;
  String? error;

  ItemModel(
      {this.id,
      this.name,
      this.price,
      this.owner,
      this.quantity,
      this.unit,
      this.description,
      this.type,
      this.error});

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      owner: json['owner'],
      quantity: json['quantity'],
      unit: json['unit'],
      description: json['description'],
      type: json['type'],
      error: json['error'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'owner': owner,
      'quantity': quantity,
      'unit': unit,
      'description': description,
      'type': type,
      'error': error,
    };
  }
}

class ItemRequestModel {
  String? id;
  String? user; // User request
  String? owner; // Item owner
  String? status;
  String? error;

  ItemRequestModel({this.id, this.user, this.status, this.error});

  factory ItemRequestModel.fromJson(Map<String, dynamic> json) {
    return ItemRequestModel(
      id: json['id'],
      user: json['user'],
      status: json['status'],
      error: json['error'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user,
      'status': status,
      'error': error,
    };
  }
}

class CartItem {
  String id;
  num quantity;

  CartItem({required this.id, required this.quantity});

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'quantity': quantity,
    };
  }
}

class UserModel {
  String? id;
  String? name;
  String? phone;
  String? address;
  num? balance;
  String? type;
  List<CartItem>? cart;
  String? error;

  UserModel(
      {this.id,
      this.name,
      this.phone,
      this.address,
      this.balance,
      this.type,
      this.cart,
      this.error});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      address: json['address'],
      balance: json['balance'],
      type: json['type'],
      cart: json['cart'],
      error: json['error'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'address': address,
      'balance': balance,
      'type': type,
      'cart': cart,
      'error': error,
    };
  }
}

class CartItemModel {
  String id;
  String name;
  num price;
  String owner;
  num quantity;
  String unit;
  String description;
  String type;
  String error;

  CartItemModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.owner,
      required this.quantity,
      required this.unit,
      required this.description,
      required this.type,
      required this.error});

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      owner: json['owner'],
      quantity: json['quantity'],
      unit: json['unit'],
      description: json['description'],
      type: json['type'],
      error: json['error'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'owner': owner,
      'quantity': quantity,
      'unit': unit,
      'description': description,
      'type': type,
      'error': error,
    };
  }
}
