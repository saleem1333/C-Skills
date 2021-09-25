import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutPage extends StatelessWidget {
  AboutPage.without(Key key);

  AboutPage.withoutLocatio({
    @required Key key,
  }) : super(key: key);

  static const telegramAccount = 'https://t.me/Cskills_bot';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'About',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 50.sp,
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 45),
              Icon(
                Icons.info_outlined,
                color: Colors.white,
                size: 0.35.sh,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 0.05.sw,
                  vertical: 0.02.sw,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.all(0.015.sh),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'تم إنشاء هذا التطبيق نتيجة لكثرة شكاوي الطلاب حول ' +
                              ' عدم معرفة كيفية دراسة مادة مهارات التواصل بالرغم من سهولتها، ' +
                              'وعند طرح فكرة التطبيق نالت إعجاباً كبيراً فتم تنفيذها.\n' +
                              'يرجى التواصل مع المطورين في حال تم اكتشاف أخطاء ' +
                              'سواء كانت علمية أم تقنية،،',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: 0.02.sh,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'شكراً لكم..',
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 0.02.sh,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 0.05.sw,
                  vertical: 0.02.sw,
                ),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 0.065.sh,
                  color: Color(0xFF249cd8),
                  elevation: 10,
                  disabledElevation: 3,
                  disabledColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  onPressed: () {
                    launch(telegramAccount);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        child: Image.asset('assets/images/telegram.png'),
                        backgroundColor: Colors.transparent,
                        radius: 0.02.sh,
                      ),
                      SizedBox(width: 0.01.sw),
                      Text(
                        'تواصل معنا',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 0.025.sh,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.06.sw),
                child: Divider(color: Colors.white),
              ),
              AnimatedTextKit(totalRepeatCount: 1, animatedTexts: [
                TyperAnimatedText(
                  'Developed By\nOmar Kaialy & Osama Rida',
                  textAlign: TextAlign.center,
                  textStyle: TextStyle(
                    fontSize: 0.025.sh,
                    fontFamily: 'AkayaKanadaka',
                    height: 1.25,
                    color: Colors.white,
                  ),
                )
              ])
            ],
          ),
        ),
      ),
    );
  }
}
