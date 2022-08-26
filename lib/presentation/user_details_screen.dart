import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tourist_booking/domain/admin/user/user_list_model.dart';
import 'package:tourist_booking/presentation/personal_info.dart';
import 'package:tourist_booking/presentation/router/router.gr.dart';

class UserDetailsScreen extends HookConsumerWidget {
  final UserListModel user;
  const UserDetailsScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
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
                            SizedBox(width: 20.w),
                            Column(
                              children: [
                                CircleAvatar(
                                    radius: 80.w,
                                    backgroundImage: user.avater.isNotEmpty
                                        ? NetworkImage(user.avater)
                                        : null),
                                SizedBox(height: 20.h),
                                Text(
                                  user.fullName,
                                  //"User Name",
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 40.h),
                        const Divider(),
                        SizedBox(height: 40.h),
                        // InkWell(
                        //   onTap: () {
                        //     context.router.push(
                        //         PersonalDetailsEditAdminRoute(user: user));
                        //   },
                        //   child: Row(
                        //     children: [
                        //       const Icon(
                        //         Icons.edit_note,
                        //         color: Colors.grey,
                        //       ),
                        //       const SizedBox(width: 20),
                        //       Text(
                        //         "Edit profile info",
                        //         style: TextStyle(
                        //           fontSize: 14.sp,
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),
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
                        PersonalInfo(
                          title: 'Full name',
                          value: user.fullName,
                          onPress: () {
                            // showDialog(
                            //     context: context,
                            //     builder: (context) => ShowEditDialog(about: ,));
                            // if (editController.text.isNotEmpty) {
                            //   ref
                            //       .read(editProvider.notifier)
                            //       .editFullName(editController.text);
                            // }
                          },
                        ),
                        PersonalInfo(title: 'NID number', value: user.nidNo),
                        PersonalInfo(
                            title: 'Fathers name', value: user.fathersName),
                        PersonalInfo(
                            title: 'Mothers name', value: user.mothersName),
                        PersonalInfo(
                            title: 'Mobile number', value: user.phoneNo),
                        PersonalInfo(
                            title: 'Permanent address',
                            value: user.permanentAddress),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Referred by',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        PersonalInfo(
                            title: 'Name', value: user.recomandationGiverName),
                        PersonalInfo(
                            title: 'Phone number',
                            value: user.recomandationGiverMobileNo),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Other info',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        PersonalInfo(title: 'Gobangla ID', value: user.id),
                        PersonalInfo(title: 'Join as a', value: user.service),
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
