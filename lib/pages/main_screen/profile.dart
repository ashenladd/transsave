import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:transsave/pages/auth/sign_in.dart';
import 'package:transsave/services/SecureStorageService.dart';
import 'package:transsave/widgets/auth/AppButton.dart';

import '../../widgets/CustomAppBar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        leading: null,
        title: "Profile",
      ),
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Profile Page'),
              AppButton(
                text: 'Logout',
                onTap: () async {
                  await SecureStorageService.deleteAllValue();
                  Get.offAllNamed(SignIn.routeName);
                },
              )
            ]),
      )),
    );
  }
}
