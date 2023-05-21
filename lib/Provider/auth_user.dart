import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mooovbe/Constant/base_url.dart';
import 'package:http/http.dart' as http;
import '../Model/auth_model.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  String name = '';
  String password = '';
  String token = '';

  Authentication userCredentials = Authentication(
      access: '', name: '', status: null, message: '', refresh: '', urlId: '');

  bool isLoggedIn = false;

  userlogin([BuildContext? context]) async {
    _isLoading = true;
    notifyListeners();
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      final uri = Uri.parse(BaseUrl().baseUrl + 'LoginApi');
      final headers = {'Content-Type': 'application/json'};
      Map<String, dynamic> body = {"username": name, "password": password};
      String jsonBody = json.encode(body);

      Response response =
          await http.post(uri, headers: headers, body: jsonBody);
      if (response.statusCode == 200) {
        userCredentials = authenticationFromJson(response.body);
        if (userCredentials.status == true) {
          token = userCredentials.access.toString();
          prefs.setString("url_id", userCredentials.urlId.toString());
          prefs.setString("user_token", userCredentials.access.toString());
          _isLoading = false;
          isLoggedIn = true;
          notifyListeners();
        } else {
          _isLoading = false;
          messanger(context, userCredentials.message);
        }
      } else {
        final msg = json.decode(response.body);
        messanger(context, msg['message']);
      }
      notifyListeners();
      // ignore: empty_catches
    } catch (e) {}
  }

  messanger(BuildContext? context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {},
      ),
    );
    ScaffoldMessenger.of(context!).showSnackBar(snackBar);
  }

  void setName(String value) {
    name = value;
    notifyListeners();
  }

  void setPassword(String value) {
    password = value;
    notifyListeners();
  }
}
