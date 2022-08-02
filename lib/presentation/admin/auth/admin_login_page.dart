import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tourist_booking/application/admin/admin%20auth/admin_auth_provider.dart';
import 'package:tourist_booking/application/auth/auth_provider.dart';
import 'package:tourist_booking/presentation/auth/admin_page/admin_panel.dart';

class AdminLoginPage extends HookConsumerWidget {
  const AdminLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final userController = useTextEditingController();

    final passwordController = useTextEditingController();
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      backgroundColor: const Color(0xffF3F4F5),
      title: Center(
        child: Text(
          "Login to your admin account",
          style: TextStyle(
            color: const Color(0xff4FA45C),
            fontSize: 30.sp,
          ),
        ),
      ),
      actions: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 30, top: 20),
              child: Container(
                // height: 90.h,
                width: 600.w,
                padding: const EdgeInsets.only(top: 10, bottom: 10).r,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10).r,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffE8F5F1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.mail),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Email Address or Mobile Number"),
                        SizedBox(
                          width: 500.w,
                          child: TextField(
                            controller: userController,
                            decoration: const InputDecoration(
                                isDense: true,
                                hintText: 'Write your password here',
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide.none)),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 30, top: 20),
              child: Container(
                width: 600.w,
                padding: const EdgeInsets.only(top: 10, bottom: 10).r,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10).r,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffE8F5F1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.lock),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Password"),
                        SizedBox(
                          width: 500.w,
                          child: TextField(
                            controller: passwordController,
                            obscureText: true,
                            obscuringCharacter: '*',
                            decoration: const InputDecoration(
                                isDense: true,
                                hintText: 'Write your password here',
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide.none)),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            SizedBox(
              height: 50.h,
              width: 250.w,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),

                  //backgroundColor: const Color(0xff4FA45C),
                ),
                onPressed: () {
                  if (userController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty) {
                    ref.read(adminAuthProvider.notifier).adminLogin(
                        username: userController.text,
                        password: passwordController.text);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AdminPanelPage()));
                  }
                },
                child: const Text(
                  "Login",
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ],
    );
  }
}
