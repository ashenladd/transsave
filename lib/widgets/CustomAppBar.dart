import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:transsave/themes/fonts.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final Icon? leading;

  const CustomAppBar({
    super.key,
    this.title = "",
    this.leading = const Icon(Icons.arrow_back),
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: leading != null ? Icon(Icons.arrow_back) : Icon(null),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        title,
        style: titleStyle,
      ),
      iconTheme: IconThemeData(color: Colors.black),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
