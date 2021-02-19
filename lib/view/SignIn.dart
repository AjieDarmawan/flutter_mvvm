import 'package:flutter/material.dart';
import 'package:flutter_app_mmvm/constant/constant.dart';
import 'package:flutter_app_mmvm/models/LoginModel.dart';
import 'package:flutter_app_mmvm/shared/theme.dart';
import 'package:flutter_app_mmvm/view/widget/GeneralPage.dart';
import 'package:flutter_app_mmvm/viewmodels/userviewmodel.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  //List<LoginModel> dataUser = new List();
  List<LoginModel> dataUser = new List();

  // void masuklogin() {
  //   UserViewModel()
  //       .login(
  //           emailController.text.toString(), passwordController.text.toString())
  //       .then((value) {
  //     setState(() {
  //       dataUser = value;
  //     });

  //     if (dataUser[0].status == 200) {
  //       print("success");
  //     } else {
  //       print("gagal");
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: "Login",
      subtitle: "Silahkan Login",
      child: Column(
        children: [
          Container(
            width: double.infinity,
            //margin: EdgeInsets.fromLTRB(defaultMargin, 24, defaultMargin, 24),
            margin: EdgeInsets.only(left: defaultMargin),
            child: Text(
              "Email Address",
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black),
            ),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: "Type Your Email Address"),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 24, top: 24),
            child: Text(
              "Password",
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 24),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black),
            ),
            child: TextField(
              controller: passwordController,
              decoration: InputDecoration(
                  // border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: "Type Your Password"),
            ),
          ),
          Container(
            width: double.infinity,
            height: 45,
            margin: EdgeInsets.only(top: 24),
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Text("Login"),
              color: mainColor,
              onPressed: () {
                UserViewModel()
                    .login(emailController.text.toString(),
                        passwordController.text.toString())
                    .then((value) {
                  LoginModel data = value;

                  if (data.status == 200) {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil(HOMEPAGE, (route) => false);
                  }
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
