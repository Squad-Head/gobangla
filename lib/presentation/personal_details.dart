import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:clean_api/clean_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tourist_booking/application/auth/auth_provider.dart';
import 'package:tourist_booking/application/auth/auth_state.dart';
import 'package:tourist_booking/domain/auth/user_model.dart';
import 'package:tourist_booking/presentation/otp_dialogue.dart';
import 'package:tourist_booking/presentation/personal_info.dart';
import 'package:tourist_booking/presentation/router/router.gr.dart';

class PersonalDetailsScreen extends HookConsumerWidget {
  const PersonalDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(authProvider);
    ref.listen<AuthState>(authProvider, (previous, next) async {
      if (next.user == UserModel.init()) {
        context.router.navigate(
          const LandingRoute(),
        );
      }
    });

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
                        InkWell(
                          onTap: () {
                            ref.read(authProvider.notifier).logout();
                          },
                          child: Row(
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
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 180,
                                      child: Text('Account verified',
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                          )),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                        state.user.phoneVarified ? 'Yes' : 'No',
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            color: state.user.phoneVarified
                                                ? Colors.green
                                                : Colors.red)),
                                    if (!state.user.phoneVarified)
                                      const SizedBox(
                                        width: 10,
                                      ),
                                    if (!state.user.phoneVarified)
                                      OutlinedButton(
                                          style: OutlinedButton.styleFrom(
                                              primary: Colors.green),
                                          onPressed: () async {
                                            final otp = await sendOtp(
                                                state.user.phoneNo);

                                            if (otp > 0) {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      OtpDialigue(otp: otp));
                                            } else {
                                              Logger.e(
                                                  'Operation failed due to invalid certificate');
                                            }
                                          },
                                          child: const Text('Verify now'))
                                  ],
                                ),
                              ],
                            ),
                            const Divider()
                          ],
                        )
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

  Future<int> sendOtp(String phone) async {
    try {
      final random = Random();
      final otp = random.nextIntOfDigits(6);

      final data = CleanApi.instance.post(
          fromData: (json) => json,
          body: {'receiver': '+88$phone', 'otp': otp},
          endPoint: 'sms/send-message');

      Logger.i(data);
      return otp;
    } catch (e) {
      Logger.e(e);
      return -1;
    }
  }

  Future<XFile?> pickImage() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image
    return await picker.pickImage(source: ImageSource.gallery);
  }
}

extension RandomOfDigits on Random {
  int nextIntOfDigits(int digitCount) {
    assert(1 <= digitCount && digitCount <= 9);
    int min = digitCount == 1 ? 0 : pow(10, digitCount - 1) as int;
    int max = pow(10, digitCount) as int;
    return min + nextInt(max - min);
  }
}
