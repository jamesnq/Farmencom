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
