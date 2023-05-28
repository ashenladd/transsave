import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:transsave/pages/auth/on_boarding.dart';
import 'package:transsave/pages/main_screen/main_page.dart';
import 'package:transsave/pages/splash_screen.dart';

import '../services/SecureStorageService.dart';

class RoutingPage extends StatefulWidget {
  static String routeName = '/routing';
  const RoutingPage({super.key});

  @override
  State<RoutingPage> createState() => _RoutingPageState();
}

class _RoutingPageState extends State<RoutingPage> {
  Future<void> getAccessToken() async {
    final access = await SecureStorageService.readValue('accessToken');
    if (access == null) {
      setState(() {
        accessToken = 'not login';
      });
    } else {
      setState(() {
        accessToken = access;
      });
    }
    print(access);
  }

  String? accessToken;

  @override
  void initState() {
    super.initState();
    getAccessToken();
  }

  @override
  Widget build(BuildContext context) {
    return accessToken != null
        ? accessToken == 'not login'
            ? OnBoarding()
            : MainPage()
        : SplashScreen();
  }
}
