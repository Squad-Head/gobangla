import 'package:clean_api/clean_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tourist_booking/application/auth/auth_provider.dart';
import 'package:tourist_booking/application/auth/auth_state.dart';
import 'package:tourist_booking/domain/auth/user_model.dart';
import 'package:tourist_booking/presentation/auth/login_dialogue.dart';
import 'package:tourist_booking/presentation/auth/registration/registration_screen.dart';
import 'package:tourist_booking/presentation/personal_details.dart';

class LandingPage extends HookConsumerWidget {
  const LandingPage({Key? key}) : super(key: key);

  final String text =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eleifend nulla ac erat ullamcorper, in tempus odio vestibulum. Suspendisse potenti. Maecenas tempor ultrices nibh vitae condimentum. Vivamus venenatis lacinia mauris ac efficitur. Sed aliquam purus in justo posuere vulputate. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nullam eget venenatis dolor. Mauris nec ultrices tellus. Mauris ultrices augue non tortor blandit aliquam. Curabitur ut lacus pellentesque tellus eleifend volutpat.";

  @override
  Widget build(BuildContext context, ref) {
    useEffect(() {
      Future.delayed(const Duration(seconds: 2), () async {
        ref.read(authProvider.notifier).tryLogin();
      });
      return null;
    }, []);

    ref.listen<AuthState>(authProvider, (previous, next) async {
      if (previous?.loading != next.loading && !next.loading) {
        if (next.user != UserModel.init()) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (_) => const PersonalDetailsScreen()));
        } else if (next.failure != CleanFailure.none()) {
          next.failure.showDialogue(context);
        }
      }
    });
    final loading = ref.watch(authProvider.select((value) => value.loading));
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://res.cloudinary.com/squad-head/image/upload/v1659154471/tourists/beach_msgyz8.jpg'))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: double.infinity,
              child: Center(
                child: Text(
                  'My Cox\'s Bazar',
                  style: TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 700),
                  child: Text(
                    text,
                    style: const TextStyle(color: Colors.white),
                    maxLines: 3,
                  )),
            ),
            if (loading)
              const CircularProgressIndicator(
                color: Colors.white,
              ),
            if (!loading)
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      primary: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 20)),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => const LoginDialogue());
                  },
                  child: const Text('Login',
                      style: TextStyle(color: Colors.black, fontSize: 20))),
            const SizedBox(
              height: 20,
            ),
            if (!loading)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account? ',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w200),
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          textStyle:
                              const TextStyle(fontWeight: FontWeight.bold)),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const RegistrationScreen()));
                      },
                      child: const Text('Register'))
                ],
              )
          ],
        ),
      ),
    );
  }
}
