import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../themes/color.dart';
import '../../themes/fonts.dart';

import '../../widgets/auth/AppButton.dart';
import '../../widgets/auth/AppTextField.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _noHandphoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool showPassword = false;
  bool showConfirmPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.all(21),
        color: backgroundColor,
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: backgroundColor2),
            child: Column(
              children: [
                SizedBox(
                  height: 55,
                ),
                Text(
                  'Registrasi',
                  style: titleStyle,
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'Mulailah pengalaman transaksi aman dengan mendaftar di Transafe',
                    style: subtitleStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                AppTextField(controller: _nameController, labelText: 'Nama'),
                SizedBox(
                  height: 30,
                ),
                AppTextField(
                    controller: _usernameController, labelText: 'Username'),
                SizedBox(
                  height: 30,
                ),
                AppTextField(
                    controller: _noHandphoneController,
                    labelText: 'No Handphone'),
                SizedBox(
                  height: 30,
                ),
                AppTextField(
                  controller: _passwordController,
                  labelText: 'Password',
                  obscureText: !showPassword,
                  suffixIcon: GestureDetector(
                      onTap: () => setState(() {
                            showPassword = !showPassword;
                          }),
                      child: Icon(Icons.remove_red_eye_outlined)),
                ),
                SizedBox(
                  height: 30,
                ),
                AppTextField(
                  controller: _confirmPasswordController,
                  labelText: 'Konfirmasi Password',
                  obscureText: !showConfirmPassword,
                  suffixIcon: GestureDetector(
                      onTap: () => setState(() {
                            showConfirmPassword = !showConfirmPassword;
                          }),
                      child: Icon(Icons.remove_red_eye_outlined)),
                ),
                SizedBox(
                  height: 24,
                ),
                AppButton(
                  text: "Daftar",
                ),
                SizedBox(
                  height: 15,
                ),
                RichText(
                    text: TextSpan(
                        text: 'Sudah punya akun?',
                        style: mainStyle.copyWith(color: Colors.black),
                        children: [
                      TextSpan(
                          text: ' Login',
                          style: mainStyle.copyWith(color: mainRed),
                          recognizer: TapGestureRecognizer()
                            ..onTap =
                                () => Navigator.pushNamed(context, '/sign-up'))
                    ])),
                SizedBox(
                  height: 80,
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
