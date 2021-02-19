import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_mmvm/models/lowonganModel.dart';

class CardLowongan extends StatelessWidget {
  final Lowongan lowongan;

  CardLowongan({this.lowongan});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.only(top: 16),
        width: 60,
        height: 60,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(lowongan.namaPerusahaan),
                Text(lowongan.jenisPekerjaan),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
