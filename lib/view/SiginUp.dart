import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_mmvm/constant/constant.dart';
import 'package:flutter_app_mmvm/models/LoginModel.dart';
import 'package:flutter_app_mmvm/models/ModelRegister.dart';
import 'package:flutter_app_mmvm/models/SumberModel.dart';
import 'package:flutter_app_mmvm/shared/theme.dart';
import 'package:flutter_app_mmvm/view/widget/GeneralPage.dart';
import 'package:flutter_app_mmvm/viewmodels/userviewmodel.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isHidePassword = true;

  String valsumber;
  var InSignIn = false;

  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  TextEditingController etEmail = TextEditingController();
  TextEditingController etName = TextEditingController();
  TextEditingController etPassword = TextEditingController();
  TextEditingController etReferal = TextEditingController();
  TextEditingController etNo_hp = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String name, referal, hp, email, password1, confrim_password;
  var globalName = "", globalEmail = "", globalLevel = "";
  var status = false;
//  var value;
  var mystatus;
  bool monVal = false;

  void checkEmailAndPassowrd() {
    if (_formKey.currentState.validate()) {
      //JIKA TRUE
      _formKey.currentState.save(); //MAKA FUNGSI SAVE() DIJALANKAN

//       if(valsumber==null){
//         Toast.show("Email/Password Tidak Boleh Kosong", context,
//          duration: 3, gravity: Toast.BOTTOM);
//       }else{
//         print(valsumber);
//       }

      if (etEmail.text.isEmpty ||
          etPassword.text.isEmpty ||
          etName.text.isEmpty ||
          etNo_hp.text.isEmpty ||
          valsumber == null) {
        // Toast.show("Tidak Boleh Kosong", context,
        //     duration: 3, gravity: Toast.BOTTOM);
      } else {
        // Toast.show("Login", context, duration: 3, gravity: Toast.BOTTOM);
        //login();

        //print("data{$data}");
        //Dialogs.showLoadingDialog(context, _formKey); //invoking login

        if (monVal == false) {
          // Toast.show("Anda Belum Ceklis Pernyataan Gawe.id", context,
          //     duration: 3, gravity: Toast.TOP);
//          setState(() {
//            monVal = true;
//          });
        } else {
          setState(() {
            InSignIn = true;
          });
          register();
        }
      }
    }
    ;
  }

  //List dataSumber = [];
  List<SumberModel> dataSumber = new List();
  void sumber() async {
    UserViewModel().sumber().then((value) {
      setState(() {
        dataSumber = value;
      });
    });

    //  dataProvince = await network.getProvince();
    // final response = await http
    //     .get("https://testing.gawe.id/api_apps/master_api/get_sumber");
    // var listdata = jsonDecode(response.body);
    // setState(() {
    //   dataSumber = listdata;
    // });

    print("data : $dataSumber");
  }

  void register() async {
    print("nama${etName.text.toString()}");
    print("email${etName.text.toString()}");
    print("password${etName.text.toString()}");
    print("no_hp${etNo_hp.text.toString()}");
    print("sumber${valsumber}");

    UserViewModel()
        .register(
            etName.text.toString(),
            etEmail.text.toString(),
            etPassword.text.toString(),
            etNo_hp.text.toString(),
            valsumber.toString())
        .then((value) {
      ModelRegister data = value;

      if (data.status == 200) {
        // Navigator.of(context)
        //     .pushNamedAndRemoveUntil(DATADIRI1, (route) => false);
        print("Berhasil");
      } else {
        print("GAGAL");
      }
    });

//     ModelRegister data = await network.register(
//       etName.text.toString(),
//       etEmail.text.toString(),
//       etPassword.text.toString(),
//       etNo_hp.text.toString(),
//       valsumber,
//     );

//     Toast.show("${data.status}", context, duration: 3, gravity: Toast.BOTTOM);

//     if (data.status == 200) {
//       setState(() {
//         status_register = true;
//         _loginStatus = LoginStatus.Login;
//         globalLevel = "1";
//         sessionManager.session_register(status_register, email, hp, name);
//       });

// //      Navigator.of(context).push(new MaterialPageRoute(
// //        builder: (BuildContext context) => datadiri1(),
// //      ));

//       Navigator.of(context)
//           .pushNamedAndRemoveUntil(DATADIRI1, (route) => false);

//       Toast.show("Success", context, duration: 3, gravity: Toast.BOTTOM);
//     } else if (data.status == 400) {
//       //Navigator.of(_formKey.currentContext, rootNavigator: true).pop();

//       setState(() {
//         InSignIn = false;
//       });

//       Toast.show("Email Sudah Terdaftar", context,
//           duration: 3, gravity: Toast.TOP);
//     } else if (data.status == 404) {
//       // Navigator.of(_formKey.currentContext, rootNavigator: true).pop();
//       setState(() {
//         InSignIn = false;
//       });
//       Toast.show("Akun Anda Belum Aktif", context,
//           duration: 3, gravity: Toast.TOP);
//     } else {
//       print("gagal");
//       setState(() {
//         InSignIn = false;
//       });
//       Toast.show("Gagal", context, duration: 3, gravity: Toast.TOP);
//     }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sumber();

    //signOut();
  }

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(dataSumber);
    return GeneralPage(
      title: "Register",
      subtitle: "Daftar Akun",
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            SizedBox(height: 16),
            TextFormField(
              style: TextStyle(fontSize: 16.0, color: Colors.black),
              keyboardType: TextInputType.text,
              controller: etName,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(25.7),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(25.7),
                ),
                filled: true,
                fillColor: Colors.grey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.7),
                ),
                // labelText: "Nama Lengkap",
                hintText: "Nama Lengkap",
              ),
              validator: nameValidator,
              // validator: (value) => value.length < 6 ? 'Password too short.' : null,
              onSaved: (value) {
                name = value;
              },
            ),
            SizedBox(height: 12),
            Text("Nama Sesuai KTP",
                style: TextStyle(color: Colors.black, fontSize: 14)),
            SizedBox(height: 16),
            TextFormField(
              style: TextStyle(fontSize: 16.0, color: Colors.black),
              keyboardType: TextInputType.emailAddress,
              controller: etEmail,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(25.7),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(25.7),
                ),
                filled: true,
                fillColor: Colors.grey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.7),
                ),
                //labelText: "Email",
                hintText: "Email",
              ),
              validator: emailValidator,
              // validator: (value) => value.length < 6 ? 'Password too short.' : null,
              onSaved: (value) {
                email = value;
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              style: TextStyle(fontSize: 16.0, color: Colors.black),
              keyboardType: TextInputType.number,
              controller: etNo_hp,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(25.7),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(25.7),
                ),
                filled: true,
                fillColor: Colors.grey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.7),
                ),
                //labelText: "No Hp",
                hintText: "No Hp",
              ),
              validator: nameValidator,
              // validator: (value) => value.length < 6 ? 'Password too short.' : null,
              onSaved: (value) {
                hp = value;
              },
            ),
            SizedBox(height: 16),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 11,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.7),
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton(
                    dropdownColor: Colors.grey,
                    style: TextStyle(fontSize: 16.0, color: Colors.black),
                    value: valsumber,
                    //value: valPendidikan == null ? valPendidikan : buildingTypes.where( (i) => i.name == valPendidikan.name).first as BuildingType,
                    hint: Text("Pilih Sumber"),
                    items: dataSumber.map((item) {
                      return DropdownMenuItem(
                        child: Text(item.title),
                        value: item.title,
                      );
                    }).toList(),
                    onChanged: (value) async {
                      // dataCity = await network.getCity(value);
                      setState(() {
                        valsumber = value;
                        // valCity = null;
                      });
                      //print(dataCity);
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              style: TextStyle(fontSize: 16.0, color: Colors.black),
              obscureText: _isHidePassword,
              autofocus: false,
              keyboardType: TextInputType.text,
              //  keyboardType: TextInputType.visiblePassword,
              controller: etPassword,
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: () {
                    _togglePasswordVisibility();
                  },
                  child: Icon(
                    _isHidePassword ? Icons.visibility_off : Icons.visibility,
                    color: _isHidePassword ? Colors.red : Colors.blue,
                  ),
                ),
                isDense: true,
                contentPadding:
                    const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(25.7),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(25.7),
                ),
                filled: true,
                fillColor: Colors.grey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.7),
                ),
                //labelText: "Password",
                hintText: "Password ..",
              ),
              validator: nameValidator,
              onSaved: (value) {
                password1 = value;
              },
            ),
            SizedBox(height: 12),
            Row(children: [
              Checkbox(
                value: monVal,
                onChanged: (bool value) {
                  setState(() {
                    monVal = value;
                  });
                },
              ),
              Text(
                  "Saya Setuju terhadap aturan Penggunaan \n dan kebijakan privasi Gawe.id",
                  style: TextStyle(color: Colors.black, fontSize: 14))
            ]),
            SizedBox(height: 16),
            Container(
              width: double.infinity,
              height: 45,
              margin: EdgeInsets.only(top: 24),
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Text("Register"),
                color: mainColor,
                onPressed: () {
                  register();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
