import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:techblog/component/myColors.dart';
import 'package:techblog/view/main_screen.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MainScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage("assets/image/logo.png"),
                height: 64,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: SpinKitChasingDots(
                  color: SolidColors.primaryColor,
                  size: 35.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
