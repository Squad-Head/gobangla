import 'package:auto_route/auto_route.dart';
import 'package:clean_api/clean_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tourist_booking/application/admin/admin%20auth/admin_auth_provider.dart';
import 'package:tourist_booking/application/admin/admin%20auth/admin_auth_state.dart';
import 'package:tourist_booking/domain/admin/auth/admin_user_model.dart';
import 'package:tourist_booking/presentation/router/router.gr.dart';

class AdminLoginPage extends HookConsumerWidget {
  const AdminLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final userController = useTextEditingController();
    final passwordController = useTextEditingController();
    useEffect(() {
      Future.delayed(const Duration(milliseconds: 100), () async {
        ref.read(adminAuthProvider.notifier).tryLogin();
      });
      return null;
    }, []);

    ref.listen<AdminAuthState>(adminAuthProvider, (previous, next) async {
      if (previous?.loading != next.loading && !next.loading) {
        if (next.user != AdminUserModel.empty()) {
          context.router.navigate(
            const AdminPanelRoute(),
          );
          // Navigator.pushReplacement(context,
          //     MaterialPageRoute(builder: (_) => const PersonalDetailsScreen()));
        } else if (next.failure != CleanFailure.none()) {
          next.failure.showDialogue(context);
        }
      }
    });
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://images.pexels.com/photos/2784759/pexels-photo-2784759.jpeg?cs=srgb&dl=pexels-asad-photo-maldives-2784759.jpg&fm=jpg&w=1920&h=1079'))),
        child: AlertDialog(
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
                            const Text("Mobile Number"),
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
        ),
      ),
    );
  }
}
