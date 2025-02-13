// ignore_for_file: sized_box_for_whitespace, unused_element

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuUI extends StatefulWidget {
  const MenuUI({super.key});

  @override
  State<MenuUI> createState() => _MenuUIState();
}

class _MenuUIState extends State<MenuUI> {
  //สร้างตัวแปรเก็บรูปเมนูที่ ListView
  List<String> menuShow = [
    'assets/images/img1.png',
    'assets/images/img2.png',
    'assets/images/img3.png',
    'assets/images/img4.png',
    'assets/images/img5.png',
    'assets/images/img6.png',
    'assets/images/img7.png',
  ];

  //สร้างตัวแปรเก็บรูปร้านสาขาที่จะแสดงที่ ListView
  List<String> branchShop = [
    'assets/images/shop1.png',
    'assets/images/shop2.png',
    'assets/images/shop3.png',
    'assets/images/shop4.png',
    'assets/images/shop5.png',
  ];

  //สร้างตัวแปรเก็บ GPS ละติจูดกับลองจิจูด
  List<String> shopLocation = [
    'https://www.google.co.th/maps/@13.7058032,100.3436615,14z/',
    'https://www.google.co.th/maps/@13.7107253,100.2790096,13z/',
    'https://www.google.co.th/maps/@18.2818286,99.4207838,13z/',
    'https://www.google.co.th/maps/@13.6842485,100.2921792,13z/',
    'https://www.google.co.th/maps/@13.6842485,100.2921792,13z/',
  ];

  //เปิด Browser
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 185, 124, 100),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Image(
              image: AssetImage('assets/images/logo.png'),
              width: 170,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'เมนูเด็ด',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 100,
              margin: EdgeInsets.only(left: 25, right: 25),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: menuShow.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        menuShow[index],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'ร้านในเครือ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: branchShop.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 35, right: 35, bottom: 5),
                    child: InkWell(
                      onTap: () {
                        _launchInBrowser(Uri.parse(shopLocation[index]));
                      },
                      child: Image.asset(
                        branchShop[index],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
