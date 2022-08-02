import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  final String text =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eleifend nulla ac erat ullamcorper, in tempus odio vestibulum. Suspendisse potenti. Maecenas tempor ultrices nibh vitae condimentum. Vivamus venenatis lacinia mauris ac efficitur. Sed aliquam purus in justo posuere vulputate. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nullam eget venenatis dolor. Mauris nec ultrices tellus. Mauris ultrices augue non tortor blandit aliquam. Curabitur ut lacus pellentesque tellus eleifend volutpat.";

  @override
  Widget build(BuildContext context) {
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
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    primary: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 20)),
                onPressed: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => const LoginScreen()));
                },
                child: const Text('Login',
                    style: TextStyle(color: Colors.black, fontSize: 20)))
          ],
        ),
      ),
    );
  }
}
