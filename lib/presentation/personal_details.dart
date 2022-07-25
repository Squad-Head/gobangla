import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalDetails extends StatelessWidget {
  const PersonalDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.camera_alt_sharp),
                            ),
                            SizedBox(width: 20.w),
                            Column(
                              children: [
                                CircleAvatar(
                                  radius: 26,
                                  backgroundImage:
                                      AssetImage("assets/images/a.jpg"),
                                ),
                                SizedBox(height: 20.h),
                                Text(
                                  "User Name",
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(width: 20.w),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.edit),
                            ),
                          ],
                        ),
                        SizedBox(height: 40.h),
                        const Divider(),
                        SizedBox(height: 40.h),
                        Row(
                          children: [
                            Icon(
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
                            Icon(
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
                              color: Color.fromARGB(70, 255, 235, 59),
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
                            Icon(
                              Icons.logout,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 20),
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
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
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
                        ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 180,
                                        child: Text("Full Name",
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                            )),
                                      ),
                                      const SizedBox(width: 5),
                                      Text("User Name",
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                          )),
                                    ],
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                    ),
                                    onPressed: () {},
                                    child: Text("Edit",
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          color: Colors.black,
                                        )),
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (context, index) => Divider(),
                            itemCount: 14)
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
