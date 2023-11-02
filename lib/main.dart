import 'package:easy_flutter/core/view/splash_screen.dart';
import 'package:easy_flutter/image/ui/view/image_screen.dart';
import 'package:easy_flutter/main/ui/view/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 824),
      builder: (context, child) => MaterialApp(
        theme: ThemeData(
          fontFamily: 'Pretendard',
        ),
        debugShowCheckedModeBanner: false,
        home: child,
      ),
      child: SplashScreen(delay: true),
    );
  }
}
