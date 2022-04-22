class User {
  final int phoneNumber;
  final String address;
  final String password;
  final String role;

  User({
    required this.phoneNumber,
    required this.address,
    required this.password,
    required this.role,
  });
}

List<User> allUser = [
  User(phoneNumber: 0987654321, address: 'Ha Noi', password: '12345678', role: 'Nông dân'),
  User(phoneNumber: 0912345678, address: 'Sai Gon', password: '12345678', role: 'Doanh nghiệp'),
];