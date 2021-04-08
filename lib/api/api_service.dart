import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/login_model.dart';

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    String email = requestModel.email;
    String url = "http://localhost:8080/email/$email";
    Uri uri = Uri.parse(url);

    final response = await http.get(uri,);
    print(response.body.toString());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
}