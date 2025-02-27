import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sau_mukratha_app/views/about_ui.dart';
import 'package:sau_mukratha_app/views/cal_bill_ui.dart';
import 'package:sau_mukratha_app/views/menu_ui.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  //ตัวควบคุม AnimatedNotchBottomBar
  final NotchBottomBarController _pageController =
      NotchBottomBarController(index: 1);

  //สร้างตัวแปรเก็บหน้าจอที่จะแสดงที่ body ซึงล้อกับ AnimatedNotchBottomBar

  List<Widget> viewInBody = [
    CalBillUI(),
    MenuUI(),
    AboutUI(),
  ];

  //สร้างตัวแปรเก็บ Index ของหน้าที่จะแสดงที่ Body
  int indexShow = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          'Tech SAU BUFFET',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: AnimatedNotchBottomBar(
        onTap: (valueParam) {
          setState(() {
            indexShow = valueParam;
          });
        },
        kIconSize: 24.0,
        kBottomRadius: 20.0,
        notchColor: Colors.deepOrange,
        color: Colors.deepOrange,
        itemLabelStyle: TextStyle(
          color: Colors.white,
        ),
        notchBottomBarController: _pageController,
        bottomBarItems: [
          BottomBarItem(
            inActiveItem: Icon(
              FontAwesomeIcons.moneyBill1Wave,
              color: const Color.fromARGB(255, 223, 226, 228),
            ),
            activeItem: Icon(
              FontAwesomeIcons.moneyBill1Wave,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            itemLabel: 'คิดเงิน',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              Icons.home,
              color: const Color.fromARGB(255, 223, 226, 228),
            ),
            activeItem: Icon(
              Icons.home,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            itemLabel: 'MENU',
          ),

          ///svg item
          BottomBarItem(
            inActiveItem: Icon(
              Icons.star,
              color: const Color.fromARGB(255, 223, 226, 228),
            ),
            activeItem: Icon(
              Icons.star,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            itemLabel: 'เกี่ยวกับ',
          ),
        ],
      ),
      body: viewInBody[indexShow],
    );
  }
}
