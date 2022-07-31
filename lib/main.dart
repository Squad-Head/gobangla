import 'package:clean_api/clean_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'registerPage/landing_page.dart';

void main() {
  CleanApi.instance.setup(
    baseUrl: 'https://beach-data.up.railway.app/api/',
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1440, 718),
      builder: ((context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Hello Cox',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          // home: const ReRoutePage(),
          home: const LandingPage(),
        );
      }),
    );
  }
}
