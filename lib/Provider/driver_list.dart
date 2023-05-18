import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Constant/base_url.dart';
import '../Model/AddDriverModel.dart';
import '../Model/DriverModel.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DriverProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  bool addisloading = true;
  String error = '';
  String urlid = '';
  String token = '';

  DriverList driverLists = DriverList(driverList: [], status: null);
  AddDriver addDrivers = AddDriver(status: null, message: '');

  String? name;

  String? mobile;

  String? license;

  String? drivername;

  getDriverList() async {
    try {
      _isLoading = true;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      urlid = prefs.getString('url_id')!;
      token = prefs.getString('user_token')!;
      Response response = await http
          .get(Uri.parse(BaseUrl().baseUrl + "DriverApi/$urlid/"), headers: {
        'Authorization': 'Bearer $token',
      });

      if (response.statusCode == 200) {
        driverLists = driverListFromJson(response.body);
        _isLoading = false;
        notifyListeners();
      } else {
        error = response.statusCode.toString();
      }

      notifyListeners();
    } catch (e) {}
  }

  addDriver() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      urlid = prefs.getString('url_id')!;
      token = prefs.getString('user_token')!;
      final uri = Uri.parse(BaseUrl().baseUrl + 'DriverApi/$urlid/');
      print(uri);
      print(token);
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      Map<String, dynamic> body = {
        "name": drivername,
        "mobile": mobile,
        "license_no": license
      };
      String jsonBody = json.encode(body);
      print(jsonBody);
      Response response =
          await http.post(uri, headers: headers, body: jsonBody);
      print("ghgdfhs" + response.body);
      if (response.statusCode == 200) {
        addisloading = false;
        addDrivers = addDriverFromJson(response.body);
        if (addDrivers.status == true) {
          Fluttertoast.showToast(
            msg: addDrivers.message.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black87,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        } else {
          Fluttertoast.showToast(
            msg: addDrivers.message.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black87,
            textColor: Colors.white,
            fontSize: 16.0,
          );
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

  void driverName(String value) {
    drivername = value;
    notifyListeners();
  }

  void mobileN(String value) {
    mobile = value;
    notifyListeners();
  }

  void LicenceN(String value) {
    license = value;
    notifyListeners();
  }
}
