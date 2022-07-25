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
<<<<<<< HEAD
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Register(),
    );
  }
}

=======
    return ScreenUtilInit(
      designSize: const Size(1440, 718.0),
      builder: ((context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const PersonalEditScreeen(),
          )),
    );
  }
}
>>>>>>> 983dcc5a88e65ae67aba284d5e98c774f5181bde
