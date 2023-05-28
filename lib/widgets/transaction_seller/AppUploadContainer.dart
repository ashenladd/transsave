import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:transsave/controller/ImageController.dart';
import 'package:transsave/model/TransactionModel.dart';
import 'package:transsave/themes/fonts.dart';
import 'package:image_picker/image_picker.dart';

class AppUploadContainer extends StatefulWidget {
  AppUploadContainer({super.key});

  @override
  State<AppUploadContainer> createState() => _AppUploadContainerState();
}

class _AppUploadContainerState extends State<AppUploadContainer> {
  final ImageController imageController = Get.put(ImageController());

  File? _image;

  Future<void> _pickImage(context) async {
    ImageSource source = await showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: 160,
        child: Column(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text("Select from gallery"),
              onTap: () async {
                Navigator.pop(context, ImageSource.gallery);
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text("Take a photo"),
              onTap: () {
                Navigator.pop(context, ImageSource.camera);
              },
            ),
          ],
        ),
      ),
    );

    XFile? image = await ImagePicker().pickImage(source: source);
    setState(() {
      _image = File(image!.path);
      print(_image);
      imageController.updateImage(_image!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: DottedBorder(
        strokeWidth: 0.5,
        dashPattern: [7, 3, 7, 3],
        borderType: BorderType.RRect,
        radius: Radius.circular(6),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 16),
          width: 325,
          child: GridTileBar(
            leading: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Color(0xFFD3E3FD)),
                padding:
                    _image == null ? EdgeInsets.all(14) : EdgeInsets.all(0),
                child: _image == null
                    ? Icon(Icons.image, size: 26)
                    : Image.file(_image!)),
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
      onTap: () async {
        await _pickImage(context);
      },
    );
  }
}
