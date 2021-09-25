import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'splash_screen/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    // WidgetsFlutterBinding.ensureInitialized();
    return ScreenUtilInit(
      designSize: Size(720, 1520),
      // designSize: Size(1080, 2340),
      builder: () => MaterialApp(
        title: 'C-Skills',
        debugShowCheckedModeBanner: false,
        home: Splash(),
      ),
    );
  }
}
