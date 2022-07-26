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

class AdminPanelPage extends HookConsumerWidget {
  const AdminPanelPage({super.key});

  final String dropdownValue = '1pc';

  @override
  Widget build(BuildContext context, ref) {
    final controller = useTextEditingController();
    useEffect(() {
      Future.delayed(const Duration(milliseconds: 100), () {
        ref.read(adminAuthProvider.notifier).getUserData();
        controller.addListener(() {
          ref.read(adminAuthProvider.notifier).searchUser(controller.text);
        });
      });
      return null;
    }, []);

    ref.listen<AdminAuthState>(adminAuthProvider, (previous, next) async {
      if (previous?.loading != next.loading) {
        if (next.user == AdminUserModel.empty()) {
          context.router.navigate(
            const LandingRoute(),
          );
        }
      }
    });

    //ref.read(userProvider.notifier).usermodel();
    final state = ref.watch(adminAuthProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Image.asset(
          'assets/police_logo.png',
          height: 40,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    primary: Colors.purple,
                    visualDensity: VisualDensity.compact),
                onPressed: () {
                  context.pushRoute(const AddMemberRoute());
                },
                child: const Text('Add Member')),
          ),
          if (state.loading)
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: AspectRatio(
                    aspectRatio: 1, child: CircularProgressIndicator())),
          IconButton(
              onPressed: () {
                ref.read(adminAuthProvider.notifier).getUserData();
              },
              icon: const Icon(
                Icons.refresh,
                color: Colors.purple,
              )),
          const SizedBox(
            width: 50,
          ),
          IconButton(
              onPressed: () {
                ref.read(adminAuthProvider.notifier).logout();
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.purple,
              )),
        ],
        elevation: 0,
        centerTitle: false,
        titleTextStyle:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        title: Row(
          children: [
            const Text('GoBangla Admin'),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 50),
                    suffixIcon: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.search)),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(40))),
              ),
            ))
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
          child: Column(
            children: [
              Container(
                height: 1.h,
                color: const Color(0xFFB3B3C5).withOpacity(0.5),
              ),
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 130.w),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 200.w,
                          child: Text(
                            'Name',
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: Colors.purple,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 250.w,
                          child: Text(
                            'NID',
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: Colors.purple,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 150.w,
                          child: Text(
                            'Service Type',
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: Colors.purple,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 280.w,
                          child: Text(
                            'Phone',
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: Colors.purple,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 150.w,
                          child: Text(
                            'Go bangla ID',
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: Colors.purple,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.userList.length,
                      itemBuilder: (context, index) {
                        final user = state.userList[index];
                        return InkWell(
                          onTap: () {
                            context.router.push(UserDetailsRoute(user: user));
                          },
                          child: Row(
                            children: [
                              SizedBox(
                                width: 200.w,
                                child: Text(
                                  user.fullName,
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    color: const Color(0xFF505062),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 250.w,
                                child: Text(
                                  user.nidNo,
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    color: const Color(0xFF505062),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 150.w,
                                child: Text(
                                  user.service,
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    color: const Color(0xFF505062),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 280.w,
                                child: Text(
                                  user.phoneNo,
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    color: const Color(0xFF505062),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 150.w,
                                child: Text(
                                  state.userList[index].id,
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    color: const Color(0xFF505062),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 70.w,
                                child: PopupMenuButton(
                                  icon: const Icon(Icons.more_horiz),
                                  onSelected: (value) {
                                    Logger.i(value);
                                    // if (value == 1) {
                                    //   Navigator.of(context).push(
                                    //       MaterialPageRoute(
                                    //           builder: (context) =>
                                    //               const PersonalDetailsScreen()));
                                    // }
                                    if (value == 3) {
                                      ref
                                          .read(adminAuthProvider.notifier)
                                          .deleteUser(user.id);
                                    }
                                  },
                                  itemBuilder: (context) => [
                                    const PopupMenuItem(
                                      value: 3,
                                      child: Text(
                                        "Delete",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
