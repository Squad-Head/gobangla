import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final IconData icon;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
              color: Colors.black26, offset: Offset(0, 1), blurRadius: 2.0)
        ],
      ),
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              // margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Icon(
                icon,
                color: Colors.green,
                size: 30,
              ),
              decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(10)),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: controller,
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                    decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border:
                            OutlineInputBorder(borderSide: BorderSide.none)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
