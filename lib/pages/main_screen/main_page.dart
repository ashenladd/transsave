import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:transsave/pages/main_screen/home.dart';
import 'package:transsave/pages/main_screen/notification.dart';
import 'package:transsave/pages/main_screen/profile.dart';
import 'package:transsave/pages/main_screen/transaksi.dart';
import 'package:transsave/themes/color.dart';

class MainPage extends StatefulWidget {
  static String routeName = '/main_page';
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedPage = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/bottom_app_bar/home.svg',
                color: _selectedPage == 0 ? AppColor.mainRed : Colors.grey,
              ),
              label: "Beranda",
            ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/bottom_app_bar/Document.svg',
                    color: _selectedPage == 1 ? AppColor.mainRed : Colors.grey),
                label: "Transaksi"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/bottom_app_bar/Notification.svg',
                    color: _selectedPage == 2 ? AppColor.mainRed : Colors.grey),
                label: "Notifikasi"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/bottom_app_bar/Profile.svg',
                    color: _selectedPage == 3 ? AppColor.mainRed : Colors.grey),
                label: "Profile"),
          ],
          selectedFontSize: 8,
          unselectedFontSize: 8,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.grey,
          selectedItemColor: AppColor.mainRed,
          currentIndex: _selectedPage,
          onTap: (int index) {
            setState(() {
              _selectedPage = index;
            });
            pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOutExpo,
            );
          }),
      body: PageView(controller: pageController, children: <Widget>[
        Home(),
        Transaksi(),
        NotificationPage(),
        ProfilePage()
      ]),
    );
  }
}
