import 'dart:ui';
import 'package:cs/Data/QuizBrain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:showcaseview/showcaseview.dart';
import 'Home.dart';
import 'PDFPage.dart';
import 'QuizPage.dart';

// ignore: must_be_immutable
class Ready extends StatefulWidget {
  Ready.without(Key key);

  Ready.withoutLocatio({
    required Key key,
    required this.page,
    required this.image,
    required this.description,
  }) : super(key: key);

  String? description;
  String? image;
  String? page;

  @override
  _ReadyState createState() => _ReadyState(page, image, description);
}

class _ReadyState extends State<Ready> {
  _ReadyState(this.page, this.image, this.description);

  String? description;
  String? image;
  Color ourColor = Color.fromARGB(255, 154, 88, 216);
  String? page;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'هل أنت مستعد؟',
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 45.sp,
            ),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 0.02.sw, vertical: 0.sw),
              child: IconButton(
                icon: Icon(Icons.home),
                iconSize: 60.sp,
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      PageTransition(
                          child: Home(), type: PageTransitionType.topToBottom),
                      (route) => false);
                },
              ),
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background-3.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(height: 0.07.sh),
              SizedBox(height: 45),
              Expanded(
                child: Image(
                  image: AssetImage(image!),
                ),
                flex: 5,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: double.infinity,
                  margin: EdgeInsets.all(0.012.sh),
                  child: Padding(
                    padding: EdgeInsets.all(0.03.sh),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SingleChildScrollView(
                          child: Text(
                            '$description',
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              fontSize: 29.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          'إذا كنت مستعدًا اضغط زر البدء\nحظاً موفقاً!\n',
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 29.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                flex: 7,
              ),
              Padding(
                padding: EdgeInsets.all(0.012.sh),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 0.065.sh,
                  color: Colors.green,
                  elevation: 10,
                  disabledElevation: 3,
                  disabledColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    // side: BorderSide(
                    //   color: ourColor,
                    //   width: 2,
                    // ),
                  ),
                  child: Text(
                    // TODO: enable button & replace text with ..., 3, 2, 1, then start
                    'بدء',
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      if (page == 'circles') {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: ShowCaseWidget(
                                  builder: Builder(
                                    builder: (context) =>
                                        QuizPage.withoutLocatio(
                                      key: Key('key3'),
                                      map: QuizBrain.exams,
                                      answersList: QuizBrain.exans,
                                      correctAnswers: QuizBrain.correctanswers,
                                    ),
                                  ),
                                ),
                                type: PageTransitionType.leftToRightWithFade));
                      } else if (page == 'summary') {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: PDFPage.withoutLocatio(key: Key('key3')),
                                type: PageTransitionType.fade));
                      } else if (page == 'full exam') {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: ShowCaseWidget(
                                  builder: Builder(
                                    builder: (context) =>
                                        QuizPage.withoutLocatio(
                                      key: Key('key3'),
                                      map: QuizBrain.qui,
                                      answersList: QuizBrain.omar,
                                      correctAnswers: QuizBrain.ans,
                                    ),
                                  ),
                                ),
                                type: PageTransitionType.rightToLeftWithFade));
                      }
                    });
                  },
                ),
              ),

              SizedBox(
                height: 0.015.sh,
              )
            ],
          ),
        ),
      ),
    );
  }
}
