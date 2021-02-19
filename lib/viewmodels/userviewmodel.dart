import 'dart:convert';

import 'package:flutter_app_mmvm/models/LoginModel.dart';
import 'package:flutter_app_mmvm/models/UserModel.dart';
import 'package:http/http.dart' as http;

class UserViewModel {
  Future<List<UserModel>> getUsers() async {
    try {
      http.Response hasil = await http.get(
          Uri.encodeFull("https://jsonplaceholder.typicode.com/users"),
          headers: {"Accept": "application/json"});
      if (hasil.statusCode == 200) {
        print("data category success");
        final data = userModelFromJson(hasil.body);
        return data;
      } else {
        print("error status " + hasil.statusCode.toString());
        return null;
      }
    } catch (e) {
      print("error catch $e");
      return null;
    }
  }

  // Future<List> login(body) async {
  //   try {
  //     http.Response hasil = await http
  //         .post(Uri.encodeFull("https://testing.gawe.id/api_apps/apps/login"),
  //             // email: email,
  //             body: body,
  //             headers: {
  //           "Accept": "application/json",
  //         });
  //     if (hasil.statusCode == 200) {
  //       print("status 200");
  //       // final data = json.decode(hasil.body);
  //       return true;
  //     } else {
  //       print("error status " + hasil.statusCode.toString());
  //       return null;
  //     }
  //   } catch (e) {
  //     print("error catchnya $e");
  //     return null;
  //   }
  // }

  // Future<LoginModel> login(String email, String password) async {
  //   final response =
  //       await http.post("https://testing.gawe.id/api_apps/apps/login", body: {
  //     'email': email,
  //     'password': password,
  //   });

  //   LoginModel listData = loginModelFromJson(response.body);
  //   if (listData.status == 200) {
  //     return listData;
  //   } else {
  //     print("gagal");
  //     return null;
  //   }
  // }

  Future login(String email, String password) async {
    final response =
        await http.post("https://testing.gawe.id/api_apps/apps/login", body: {
      'email': email,
      'password': password,
    });

    //print("cek login");
    //ModelLogin listData = modalLoginFromJson(response.body);
    final jsondata = jsonDecode(response.body);
    LoginModel listData = LoginModel.fromJson(jsondata);

    if (listData.status == 200) {
      print(listData);
      return listData;
    } else if (listData.status == 404) {
      print(listData.status);
      print("gagal2");
      // Toast.show("Email/Sandi Salah", null, duration: 5, gravity: Toast.BOTTOM);
      return listData;
    } else {
      print("gagal");
      return null;
    }
  }
}
