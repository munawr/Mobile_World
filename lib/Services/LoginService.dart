import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/LoginModel.dart';

class LoginService {
  Future<Login?> getLogin(
      {required String username, required String password}) async {
    var headers = {'Content-Type': 'application/json'};
    var response = await http.post(
      Uri.parse('https://dummyjson.com/auth/login'),
      body: json.encode({"username": username, "password": password}),
      headers: headers,
    );
    if (response.statusCode == 200) {
      var json = response.body;
      return Login.fromJson(jsonDecode(json));
    } else {
      return null;
    }
  }
}
