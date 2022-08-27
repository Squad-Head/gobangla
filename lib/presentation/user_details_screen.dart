import 'package:clean_api/clean_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tourist_booking/application/admin/admin%20auth/admin_auth_provider.dart';
import 'package:tourist_booking/domain/admin/user/user_list_model.dart';
import 'package:tourist_booking/presentation/personal_info.dart';

class UserDetailsScreen extends HookConsumerWidget {
  final UserListModel user;
  const UserDetailsScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final data = useState(user);
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
                              onPressed: () async {
                                final image = await pickImage();
                                if (image != null) {
                                  final newUser = await ref
                                      .read(adminAuthProvider.notifier)
                                      .uploadProfile(image, data.value.id);

                                  Logger.i(newUser);

                                  if (newUser != null) {
                                    data.value = newUser;
                                  }
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
                                        data.value.avater.isNotEmpty
                                            ? NetworkImage(data.value.avater)
                                            : null),
                                SizedBox(height: 20.h),
                                Text(
                                  data.value.fullName,
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
                          value: data.value.fullName,
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
                            title: 'NID number', value: data.value.nidNo),
                        PersonalInfo(
                            title: 'Fathers name',
                            value: data.value.fathersName),
                        PersonalInfo(
                            title: 'Mothers name',
                            value: data.value.mothersName),
                        PersonalInfo(
                            title: 'Mobile number', value: data.value.phoneNo),
                        PersonalInfo(
                            title: 'Permanent address',
                            value: data.value.permanentAddress),
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
                            value: data.value.recomandationGiverName),
                        PersonalInfo(
                            title: 'Phone number',
                            value: data.value.recomandationGiverMobileNo),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Other info',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        PersonalInfo(
                            title: 'Gobangla ID', value: data.value.id),
                        PersonalInfo(
                            title: 'Join as a', value: data.value.service),
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
