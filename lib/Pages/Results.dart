import 'package:share/share.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Home.dart';

// ignore: must_be_immutable
class Results extends StatefulWidget {
  int marks;
  int wrong;
  var correctlist;
  Results(
      {@required Key key,
      @required this.marks,
      @required this.wrong,
      @required this.correctlist})
      : super(key: key);

  @override
  _ResultsState createState() => _ResultsState(marks, wrong, correctlist);
}

class _ResultsState extends State<Results> {
  int marks;
  int wrong;
  var correctList;
  _ResultsState(this.marks, this.wrong, this.correctList);
  int j = 0;
  int percent = 0, percent2 = 0;
  List<String> text = ['Congratulations!!', 'You Can Do Better !!'];

  @override
  void initState() {
    super.initState();

    percent2 = ((wrong / (wrong + marks)) * 100).round();
    percent = 100 - percent2;

    if (marks < 25) {
      j = 1;
    } else {
      j = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          islamicBackground(),
          background(),
          page(),
          Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 0.125.sh),
                  child: SizedBox(
                    child: Center(
                      child: CircleAvatar(
                        radius: 185.sp,
                        backgroundColor: Colors.white54,
                        child: CircleAvatar(
                          radius: 160.sp,
                          backgroundColor: Colors.white60,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 140.sp,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'نـــقــاطــــك',
                                    style: TextStyle(
                                      color: ourColor,
                                      fontSize: 35.sp,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 0.02.sh,
                                          ),
                                          Text(
                                            'نقطة',
                                            style: TextStyle(
                                              fontSize: 28.sp,
                                              color: ourColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        '$marks',
                                        style: TextStyle(
                                          fontSize: 72.sp,
                                          color: ourColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ConstrainedBox quizBox() {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 0.5.sh,
      ),
      child: Card(
        margin: EdgeInsets.only(
          left: 0.08.sw,
          right: 0.08.sw,
          top: 0.27.sh,
        ),
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          height: 0.25.sh,
          padding: EdgeInsets.symmetric(
            horizontal: 0.sw,
            vertical: 0.025.sh,
          ),
          decoration: BoxDecoration(
            boxShadow: [
              new BoxShadow(
                color: ourColor,
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              SizedBox(height: 0.008.sh),
              //Question counter
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(flex: 1, child: SizedBox()),
                    Expanded(
                      flex: 4,
                      child: Column(
                        children: [
                          Text(
                            ' $percent%',
                            style: TextStyle(
                              fontSize: 40.sp,
                              color: ourColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 0.01.sw),
                            child: Text(
                              'Correct',
                              style: TextStyle(
                                fontSize: 22.sp,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(flex: 1, child: SizedBox()),
                    Expanded(
                      flex: 4,
                      child: Column(
                        children: [
                          Text(
                            '${marks + wrong}',
                            style: TextStyle(
                              fontSize: 40.sp,
                              color: ourColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Total Question',
                            style: TextStyle(
                              fontSize: 22.sp,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: SizedBox(),
                    )
                  ]),
              SizedBox(height: 0.045.sh),
              //Quetion text
              Row(
                children: [
                  Expanded(flex: 1, child: SizedBox()),
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        Text(
                          '$marks',
                          style: TextStyle(
                            fontSize: 40.sp,
                            color: Colors.greenAccent[700],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Correct',
                          style: TextStyle(
                            fontSize: 22.sp,
                            color: Colors.green[500],
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(flex: 1, child: SizedBox()),
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        Text(
                          '$wrong',
                          style: TextStyle(
                            fontSize: 40.sp,
                            color: Colors.redAccent[700],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'wrong',
                          style: TextStyle(
                            fontSize: 22.sp,
                            color: Colors.red[500],
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: SizedBox(),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container page() {
    return Container(
      //main column
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 0.12.sh),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              quizBox(),
            ],
          ),
          SizedBox(height: 0.125.sh),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  TextButton(
                    onPressed: () {
                      Share.share('لقد حققت $marks اجابة صحيحة في الاختبار');
                    },
                    child: CircleAvatar(
                      radius: 80.sp,
                      backgroundColor: Colors.blue,
                      child: Icon(
                        Icons.share,
                        color: Colors.white,
                        size: 65.sp,
                      ),
                    ),
                  ),
                  Text(
                    'مشاركة النتيجة',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 23.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: CircleAvatar(
                      radius: 80.sp,
                      backgroundColor: Colors.brown[400],
                      child: Icon(
                        Icons.remove_red_eye,
                        color: Colors.white,
                        size: 65.sp,
                      ),
                    ),
                  ),
                  Text(
                    'رؤية الاجوبة الصحيحة',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 23.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          PageTransition(
                              child: Home(),
                              type: PageTransitionType.topToBottom),
                          (route) => false);
                    },
                    child: CircleAvatar(
                      radius: 80.sp,
                      backgroundColor: Colors.purple,
                      child: Icon(
                        Icons.home,
                        color: Colors.white,
                        size: 65.sp,
                      ),
                    ),
                  ),
                  Text(
                    'الصفحة الرئيسية',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 23.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Container background() {
    return Container(
      child: Column(
        children: [
          Container(
            height: 0.5.sh,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/background-1.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container islamicBackground() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/background-2.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
