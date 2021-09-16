import 'package:cskills/Pages/Home.dart';
import 'package:flutter/material.dart';

class Absorb extends StatefulWidget {
  Absorb({Key key}) : super(key: key);

  @override
  _AbsorbState createState() => _AbsorbState();
}

class _AbsorbState extends State<Absorb> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => Home()), (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
}
