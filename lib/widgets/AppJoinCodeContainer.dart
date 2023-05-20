import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transsave/themes/fonts.dart';

class AppJoinCodeContainer extends StatelessWidget {
  final String code;

  const AppJoinCodeContainer({super.key, required this.code});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 86,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Color(0xFFD3E3FD),
      ),
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'KODE JOIN',
            style: subtitleStyle2.copyWith(color: Colors.black),
          ),
          Text(
            code,
            style: titleStyle.copyWith(color: Colors.black),
          ),
          Text('Salin Kode', style: textButtonStyle)
        ],
      ),
    );
  }
}
