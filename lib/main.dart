import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transsave/pages/auth/on_boarding.dart';
import 'package:transsave/pages/auth/sign_in.dart';
import 'package:transsave/pages/auth/sign_up.dart';
import 'package:transsave/pages/main_screen/home.dart';
import 'package:transsave/pages/main_screen/main_page.dart';
import 'package:transsave/pages/main_screen/transaksi.dart';
import 'package:transsave/pages/transaction/buyer/transaksi_buyer.dart';
import 'package:transsave/pages/transaction/buyer/transaksi_konfirmasi_bayar.dart';
import 'package:transsave/pages/transaction/buyer/transaksi_konfirmasi_join.dart';
import 'package:transsave/pages/transaction/seller/buat_transaksi.dart';
import 'package:transsave/pages/transaction/seller/transaksi_seller.dart';
import 'package:transsave/pages/transaction/seller/transaksi_konfirmasi_kirim.dart';
import 'package:transsave/pages/main_screen/notification.dart';
import 'package:transsave/themes/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            fontFamily: GoogleFonts.poppins().fontFamily,
            primarySwatch: Colors.grey,
            scaffoldBackgroundColor: AppColor.backgroundColor2),
        initialRoute: MainPage.routeName,
        getPages: [
          GetPage(name: MainPage.routeName, page: () => const MainPage()),
          GetPage(name: SignIn.routeName, page: () => const SignIn()),
          GetPage(name: SignUp.routeName, page: () => const SignUp()),
          GetPage(name: OnBoarding.routeName, page: () => OnBoarding()),
          GetPage(
              name: TransaksiBuyer.routeName,
              page: () => const TransaksiBuyer()),
          GetPage(
              name: TransaksiKonfirmasiBayar.routeName,
              page: () => const TransaksiKonfirmasiBayar()),
          GetPage(
              name: TransaksiKonfirmasiJoin.routeName,
              page: () => const TransaksiKonfirmasiJoin()),
          GetPage(
              name: TransaksiSeller.routeName,
              page: () => const TransaksiSeller()),
          GetPage(
              name: BuatTransaksi.routeName, page: () => const BuatTransaksi()),
          GetPage(
              name: TransaksiKonfirmasiKirim.routeName,
              page: () => const TransaksiKonfirmasiKirim()),
        ],
      ),
    );
  }
}
