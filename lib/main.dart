import 'package:clean_api/clean_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tourist_booking/presentation/admin/auth/admin_login_page.dart';
import 'package:tourist_booking/presentation/admin/dashboard/admin_panel.dart';

import 'presentation/router/router.gr.dart';
import 'presentation/user/auth/landing_page.dart';

void main() {
  CleanApi.instance.setup(
    baseUrl: 'https://beach-data.up.railway.app/api/',
  );
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1440, 718),
      builder: ((context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Hello Cox',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          // home: const ReRoutePage(),
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
        );
      }),
    );
  }
}
