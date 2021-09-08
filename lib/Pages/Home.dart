import 'dart:ui';
// import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:cs/Pages/Ready.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'PDFPage.dart';

Color ourColor = Color.fromARGB(255, 154, 88, 216);

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color ourColor = Color.fromARGB(255, 154, 88, 216);

  @override
  Widget build(BuildContext context) {
    const drawerheader = UserAccountsDrawerHeader(
      accountName: Text('Osama rida'),
      accountEmail: Text('Omar  kaialy'),
      currentAccountPicture: CircleAvatar(
        child: FlutterLogo(
          size: 4,
        ),
      ),
      otherAccountsPictures: [
        CircleAvatar(
          child: FlutterLogo(
            size: 4,
          ),
        ),
      ],
      decoration: BoxDecoration(color: Colors.purple),
      currentAccountPictureSize: Size.square(80),
    );

    final drawerItems = ListView(
      children: [
        drawerheader,
        ListTile(title: Text('omar'), onTap: () {}),
        ListTile(
          title: Text('osama'),
          onTap: () {},
        )
      ],
    );
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        drawer: Drawer(
          elevation: 2,
          child: drawerItems,
        ),
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
              padding:
                  EdgeInsets.symmetric(horizontal: 0.02.sw, vertical: 0.sw),
              child: IconButton(
                icon: Icon(Icons.info_outlined),
                iconSize: 60.sp,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: Text('about us'),
                            content: Text(
                                'لقد تم برمجة هذا التطبيق من قبل عمر كيالي و اسامة رضا عام 2021'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Cancel'))
                            ],
                          ));
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
              SizedBox(height: 50),
              Expanded(
                child: Container(
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
                flex: 3,
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
    {String? title,
    String? hint,
    Icon? icon,
    String? image,
    String? page,
    BuildContext? context}) {
  return Card(
    borderOnForeground: true,
    elevation: 20,
    color: Colors.white,
    margin: EdgeInsets.all(0.012.sh),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    child: ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      onTap: () {
        late String myImage, myDescription;
        if (page == 'summary') {
          Navigator.push(
              context!,
              MaterialPageRoute(
                  builder: (context) =>
                      PDFPage.withoutLocatio(key: Key('key3'))));
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
    {BuildContext? context, String? page, String? image, String? description}) {
  Navigator.push(
    context!,
    MaterialPageRoute(
      builder: (context) => Ready.withoutLocatio(
        key: Key('key3'),
        page: page,
        image: image,
        description: description,
      ),
    ),
  );
}
