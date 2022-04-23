import 'dart:convert';

import 'package:http/http.dart' as http;
import './api_models.dart';

const baseUrl = 'http://localhost:3000';

String? accessToken = null;

class ApiServices {
  Future<SignUpModel> signUp(String name, String phone, String password,
      String address, String role) async {
    final url = Uri.parse('$baseUrl/signup');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'name': name,
        'phone': phone,
        'password': password,
        'address': address,
        'type': role
      }),
    );
    final res = SignUpModel.fromJson(json.decode(response.body));
    if (res.error != null) {
      throw Exception(res.error);
    }
    return res;
  }

  Future<LoginModel> login(String phone, String password) async {
    final url = Uri.parse('$baseUrl/login');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
        {
          'phone': phone,
          'password': password,
        },
      ),
    );
    final res = LoginModel.fromJson(json.decode(response.body));
    if (res.error != null) {
      throw Exception(res.error);
    }
    if (res.accessToken != null) {
      accessToken = res.accessToken;
    }
    return res;
  }

  void logout() {
    accessToken = null;
  }

  Future<http.Response> get(String url) async {
    final token = accessToken;
    if (token == null) {
      throw Exception('You are not logged in');
    }
    final uri = Uri.parse(url);
    return http.get(uri, headers: {'Authorization': token});
  }

  Future<http.Response> post(String url, Map<String, dynamic> body) async {
    final token = accessToken;
    if (token == null) {
      throw Exception('You are not logged in');
    }
    final uri = Uri.parse(url);
    return http.post(uri, headers: {'Authorization': token}, body: body);
  }

  Future<http.Response> delete(String url) async {
    final token = accessToken;
    if (token == null) {
      throw Exception('You are not logged in');
    }
    final uri = Uri.parse(url);
    return http.delete(uri, headers: {'Authorization': token});
  }

  Future<http.Response> patch(String url, Map<String, dynamic> body) async {
    final token = accessToken;
    if (token == null) {
      throw Exception('You are not logged in');
    }
    final uri = Uri.parse(url);
    return http.patch(uri, headers: {'Authorization': token}, body: body);
  }

  Future<List<ItemModel>> getSellsItems() async {
    final response = await get('$baseUrl/item/sells');
    if (response.statusCode == 200) {
      final items = json.decode(response.body) as List<dynamic>;
      return items.map((item) => ItemModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load items');
    }
  }

  Future<List<ItemModel>> getRequestsItems() async {
    final response = await get('$baseUrl/item/requests');
    if (response.statusCode == 200) {
      final items = json.decode(response.body) as List<dynamic>;
      return items.map((item) => ItemModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load items');
    }
  }

  Future<List<ItemModel>> searchItems(String query) async {
    final response = await get('$baseUrl/item/search?query=$query');
    if (response.statusCode == 200) {
      final items = json.decode(response.body) as List<dynamic>;
      return items.map((item) => ItemModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load items');
    }
  }

  Future<ItemModel> getItem(String id) async {
    final response = await get('$baseUrl/item/$id');
    final res = ItemModel.fromJson(json.decode(response.body));
    if (res.error != null) {
      throw Exception(res.error);
    }
    return res;
  }

  Future<ItemModel> createItem(
      String name, num price, num quantity, String unit, String type) async {
    final response = await post('$baseUrl/item/create', {
      'name': name,
      'price': price,
      'quantity': quantity,
      'unit': unit,
      'type': type
    });
    final res = ItemModel.fromJson(json.decode(response.body));
    if (res.error != null) {
      throw Exception(res.error);
    }
    return res;
  }

  Future<ItemModel> deleteItem(String id) async {
    final response = await delete('$baseUrl/item/$id');
    final res = ItemModel.fromJson(json.decode(response.body));
    if (res.error != null) {
      throw Exception(res.error);
    }
    return res;
  }

  // Nhận yêu cầu đặt hàng của doanh nghiệp, status chuyển thành pending
  Future<ItemRequestModel> requestItem(String id) async {
    final response = await post('$baseUrl/item/$id/request', {});
    final res = ItemRequestModel.fromJson(json.decode(response.body));
    if (res.error != null) {
      throw Exception(res.error);
    }
    return res;
  }

  // status chuyển thành accepted
  Future<void> acceptRequest(String requestId) async {
    final response = await post('$baseUrl/item/request/$requestId/accept', {});
    final res = ItemRequestModel.fromJson(json.decode(response.body));
    if (res.error != null) {
      throw Exception(res.error);
    }
  }

  // status chuyển thành rejected
  Future<void> rejectRequest(String requestId) async {
    final response = await post('$baseUrl/item/request/$requestId/reject', {});
    final res = ItemRequestModel.fromJson(json.decode(response.body));
    if (res.error != null) {
      throw Exception(res.error);
    }
  }

  Future<void> buyItem(String id) async {
    final response = await post('$baseUrl/item/$id/buy', {});
    final res = ItemModel.fromJson(json.decode(response.body));
    if (res.error != null) {
      throw Exception(res.error);
    }
  }

  Future<UserModel> getUser() async {
    final response = await get('$baseUrl/user');
    final res = UserModel.fromJson(json.decode(response.body));
    if (res.error != null) {
      throw Exception(res.error);
    }
    return res;
  }

  Future<UserModel> updateUser(Map<String, dynamic> body) async {
    final response = await patch('$baseUrl/user', body);
    final res = UserModel.fromJson(json.decode(response.body));
    if (res.error != null) {
      throw Exception(res.error);
    }
    return res;
  }

  Future<List<CartItemModel>> getCartItems() async {
    final response = await get('$baseUrl/user/cart');
    if (response.statusCode == 200) {
      final res = json.decode(response.body) as List<dynamic>;
      return res.map((item) => CartItemModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load items');
    }
  }

  Future<List<CartItemModel>> postCartItems(List<CartItemModel> items) async {
    final response = await post('$baseUrl/user/cart',
        {'items': items.map((item) => item.toJson()).toList()});
    if (response.statusCode == 200) {
      final res = json.decode(response.body) as List<dynamic>;
      return res.map((item) => CartItemModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load items');
    }
  }

  // Tab Barn / Kho
  // Sản phẩm đã mua của doanh nghiệp - Tab 2 của doanh nghiệp
  // Future<List<

  // Sản phẩm đã yêu cầu của nông dân (pending, accepted, rejected) - Tab 2 của nông dân
  Future<List<ItemModel>> getRequestedItems() async {
    final response = await get('$baseUrl/user/requested');
    if (response.statusCode == 200) {
      final res = json.decode(response.body) as List<dynamic>;
      return res.map((item) => ItemModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load items');
    }
  }

  // Sản phẩm đã chấp nhận yêu cầu (tab 3 của cả 2 role)
  Future<List<ItemModel>> getAcceptedItems() async {
    final response = await get('$baseUrl/user/accepted');
    if (response.statusCode == 200) {
      final res = json.decode(response.body) as List<dynamic>;
      return res.map((item) => ItemModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load items');
    }
  }

  // Tab 2 của doanh nghiệp
  Future<List<ItemRequestModel>> getPendingRequests() async {
    final response = await get('$baseUrl/user/pending');
    if (response.statusCode == 200) {
      final res = json.decode(response.body) as List<dynamic>;
      return res.map((item) => ItemRequestModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load items');
    }
  }

  // Tab 1 của 2 roles
  Future<List<ItemModel>> getListingItems() async {
    final response = await get('$baseUrl/user/listing');
    if (response.statusCode == 200) {
      final res = json.decode(response.body) as List<dynamic>;
      return res.map((item) => ItemModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load items');
    }
  }

  Future<void> submitCart() async {
    final response = await post('$baseUrl/user/cart/submit', {});
    if (response.statusCode != 200) {
      throw Exception('Failed to buy items');
    }
  }
}
