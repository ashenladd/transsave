import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:transsave/themes/fonts.dart';

class AppUploadContainer extends StatelessWidget {
  final Function()? onTap;

  const AppUploadContainer({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: DottedBorder(
        strokeWidth: 0.5,
        dashPattern: [7, 3, 7, 3],
        borderType: BorderType.RRect,
        radius: Radius.circular(6),
        child: Container(
          width: 325,
          height: 80,
          child: GridTileBar(
            leading: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Color(0xFFD3E3FD)),
                padding: EdgeInsets.all(14),
                child: Icon(Icons.image, size: 26)),
            title: Container(
              margin: EdgeInsets.only(left: 18),
              child: Text(
                "Upload Gambar Barang",
                style: mainStyle,
              ),
            ),
            subtitle: Container(
              margin: EdgeInsets.only(left: 18),
              child: Text(
                'Maksimal 5 foto',
                style: subtitleStyle2,
              ),
            ),
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
