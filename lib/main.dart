import 'package:cosmetics/core/utils/ui/arrow_back_widget.dart';
import 'package:cosmetics/core/utils/ui/custom_text_field.dart';
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
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        home: const Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ArrowBackWidget(),
              Center(child: Text('data')),
              CustomTextField(hintText: 'Enter text'),
            ],
          ),
        ),
      ),
    );
  }
}
