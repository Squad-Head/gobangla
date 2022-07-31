import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalInfo extends StatelessWidget {
  final String title;
  final String value;
  const PersonalInfo({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 180,
                  child: Text(title,
                      style: TextStyle(
                        fontSize: 16.sp,
                      )),
                ),
                const SizedBox(width: 5),
                Text(value,
                    style: TextStyle(
                      fontSize: 16.sp,
                    )),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
              ),
              onPressed: () {},
              child: Text("Edit",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.black,
                  )),
            ),
          ],
        ),
        const Divider()
      ],
    );
  }
}
