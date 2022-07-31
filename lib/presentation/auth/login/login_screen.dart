import 'package:clean_api/clean_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tourist_booking/application/auth/auth_provider.dart';
import 'package:tourist_booking/domain/auth/registration_model.dart';
import 'package:tourist_booking/presentation/auth/widgets/custom_textfield.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final mobileController = useTextEditingController();

    final passwordController = useTextEditingController();

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Center(
              child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomTextField(
                  controller: mobileController,
                  title: 'Mobile number',
                  icon: Icons.phone),
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
                        if (mobileController.text.isNotEmpty &&
                            passwordController.text.isNotEmpty) {
                          ref.read(authProvider.notifier).login(
                              phoneNo: mobileController.text,
                              password: passwordController.text);
                        } else {
                          Logger.i('fields needed');
                        }
                      },
                      child: const Text('Login')),
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
