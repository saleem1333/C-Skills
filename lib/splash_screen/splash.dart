import 'package:cskills/Pages/Home.dart';
import 'package:flutter/material.dart';
import 'animation_screen.dart';
import 'absorb.dart';

class Splash extends StatefulWidget {
  Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          Scaffold(body: Absorb()),
          IgnorePointer(
            child: Stack(
              children: [
                AnimationScreen(color: ourColor),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
