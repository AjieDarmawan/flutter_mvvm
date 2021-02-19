import 'package:flutter/material.dart';
import 'package:flutter_app_mmvm/models/UserModel.dart';
import 'package:flutter_app_mmvm/view/widget/CardLowongan.dart';
import 'package:flutter_app_mmvm/viewmodels/userviewmodel.dart';
// import 'package:flutter_app_mmvm/models/UserModel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app_mmvm/models/lowonganModel.dart';
import 'package:flutter_app_mmvm/viewmodels/lowonganviewModel.dart';
// import 'package:flutter_app_mmvm/viewmodels/userviewmodel.dart';

class HalamanUtama extends StatefulWidget {
  @override
  _HalamanUtamaState createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  // List<UserModel> dataUser = new List();
  // void getDataUser() {
  //   UserViewModel().getUsers().then((value) {
  //     setState(() {
  //       dataUser = value;
  //     });
  //   });
  // }

  var dataLowongan = new List();
  void getLowongan() {
    LowonganViewModel().getLowongan().then((value) {
      setState(() {
        dataLowongan = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getLowongan();
  }

  var a = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Utama"),
      ),
      body: dataLowongan == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: dataLowongan.length,
              itemBuilder: (context, i) {
                final Lowongan xlowongan = dataLowongan[i];
                return CardLowongan(
                  lowongan: xlowongan,
                );
              },
            ),
    );
  }
}
