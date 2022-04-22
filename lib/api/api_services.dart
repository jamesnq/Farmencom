import 'dart:convert';

import 'package:http/http.dart' as http;
import './api_models.dart';
import './api_constants.dart';

class ApiServices {
  Future<SignUpModel> postSignUp(String name, String phone, String password,
      String address, String role) async {
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.signupEndpoint);
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
        SignUpModel(
                name: name,
                phone: phone,
                password: password,
                address: address,
                type: role)
            .toJson(),
      ),
    );
    return SignUpModel.fromJson(json.decode(response.body));
  }
}
