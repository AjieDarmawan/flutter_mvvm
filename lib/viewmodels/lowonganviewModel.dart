import 'package:flutter_app_mmvm/models/lowonganModel.dart';
import 'package:http/http.dart' as http;

class LowonganViewModel {
  // Future<LowonganModel> getLowongan() async {
  //   final response =
  //       await http.get("https://testing.gawe.id/api_apps/apps/toplist");
  //   LowonganModel listdata = lowonganModelFromJson(response.body);
  //   //print("lowongan${listdata}");
  //   if (response.statusCode == 200) {
  //     print("get data succeessfully");
  //   } else {
  //     print("Get Data Failed");
  //   }
  //   return listdata;
  // }

  Future<List> getLowongan() async {
    try {
      http.Response hasil = await http.get(
        Uri.encodeFull("https://testing.gawe.id/api_apps/apps/toplist"),
        // headers: {"Accept": "application/json"}
      );
      if (hasil.statusCode == 200) {
        print("data category success");
        final data = lowonganModelFromJson(hasil.body);
        return data.lowongan;
      } else {
        print("error status " + hasil.statusCode.toString());
        return null;
      }
    } catch (e) {
      print("error catch $e");
      return null;
    }
  }
}
