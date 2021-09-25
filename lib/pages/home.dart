import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Ready.dart';
import 'about.dart';
import 'pdf_page.dart';

Color ourColor = Color.fromARGB(255, 154, 88, 216);

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'مهارات التواصل',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 45.sp,
            ),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 0.02.sw,
                vertical: 0.sw,
              ),
              child: IconButton(
                icon: Icon(Icons.info_outlined),
                iconSize: 60.sp,
                onPressed: () {
                  Navigator.push(
                    context,
                    PageTransition(
                        child: AboutPage.withoutLocatio(key: Key('AboutPage')),
                        type: PageTransitionType.leftToRightWithFade),
                  );
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
              SizedBox(height: 50),
              Expanded(
                flex: 3,
                child: Stack(
                  alignment: Alignment(0.85, -0.85),
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/home.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          new BoxShadow(
                            color: ourColor,
                            blurRadius: 200,
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: double.infinity,
                      margin: EdgeInsets.all(0.012.sh),
                    ),
                    Image.asset(
                      'assets/images/logo.png',
                      height: 0.08.sh,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 0.01.sh),
              Expanded(
                child: myList(
                  title: 'الملخص',
                  hint: 'ملخص المقرر',
                  icon: Icon(
                    Icons.auto_stories,
                    color: Color(0xFF00ffc1),
                    size: 0.050.sh,
                  ),
                  image: 'assets/images/exam-1.png',
                  page: 'summary',
                  context: context,
                ),
              ),
              Expanded(
                child: myList(
                  title: 'الدورات',
                  hint: 'دورة 2020',
                  icon: Icon(
                    Icons.article_outlined,
                    color: Color(0xFFff4b3a),
                    size: 0.050.sh,
                  ),
                  image: 'assets/images/exam-5.png',
                  page: 'circles',
                  context: context,
                ),
              ),
              Expanded(
                child: myList(
                  title: 'أسئلة شاملة',
                  hint: 'أسئلة تشمل ملخص المادة',
                  icon: Icon(
                    Icons.alarm,
                    color: Color(0xFFffe93e),
                    size: 0.050.sh,
                  ),
                  image: 'assets/images/quiz.png',
                  page: 'full exam',
                  context: context,
                ),
              ),
              SizedBox(height: 0.02.sh),
            ],
          ),
        ),
      ),
    );
  }
}

Card myList(
    {String title,
    String hint,
    Icon icon,
    String image,
    String page,
    BuildContext context}) {
  return Card(
    margin: EdgeInsets.all(0.01.sh),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    child: ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      onTap: () {
        String myImage, myDescription;
        if (page == 'summary') {
          myImage = '';
          myDescription = '';
          Navigator.push(
            context,
            PageTransition(
              child: PDFPage.withoutLocatio(key: Key('key3')),
              type: PageTransitionType.bottomToTop,
            ),
          );
        } else if (page == 'circles') {
          myImage = 'assets/images/exam-4.png';
          myDescription = 'تم في هذا القسم أتمتة دورة 2020 ' +
              'ووضعها على شكل Quiz ليتمكن الطالب من اختبار نفسه ومعرفة مستواه  في تلك الدورة.\n' +
              '\n#ملاحظة: في كل سؤال لديك مهلة 30 ثانية للإجابة وإلا سيتم الانتقال للسؤال التالي' +
              ' واعتبار الإجابة خاطئة.';
        } else if (page == 'full exam') {
          myImage = 'assets/images/stopwatch.png';
          myDescription = 'هنا اختبار شامل تم وضعه من ضمن الملخص' +
              ' يقيس مدى فهم الطالب للملخص واستعداده لامتحان مادة مهارات التواصل.\n' +
              '\n#ملاحظة: في كل سؤال لديك مهلة 30 ثانية للإجابة وإلا سيتم الانتقال للسؤال التالي' +
              ' واعتبار الإجابة خاطئة.';
        }
        tap(
          context: context,
          image: myImage,
          description: myDescription,
          page: page,
        );
      },
      leading: icon,
      title: Text(
        '$title',
        textDirection: TextDirection.rtl,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 35.sp,
        ),
      ),
      subtitle: Text(
        '$hint',
        textDirection: TextDirection.rtl,
        style: TextStyle(
          fontSize: 30.sp,
        ),
      ),
      trailing: CircleAvatar(
        child: Image.asset('$image'),
        backgroundColor: Colors.transparent,
        radius: 40.sp,
      ),
      tileColor: Colors.white,
      horizontalTitleGap: 0.045.sw,
    ),
  );
}

void tap(
    {BuildContext context, String page, String image, String description}) {
  if (page == 'summary') {
  } else {
    Navigator.push(
      context,
      PageTransition(
        child: Ready.withoutLocatio(
          key: Key('key3'),
          page: page,
          image: image,
          description: description,
        ),
        type: PageTransitionType.bottomToTop,
      ),
    );
  }
}
