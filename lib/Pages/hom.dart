import 'package:cs/Data/QuizBrain.dart';
import 'package:cs/Pages/PDFPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'QuizPage.dart';

Color ourColor = Color.fromARGB(255, 154, 88, 216);

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final _kTabsPages = <Widget>[
      page(context, 'summary', 'هنا يوجد تلخيص للمقرر',
          'assets/images/exam-3.png'),
      page(
          context,
          'circles',
          'تم في هذا القسم أتمتة دورة 2020 ' +
              'ووضعها على شكل Quiz ليتمكن الطالب من اختبار نفسه ومعرفة مستواه  في تلك الدورة.\n' +
              '\n#ملاحظة: في كل سؤال لديك مهلة 30 ثانية للإجابة وإلا سيتم الانتقال للسؤال التالي' +
              ' واعتبار الإجابة خاطئة.',
          'assets/images/exam-4.png'),
      page(
          context,
          'full exam',
          'هنا اختبار شامل تم وضعه من ضمن الملخص' +
              ' يقيس مدى فهم الطالب للملخص واستعداده لامتحان مادة مهارات التواصل.\n' +
              '\n#ملاحظة: في كل سؤال لديك مهلة 30 ثانية للإجابة وإلا سيتم الانتقال للسؤال التالي' +
              ' واعتبار الإجابة خاطئة.',
          'assets/images/stopwatch.png')
    ];
    final _kTabs = <Tab>[
      const Tab(
        icon: Icon(Icons.wysiwyg_rounded),
        text: 'الملخص',
      ),
      const Tab(
        icon: Icon(Icons.assistant_rounded),
        text: 'دورة 2020',
      ),
      const Tab(
        icon: Icon(Icons.lock_clock),
        text: 'الاختبار الشامل',
      )
    ];
    return DefaultTabController(
        length: _kTabs.length,
        child: Scaffold(
          bottomNavigationBar: Material(
            color: Colors.purple,
            child: TabBar(
              tabs: _kTabs,
            ),
          ),
          body: TabBarView(children: _kTabsPages),
        ));
  }

  Container page(
      BuildContext context, String page, String description, String image) {
    return Container(
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
              image: AssetImage('$image'),
            ),
            flex: 2,
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
                    Text(
                      '$description',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontSize: 29.sp,
                        fontWeight: FontWeight.bold,
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
            flex: 4,
          ),
          Padding(
            padding: EdgeInsets.all(0.012.sh),
            child: Expanded(
              flex: 1,
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
                    if (page == 'summary') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PDFPage.withoutLocatio(key: Key('key3'))));
                    } else if (page == 'circles') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizPage.withoutLocatio(
                            key: Key('key3'),
                            map: QuizBrain.exams,
                            answersList: QuizBrain.exans,
                            correctAnswers: QuizBrain.correctanswers,
                          ),
                        ),
                      );
                    } else if (page == 'full exam') {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizPage.withoutLocatio(
                            key: Key('key3'),
                            map: QuizBrain.qui,
                            answersList: QuizBrain.omar,
                            correctAnswers: QuizBrain.ans,
                          ),
                        ),
                      );
                    }
                  });
                },
              ),
            ),
          ),
          SizedBox(
            height: 0.015.sh,
          )
        ],
      ),
    );
  }
}
