import 'package:clean_api/clean_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tourist_booking/application/admin/edit/edit_auth_provider.dart';
import 'package:tourist_booking/application/auth/auth_state.dart';

class ShowEditDialog extends HookConsumerWidget {
  final String about;
  const ShowEditDialog({Key? key, required this.about}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final fullNameController = useTextEditingController(text: about);
    // ref.listen<AuthState>(editProvider, (previous, next) {
    //   if (previous!.failure == CleanFailure.none() &&
    //       next.failure == CleanFailure.none()) {
    //     Navigator.pop(context);
    //   }
    // });
    return AlertDialog(
      title: const Text('Edit Full Name'),
      content: TextField(
        controller: fullNameController,
        decoration: const InputDecoration(
            labelText: 'Full Name', labelStyle: TextStyle(fontSize: 18)),
        maxLines: 6,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Cancle',
            style: TextStyle(color: Colors.red),
          ),
        ),
        TextButton(
          onPressed: () {
            // if (fullNameController.text != about) {
            //   ref
            //       .read(editProvider.notifier)
            //       .editFullName(fullNameController.text);
            // } else {
            //   Navigator.pop(context);
            // }
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
