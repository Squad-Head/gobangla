import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tourist_booking/application/auth/auth_provider.dart';
import 'package:tourist_booking/presentation/personal_info.dart';

class PersonalDetailsScreen extends HookConsumerWidget {
  const PersonalDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(authProvider);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 100, top: 50, right: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 30),
                    height: 600.h,
                    width: 300.w,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.camera_alt_sharp),
                            ),
                            SizedBox(width: 20.w),
                            Column(
                              children: [
                                const CircleAvatar(
                                  radius: 26,
                                  backgroundImage:
                                      AssetImage("assets/images/a.jpg"),
                                ),
                                SizedBox(height: 20.h),
                                Text(
                                  state.user.fullName,
                                  //"User Name",
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(width: 20.w),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.edit),
                            ),
                          ],
                        ),
                        SizedBox(height: 40.h),
                        const Divider(),
                        SizedBox(height: 40.h),
                        Row(
                          children: [
                            const Icon(
                              Icons.people,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 20.w),
                            Text(
                              "Personal details",
                              style: TextStyle(
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          children: [
                            const Icon(
                              Icons.notifications,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 20.w),
                            Text(
                              "Notification",
                              style: TextStyle(
                                fontSize: 14.sp,
                              ),
                            ),
                            SizedBox(width: 20.w),
                            Container(
                              height: 20.h,
                              width: 20.w,
                              color: const Color.fromARGB(70, 255, 235, 59),
                              child: Center(
                                child: Text(
                                  "26",
                                  style: TextStyle(fontSize: 10.sp),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          children: [
                            const Icon(
                              Icons.logout,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 20),
                            Text(
                              "Logout",
                              style: TextStyle(
                                fontSize: 14.sp,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                  SizedBox(width: 40.w),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Personal Details",
                          style: TextStyle(
                              fontSize: 30.sp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 40.h),
                        const PersonalInfo(title: 'Full name', value: 'Kousik'),
                        const PersonalInfo(
                            title: 'NID number', value: '12345678'),
                        const PersonalInfo(
                            title: 'Fathers name', value: 'Slauddin Ahmed'),
                        const PersonalInfo(
                            title: 'Mothers name', value: 'Mahabuba Rahman'),
                        const PersonalInfo(
                            title: 'Mobile number', value: '0198765432'),
                        const PersonalInfo(
                            title: 'Permanent address', value: 'uttara dhaka'),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Referred by',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const PersonalInfo(
                            title: 'Name', value: 'Zaman Mostofa'),
                        const PersonalInfo(
                            title: 'Phone number', value: '0198765432'),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Other info',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const PersonalInfo(
                            title:
                                'Id number (Issued by beach management committee)',
                            value: '293'),
                        const PersonalInfo(
                            title: 'Join as a', value: 'Photographer'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
