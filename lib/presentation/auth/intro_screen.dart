import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Text(
              'My Cox\'s Bazar',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text('data')
          ],
        ),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://res.cloudinary.com/squad-head/image/upload/v1659154471/tourists/beach_msgyz8.jpg'))),
      ),
    );
  }
}
