import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tourist_booking/application/admin/edit/edit_auth_provider.dart';
import 'package:tourist_booking/application/auth/auth_provider.dart';
import 'package:tourist_booking/presentation/personal_info.dart';

import 'admin/user_info_edit/fullname_edit_dialog.dart';

class PersonalDetailsScreen extends HookConsumerWidget {
  const PersonalDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final editController = useTextEditingController();
    final state = ref.watch(authProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 100, top: 50, right: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (state.loading) const LinearProgressIndicator(),
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
                              onPressed: () async {
                                final image = await pickImage();
                                if (image != null) {
                                  ref
                                      .read(authProvider.notifier)
                                      .uploadProfile(image);
                                }
                              },
                              icon: const Icon(Icons.camera_alt_sharp),
                            ),
                            SizedBox(width: 20.w),
                            Column(
                              children: [
                                CircleAvatar(
                                    radius: 80.w,
                                    backgroundImage:
                                        state.user.avater.isNotEmpty
                                            ? NetworkImage(state.user.avater)
                                            : null),
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
                        PersonalInfo(
                          title: 'Full name',
                          value: state.user.fullName,
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
                        PersonalInfo(
                            title: 'NID number', value: state.user.nidNo),
                        PersonalInfo(
                            title: 'Fathers name',
                            value: state.user.fathersName),
                        PersonalInfo(
                            title: 'Mothers name',
                            value: state.user.mothersName),
                        PersonalInfo(
                            title: 'Mobile number', value: state.user.phoneNo),
                        PersonalInfo(
                            title: 'Permanent address',
                            value: state.user.permanentAddress),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Referred by',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        PersonalInfo(
                            title: 'Name',
                            value: state.user.recomandationGiverName),
                        PersonalInfo(
                            title: 'Phone number',
                            value: state.user.recomandationGiverMobileNo),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Other info',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        PersonalInfo(
                            title:
                                'Id number (Issued by beach management committee)',
                            value: state.user.beachManagementCommiteeId),
                        PersonalInfo(
                            title: 'Join as a', value: state.user.service),
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

  Future<XFile?> pickImage() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image
    return await picker.pickImage(source: ImageSource.gallery);
  }
}
