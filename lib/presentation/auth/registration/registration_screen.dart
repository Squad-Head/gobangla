import 'package:clean_api/clean_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tourist_booking/application/auth/auth_provider.dart';
import 'package:tourist_booking/domain/auth/registration_model.dart';
import 'package:tourist_booking/presentation/auth/registration/custom_dropdown.dart';
import 'package:tourist_booking/presentation/auth/widgets/custom_textfield.dart';

class RegistrationScreen extends HookConsumerWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    //final professionController = useTextEditingController();
    final serviceController = useTextEditingController();

    final fullNameController = useTextEditingController();
    final nidController = useTextEditingController();
    final fathersNameController = useTextEditingController();
    final mothersNameController = useTextEditingController();
    final perAddressController = useTextEditingController();
    final mobileController = useTextEditingController();

    final recnameController = useTextEditingController();
    final recAddressController = useTextEditingController();
    final recMobileController = useTextEditingController();

    final beachIdController = useTextEditingController();
    final policeIdController = useTextEditingController();

    final passwordController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Coxs Bazar'),
        centerTitle: false,
        backgroundColor: Colors.white,
        titleTextStyle: const TextStyle(
            color: Colors.green, fontSize: 25, fontWeight: FontWeight.bold),
      ),
      body: ListView(
        children: [
          Container(
            height: 300,
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                    image: NetworkImage(
                      'https://images.pexels.com/photos/315998/pexels-photo-315998.jpeg?cs=srgb&dl=pexels-pixabay-315998.jpg&fm=jpg&w=1280&h=853',
                    ),
                    fit: BoxFit.cover)),
          ),
          const Center(
            child: Text(
              'Registration',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: Text(
              'Enjoy hassle-free bike and professional services',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          Center(
              child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  '01. Name and address of the applicant',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                        controller: fullNameController,
                        title: 'Full name',
                        icon: Icons.person),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomTextField(
                        controller: nidController,
                        title: 'NID/Birth Reg no.',
                        icon: Icons.document_scanner_outlined),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                        controller: fathersNameController,
                        title: 'Fathers name',
                        icon: Icons.person_outline),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomTextField(
                        controller: mothersNameController,
                        title: 'Mothers name',
                        icon: Icons.person_outline),
                  ),
                ],
              ),
              CustomTextField(
                  controller: perAddressController,
                  title: 'Permanent address',
                  icon: Icons.home),
              CustomTextField(
                  controller: mobileController,
                  title: 'Mobile number',
                  icon: Icons.phone),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  '02. Name and address of recommender',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                        controller: recnameController,
                        title: 'Full name',
                        icon: Icons.person),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomTextField(
                        controller: recAddressController,
                        title: 'Address',
                        icon: Icons.mail_outline),
                  ),
                ],
              ),
              CustomTextField(
                  controller: recMobileController,
                  title: 'Mobile number',
                  icon: Icons.phone),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  '03. Others',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              CustomTextField(
                  controller: beachIdController,
                  title: 'ID card number (Issued by Beach management committe)',
                  icon: Icons.file_present),
              CustomTextField(
                  controller: serviceController,
                  title: 'Service type',
                  icon: CupertinoIcons.bag),
              // CustomDropdown(
              //     controller: proController,
              //     //controller: professionController,
              //     title: 'Join my coxs bazar as a',
              //     icon: CupertinoIcons.bag,
              //     items: const ['Photographer', 'Beach bike', 'Hotel']),
              CustomTextField(
                  controller: policeIdController,
                  title: 'ID card number (Issued by tourist police)',
                  icon: Icons.file_present),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                  controller: passwordController,
                  title: 'Password',
                  icon: Icons.lock),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: SizedBox(
                  width: 300,
                  height: 40,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xff53A45C),
                      ),
                      onPressed: () {
                        if (fullNameController.text.isNotEmpty &&
                            nidController.text.isNotEmpty &&
                            fathersNameController.text.isNotEmpty &&
                            mothersNameController.text.isNotEmpty &&
                            perAddressController.text.isNotEmpty &&
                            mobileController.text.isNotEmpty &&
                            recnameController.text.isNotEmpty &&
                            recAddressController.text.isNotEmpty &&
                            recMobileController.text.isNotEmpty &&
                            beachIdController.text.isNotEmpty &&
                            serviceController.text.isNotEmpty &&
                            passwordController.text.isNotEmpty &&
                            policeIdController.text.isNotEmpty) {
                          final registrationModel = RegistrationModel(
                              hasAccess: true,
                              fullName: fullNameController.text,
                              password: passwordController.text,
                              nidNo: nidController.text,
                              phoneNo: int.tryParse(mobileController.text) ?? 0,
                              fathersName: fathersNameController.text,
                              mothersName: mothersNameController.text,
                              permanentAddress: perAddressController.text,
                              presentAddress: 'Dhaka',
                              recomandationGiverName: recnameController.text,
                              recomandationGiverAddress:
                                  recAddressController.text,
                              recomandationGiverMobileNo:
                                  recMobileController.text,
                              beachManagementCommiteeId: beachIdController.text,
                              touristCommiteeId: policeIdController.text,
                              validityDate: '01/26',
                              service: serviceController.text,
                              details: 'details of the user');
                          ref
                              .read(authProvider.notifier)
                              .registration(registrationModel);
                        } else {
                          Logger.i('fields needed');
                        }
                      },
                      child: const Text('Registration')),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ]),
          )),

          //Center(child: Text('Hello'))
        ],
      ),
    );
  }
}
