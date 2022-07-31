import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_booking/presentation/personal_details.dart';
import 'package:tourist_booking/presentation/personal_details_edit_page.dart';

import 'registerPage/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1536.0, 745.6),
      builder: (context, child) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kormo web',
        home: Register(),
      ),
    );
  }
}
