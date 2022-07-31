// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourist_booking/application/auth/auth_provider.dart';
import 'package:tourist_booking/application/auth/auth_state.dart';
import 'package:tourist_booking/domain/auth/user_model.dart';
import 'package:tourist_booking/presentation/auth/login/login_screen.dart';
import 'package:tourist_booking/presentation/personal_details.dart';
import 'package:tourist_booking/presentation/personal_details_edit_page.dart';

class ReRoutePage extends HookConsumerWidget {
  const ReRoutePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    useEffect(() {
      Future.delayed(const Duration(seconds: 2), () async {
        ref.read(authProvider.notifier).tryLogin();
      });
      return null;
    }, []);

    ref.listen<AuthState>(authProvider, (previous, next) async {
      // final prefs = await SharedPreferences.getInstance();
      // final bool x = prefs.getBool('first') ?? true;
      if (previous?.loading != next.loading && !next.loading) {
        // if (next.user != UserModel.init() &&
        //     previous?.user.id != next.user.id)

        if (next.user != UserModel.init()) {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const PersonalDetailsScreen()));
        } else if (next.user == UserModel.init()) {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const LoginScreen()));
        }
      }
    });
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
