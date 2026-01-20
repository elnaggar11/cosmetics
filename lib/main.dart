import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/logic/theme.dart';
import 'package:cosmetics/views/auth/login_view.dart';
import 'package:cosmetics/views/home/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          theme: theme(),
          navigatorKey: navKey,
          debugShowCheckedModeBanner: false,
          home: LoginView(),
        );
      },
    );
  }
}
