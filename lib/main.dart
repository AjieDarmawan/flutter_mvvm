import 'package:flutter/material.dart';
import 'package:flutter_app_mmvm/constant/constant.dart';
import 'package:flutter_app_mmvm/view/HalamanUtama.dart';
import 'package:flutter_app_mmvm/view/SignIn.dart';

void main() {
  runApp(new MaterialApp(
    title: "My App",
    home: new MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'MY App',
      home: SignIn(),
      routes: <String, WidgetBuilder>{
        HOMEPAGE: (BuildContext context) => HalamanUtama(),
      },
    );
  }
}
