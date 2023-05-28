import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:transsave/widgets/auth/AppButton.dart';

class AppChatPenjual extends StatelessWidget {
  const AppChatPenjual({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppButton(
        text: 'CHAT PEMBELI',
        width: 275,
      ),
    );
  }
}
