// ignore_for_file: avoid_unnecessary_containers, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:sau_mukratha_app/views/home_ui.dart';
import 'package:sau_mukratha_app/views/menu_ui.dart';

class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({super.key});

  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeUI(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/logo.png',
                height: 200,
              ),
            ),
            SizedBox(height: 50),
            CircularProgressIndicator(
              color: Colors.white,
            ),
            SizedBox(height: 50),
            Text(
              'Tech SAU BUFFET',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'copyright @ 2025 by Thayakorn',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
