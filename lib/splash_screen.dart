import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    // Future.delayed(Duration(milliseconds: 1000), () {
    //   Navigator.pushNamed(context, '/main/home');
    // });

    return Scaffold(
      body: Container(
        child: Text(
          'splash screen...',
          style: TextStyle(fontSize: 48),
        ),
      ),
    );
  }
}
