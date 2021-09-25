import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../data/quiz_brain.dart';
import 'quiz_page.dart';

class Ready extends StatefulWidget {
  Ready.without(Key key, this.description, this.image, this.page);

  Ready.withoutLocatio({
    @required Key key,
    @required this.page,
    @required this.image,
    @required this.description,
  }) : super(key: key);

  final String description;
  final String image;
  final String page;

  @override
  _ReadyState createState() => _ReadyState(page, image, description);
}

class _ReadyState extends State<Ready> {
  _ReadyState(this.page, this.image, this.description);

  String description;
  String image;
  Color ourColor = Color.fromARGB(255, 154, 88, 216);
  String page;

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
              SizedBox(height: 45),
              Expanded(
                child: Image(
                  image: AssetImage(image),
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
                    padding: EdgeInsets.all(0.02.sh),
                    child: Column(
                      children: [
                        SingleChildScrollView(
                          child: Text(
                            '$description',
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              fontSize: 28.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          'إذا كنت مستعدًا اضغط زر البدء\nحظاً موفقاً!',
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 28.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                flex: 5,
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
                        Navigator.pushAndRemoveUntil(
                          context,
                          PageTransition(
                            child: ShowCaseWidget(
                              builder: Builder(
                                builder: (context) => QuizPage.withoutLocatio(
                                  key: Key('key3'),
                                  map: QuizBrain.exams,
                                  answersList: QuizBrain.exans,
                                  correctAnswers: QuizBrain.correctanswers,
                                ),
                              ),
                            ),
                            type: PageTransitionType.leftToRightWithFade,
                          ),
                          (route) => false,
                        );
                      } else if (page == 'full exam') {
                        Navigator.push(
                          context,
                          PageTransition(
                            child: ShowCaseWidget(
                              builder: Builder(
                                builder: (context) => QuizPage.withoutLocatio(
                                  key: Key('key3'),
                                  map: QuizBrain.qui,
                                  answersList: QuizBrain.omar,
                                  correctAnswers: QuizBrain.ans,
                                ),
                              ),
                            ),
                            type: PageTransitionType.rightToLeftWithFade,
                          ),
                        );
                      }
                    });
                  },
                ),
              ),
              SizedBox(height: 0.015.sh)
            ],
          ),
        ),
      ),
    );
  }
}
