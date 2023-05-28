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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Color(0xFFD3E3FD),
      ),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'KODE JOIN',
            style: subtitleStyle2.copyWith(color: Colors.black),
          ),
          SelectableText(
            toolbarOptions: ToolbarOptions(
                copy: true, selectAll: true, cut: false, paste: false),
            code,
            style: titleStyle.copyWith(color: Colors.black),
            textAlign: TextAlign.center,
          ),
          Text('Salin Kode', style: textButtonStyle)
        ],
      ),
    );
  }
}
