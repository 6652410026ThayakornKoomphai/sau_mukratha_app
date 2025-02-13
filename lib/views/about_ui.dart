import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUI extends StatefulWidget {
  const AboutUI({super.key});

  @override
  State<AboutUI> createState() => _AboutUIState();
}

class _AboutUIState extends State<AboutUI> {
//method โทร
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Image.asset(
                'assets/icon/saulogo.png',
                height: 150,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Text(
                'Tech SAU BUFFET',
                style: TextStyle(
                    color: Color.fromARGB(255, 228, 70, 34),
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text(
                'แอปพลิเคชันร้านหมูกะทะ'
                '\nเพื่อคนไทย'
                '\nโดยเด็กไทย'
                '\nสนใจแอปพลิเคชันติดต่อ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Text(
                'เด็กไอที SAU',
                style: TextStyle(
                    color: Color.fromARGB(255, 78, 78, 78),
                    fontSize: 23,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              GestureDetector(
                onTap: () {
                  _makePhoneCall('0626651453');
                },
                child: Image.asset(
                  'assets/images/sauqr.png',
                  height: 100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
