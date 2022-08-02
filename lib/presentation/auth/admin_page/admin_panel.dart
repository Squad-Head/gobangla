import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tourist_booking/application/admin/admin%20auth/admin_auth_provider.dart';

class AdminPanelPage extends HookConsumerWidget {
  AdminPanelPage({super.key});

  String dropdownValue = '1pc';

  @override
  Widget build(BuildContext context, ref) {
    useEffect(() {
      Future.delayed(const Duration(milliseconds: 100), () {
        ref.read(adminAuthProvider.notifier).getUserData();
      });
      return null;
    }, []);

    //ref.read(userProvider.notifier).usermodel();
    final state = ref.watch(adminAuthProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/images/logo.png'),
                      SizedBox(width: 10.w),
                      Text(
                        'Coxs Bazar',
                        style: TextStyle(fontSize: 14.sp),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.search,
                        size: 15.sp,
                        color: const Color(0xFFB3B3C5),
                      ),
                      SizedBox(width: 15.w),
                      Icon(
                        Icons.notifications,
                        size: 15.sp,
                        color: const Color(0xFFB3B3C5),
                      ),
                      SizedBox(width: 15.w),
                      Icon(
                        Icons.settings,
                        size: 15.sp,
                        color: const Color(0xFFB3B3C5),
                      ),
                      SizedBox(width: 40.w),
                      Text(
                        'Name',
                        style: TextStyle(fontSize: 15.sp),
                      ),
                      SizedBox(width: 8.w),
                      CircleAvatar(
                        radius: 18.r,
                        backgroundImage: const NetworkImage(
                            'https://images.unsplash.com/photo-1659332589233-3637f89be936?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Container(
                height: 1.h,
                color: const Color(0xFFB3B3C5).withOpacity(0.5),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Regions',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          color: const Color(0xFF8791FC),
                          child: Row(
                            children: [
                              Icon(
                                Icons.add,
                                size: 14.sp,
                                color: const Color(0xFFFFFFFF),
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                'Add new',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: const Color(0xFFFFFFFF),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF),
                            border: Border.all(
                              color: const Color(0xFF8791FC),
                              width: 1.w,
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.download,
                                size: 14.sp,
                                color: const Color(0xFF8791FC),
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                'Export',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: const Color(0xFF8791FC),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.h),
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
                              color: const Color(0xFFC2C7FD),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 250.w,
                          child: Text(
                            'Date',
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: const Color(0xFFC2C7FD),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 150.w,
                          child: Text(
                            'Type',
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: const Color(0xFFC2C7FD),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 280.w,
                          child: Text(
                            'Email',
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: const Color(0xFFC2C7FD),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 150.w,
                          child: Text(
                            'Password',
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: const Color(0xFFC2C7FD),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Row(
                        children: [
                          SizedBox(
                            width: 200.w,
                            child: Text(
                              state.userList[index].fullName,

                              // 'Kousik Ambani',
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: const Color(0xFF505062),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 250.w,
                            child: Text(
                              state.userList[index].validityDate,
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: const Color(0xFF505062),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 150.w,
                            child: Text(
                              'Coles',
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: const Color(0xFF505062),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 280.w,
                            child: Text(
                              state.userList[index].phoneNo,
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: const Color(0xFF505062),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 150.w,
                            child: Text(
                              state.userList[index].password,
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
                              onSelected: (index) {
                                if (index == 1) {}
                              },
                              itemBuilder: (context) => [
                                const PopupMenuItem(
                                  value: 1,
                                  child: Text(
                                    "Info",
                                  ),
                                ),
                                const PopupMenuItem(
                                  value: 2,
                                  child: Text("Edit"),
                                ),
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
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemCount: state.userList.length,
                    ),
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
