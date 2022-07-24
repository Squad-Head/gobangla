import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: Colors.white,
        title: Row(
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 40),
              child: Text(
                "My Cox's Bazar",
                style: TextStyle(
                  color: Color(0xff65AF70),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
