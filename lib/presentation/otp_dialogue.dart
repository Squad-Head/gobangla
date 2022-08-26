import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tourist_booking/application/auth/auth_provider.dart';

class OtpDialigue extends HookConsumerWidget {
  final int otp;
  const OtpDialigue({Key? key, required this.otp}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final otpController = useTextEditingController();
    return AlertDialog(
      title: const Text('A secret code has been sent to your phone numer'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Please enter the secrect code here:'),
          TextField(
            controller: otpController,
            decoration: const InputDecoration(labelText: 'OTP'),
          ),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              if (otp.toString() == otpController.text) {
                ref.read(authProvider.notifier).verifyPhone();
                Navigator.of(context).pop();
              }
            },
            child: const Text('Submit'))
      ],
    );
  }
}
