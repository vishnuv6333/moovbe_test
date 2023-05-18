import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:mooovbe/Constant/base_url.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../Model/AuthModel.dart';

class AuthProvider extends ChangeNotifier {
  bool isloading = true;
  String name = '';
  String password = '';
  String Token = '';

  Authentication UserCredentials = Authentication(
      access: '', name: '', status: null, message: '', refresh: '', urlId: '');

  bool isLoggedIn = false;
  Future<void> init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString('user_token'));
    isLoggedIn = prefs.getString('user_token') != '' ? true : false;
    notifyListeners();
  }

  userlogin([BuildContext? context]) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      final uri = Uri.parse(BaseUrl().baseUrl + 'LoginApi');
      final headers = {'Content-Type': 'application/json'};
      Map<String, dynamic> body = {"username": name, "password": password};
      String jsonBody = json.encode(body);

      Response response =
          await http.post(uri, headers: headers, body: jsonBody);
      print(response);
      if (response.statusCode == 200) {
        UserCredentials = authenticationFromJson(response.body);
        if (UserCredentials.status == true) {
          Token = UserCredentials.access.toString();
          prefs.setString("url_id", UserCredentials.urlId.toString());
          prefs.setString("user_token", UserCredentials.access.toString());
          isLoggedIn = true;
        } else {
          final snackBar = SnackBar(
            content: Text(UserCredentials.message),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );
          ScaffoldMessenger.of(context!).showSnackBar(snackBar);
        }
      } else {
        print("object");
      }
      notifyListeners();
    } catch (e) {
      print(e);
    }
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
