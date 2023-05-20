import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transsave/themes/fonts.dart';

class AppKeteranganContainerSeller extends StatelessWidget {
  const AppKeteranganContainerSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 86,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Color(0xFFD3E3FD),
      ),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Catatan Pembeli:',
            style: subtitleStyle2.copyWith(color: Colors.black),
          ),
          Text(
            '-',
            style: subtitleStyle.copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
