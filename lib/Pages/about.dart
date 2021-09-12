import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  AboutPage.without(Key key);

  AboutPage.withoutLocatio({
    required Key key,
  }) : super(key: key);

  static const telegramAccount = 'https://t.me/Cskills_bot';

  void _launchURL() => launch(
        telegramAccount,
      );
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
                    padding: EdgeInsets.all(0.03.sh),
                    child: Text(
                      'تم إنشاء هذا التطبيق نتيجة لكثرة شكاوي الطلاب حول ' +
                          ' عدم معرفة كيفية دراسة مادة مهارات التواصل، ' +
                          'وعند طرح الفكرة نالت إعجاباً كبيراً فتم تنفيذها.\n' +
                          'يرجى التواصل مع المطورين في حال تم اكتشاف أخطاء ' +
                          'سواء كانت علمية أم تقنية،، وشكراً لكم',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontSize: 29.sp,
                        fontWeight: FontWeight.bold,
                      ),
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
                    _launchURL();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        child: Image.asset('assets/images/telegram.png'),
                        backgroundColor: Colors.transparent,
                        radius: 30.sp,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'تواصل معنا',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 0.045.sw,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 0.05.sw,
                  // vertical: 0.02.sw,
                ),
                child: Divider(
                  color: Colors.black,
                ),
              ),
              Text(
                'Developed by\nOmar Kaialy & Osama Rida',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 0.035.sw,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
