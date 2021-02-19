import 'package:flutter/material.dart';
import 'package:flutter_app_mmvm/view/SignIn.dart';
import 'package:flutter_app_mmvm/view/widget/GeneralPage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: "Register",
      subtitle: "Daftar akun",
      child: Text("tes"),
    );
  }
}
