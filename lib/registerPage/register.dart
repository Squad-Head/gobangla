import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../presentation/personal_details.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  List<String> items = ['English', 'Bangla', 'Hindi', 'Arabic', 'Spaish'];
  String? selectedItem = 'English';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75.h,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40).r,
              child: const Text(
                "My Cox's Bazar",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xff65AF70),
                ),
              ),
            ),
            SizedBox(
              width: 1000.w,
            ),
            DropdownButton<String>(
              underline: Container(),
              icon: const Icon(Icons.arrow_drop_down_sharp),
              value: selectedItem,
              items: items
                  .map(
                    (item) => DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    ),
                  )
                  .toList(),
              onChanged: (item) => setState(() => selectedItem = item),
            ),
            SizedBox(
              width: 20.h,
            ),
            TextButton(
              onPressed: () {
                // print(MediaQuery.of(context).size);
                showDialog(
                  context: context,
                  builder: (context) => loginPopup(),
                );
              },
              child: const Text(
                "Sign In",
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(
              width: 20.h,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff65AF70),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const PersonalDetails()),
                  ),
                );
              },
              child: const Text(
                "Register",
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 80, right: 80, top: 30, bottom: 40).r,
        child: Container(
          height: 900.h,
          width: double.infinity,
          decoration: BoxDecoration(
            image: const DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                  "https://images.pexels.com/photos/1078981/pexels-photo-1078981.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
            ),
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 200, right: 200).r,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "My Cox's Bazar",
                  style: TextStyle(
                    fontSize: 70.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                const Text(
                  "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Container(
                  height: 35.h,
                  width: 195.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25.r),
                    ),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const PersonalDetails()),
                        ),
                      );
                    },
                    child: const Text(
                      "Register",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AlertDialog loginPopup() {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      backgroundColor: const Color(0xffF3F4F5),
      icon: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          Icon(Icons.exit_to_app),
        ],
      ),
      title: Center(
        child: Text(
          "Login to your account",
          style: TextStyle(
            color: const Color(0xff4FA45C),
            fontSize: 30.sp,
          ),
        ),
      ),
      actions: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 30, top: 20),
              child: Container(
                height: 90.h,
                width: 600.w,
                padding: const EdgeInsets.only(top: 10, bottom: 10).r,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10).r,
                      child: Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          color: const Color(0xffE8F5F1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.mail),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Email Address or Mobile Number"),
                        SizedBox(
                          width: 500.w,
                          child: const TextField(
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: Colors.black38, fontSize: 15),
                              hintText:
                                  'Enter your email address or mobile number',
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 30, top: 20),
              child: Container(
                height: 90.h,
                width: 600.w,
                padding: const EdgeInsets.only(top: 10, bottom: 10).r,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10).r,
                      child: Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          color: const Color(0xffE8F5F1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.lock),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Password"),
                        SizedBox(
                          width: 500.w,
                          child: const TextField(
                            obscuringCharacter: '*',
                            decoration: InputDecoration(),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 30, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add_box),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Remember me",
                            style: TextStyle(
                              color: Color(0xff4FA45C),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    "Forgot password?",
                    style: TextStyle(
                      color: Color(0xff4FA45C),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            SizedBox(
              height: 50.h,
              width: 250.w,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: const Color(0xff4FA45C),
                ),
                onPressed: () {},
                child: const Text(
                  "Login",
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Color(0xff4FA45C),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
