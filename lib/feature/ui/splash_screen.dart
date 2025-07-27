import 'package:flutter/material.dart';

import 'home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});



  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(

        children: [
          Spacer(),
          Center(
            child: Image.asset(
              "assets/images/img.png",
              width: 300,
              height: 300,
            ),
          ),
          Spacer(),

          SafeArea(
            child: Text(
              "Supervised by Mohamed Nabil",
              style: TextStyle(color: Colors.blue,fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
