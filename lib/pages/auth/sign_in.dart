import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:transsave/pages/auth/sign_up.dart';
import 'package:transsave/themes/color.dart';
import 'package:transsave/themes/fonts.dart';

import '../../widgets/auth/AppButton.dart';
import '../../widgets/auth/AppTextField.dart';

class SignIn extends StatefulWidget {
  static String routeName = '/sign_in';
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.all(21),
            color: AppColor.backgroundColor,
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: AppColor.backgroundColor2),
                child: Column(
                  children: [
                    SizedBox(
                      height: 55,
                    ),
                    Text(
                      'Login',
                      style: titleStyle,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        'Masuk ke akun Transafe Anda sekarang dan lakukan transaksi dengan aman',
                        style: subtitleStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(child: Image.asset('assets/sign_in/signIn.png')),
                    SizedBox(
                      height: 40,
                    ),
                    AppTextField(
                      controller: _usernameController,
                      labelText: 'Username',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AppTextField(
                      controller: _passwordController,
                      labelText: 'Password',
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        'Lupa Password?',
                        style: subtitleStyle.copyWith(color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    AppButton(
                      text: "Login",
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    RichText(
                        text: TextSpan(
                            text: 'Belum punya akun?',
                            style: mainStyle.copyWith(color: Colors.black),
                            children: [
                          TextSpan(
                              text: ' Daftar',
                              style:
                                  mainStyle.copyWith(color: AppColor.mainRed),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.pushNamed(
                                    context, SignUp.routeName))
                        ])),
                    SizedBox(
                      height: 80,
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
