import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../Constant/base_url.dart';
import '../Model/DriverModel.dart';

class DriverProvider extends ChangeNotifier {
  bool isloading = true;
  String error = '';
  // ignore: non_constant_identifier_names
  DriverList DriverLists = DriverList(driverList: [], status: null);
  getDriverList() async {
    try {
      Response response = await http
          .get(Uri.parse(BaseUrl().baseUrl + "DriverApi/0HS2ZJJ/"), headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjg0MzMwNzY5LCJpYXQiOjE2ODQyNDQzNjksImp0aSI6IjVlYTQyNjFlZTJlMzQ0M2ViOWVhOWEzZTRiNTQzOThlIiwidXNlcl9pZCI6MiwiZmlyc3RfbmFtZSI6ImFkbWluX3VzZXIiLCJ1cmxfaWQiOiIwSFMyWkpKIn0.3s_EtpbloRExrTGtP15UoCvjCE07mqM6xwgcto_11_w',
      });
      print(response.body);
      if (response.statusCode == 200) {
        DriverLists = driverListFromJson(response.body);
      } else {
        error = response.statusCode.toString();
      }
    } catch (e) {}
    isloading = false;
    notifyListeners();
  }
}
