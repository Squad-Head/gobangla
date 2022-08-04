import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              width: 220.w,
              height: 1100.h,
              color: const Color(0xFF222D3B),
              child: Column(
                children: [
                  Text(
                    'My Cox\'s Bazar',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 50.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Navigation',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 30.h),
                      NavigationOptions(
                        optionName: 'Dashboard',
                        optionIcon: Icons.home,
                        optionIconOnPress: () {},
                        optionExpandIconOnPress: () {},
                      ),
                      SizedBox(height: 10.h),
                      NavigationOptions(
                        optionName: 'Option 01',
                        optionIcon: Icons.qr_code,
                        optionIconOnPress: () {},
                        optionExpandIconOnPress: () {},
                      ),
                      SizedBox(height: 10.h),
                      NavigationOptions(
                        optionName: 'Option 02',
                        optionIcon: Icons.qr_code,
                        optionIconOnPress: () {},
                        optionExpandIconOnPress: () {},
                      ),
                      SizedBox(height: 10.h),
                      NavigationOptions(
                        optionName: 'Option 03',
                        optionIcon: Icons.qr_code,
                        optionIconOnPress: () {},
                        optionExpandIconOnPress: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Other Options',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 30.h),
                      NavigationOptions(
                        optionName: 'Option 01',
                        optionIcon: Icons.qr_code,
                        optionIconOnPress: () {},
                        optionExpandIconOnPress: () {},
                      ),
                      SizedBox(height: 10.h),
                      NavigationOptions(
                        optionName: 'Option 02',
                        optionIcon: Icons.qr_code,
                        optionIconOnPress: () {},
                        optionExpandIconOnPress: () {},
                      ),
                      SizedBox(height: 10.h),
                      NavigationOptions(
                        optionName: 'Option 03',
                        optionIcon: Icons.qr_code,
                        optionIconOnPress: () {},
                        optionExpandIconOnPress: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 1100.h,
              width: 1220.w,
              color: const Color(0xFFF2F7FB),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.search),
                            ),
                            SizedBox(width: 12.w),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.scanner),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.notifications),
                            ),
                            SizedBox(width: 8.w),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.message),
                            ),
                            SizedBox(width: 8.w),
                            const CircleAvatar(
                              radius: 13,
                              backgroundImage: NetworkImage(
                                'https://images.unsplash.com/photo-1658958698460-73fcc464bfd6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
                              ),
                            ),
                            SizedBox(width: 10.w),
                            const Text('Kousik'),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_drop_down),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Servicing Items',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                              ),
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Text(
                                    'Active',
                                    style: TextStyle(
                                        fontSize: 12.sp, color: Colors.black),
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    size: 18.sp,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            DashboardCard(
                              titleText: 'Total Active Camera',
                              numberColor: Color(0xFF4099FF),
                              containerColor: Color(0xFF4099FF),
                              icon: Icons.camera_enhance,
                            ),
                            DashboardCard(
                              titleText: 'Total Beach Bike',
                              numberColor: Color(0xFFFF5C58),
                              containerColor: Color(0xFFFF5C58),
                              icon: Icons.bike_scooter,
                            ),
                            DashboardCard(
                              titleText: 'Total Parasuit',
                              numberColor: Color(0xFF00C79F),
                              containerColor: Color(0xFF00C79F),
                              icon: Icons.paragliding,
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            DashboardCard(
                              titleText: 'Total Surf Board',
                              numberColor: Color(0xFFFFB64D),
                              containerColor: Color(0xFFFFB64D),
                              icon: Icons.surfing,
                            ),
                            DashboardCard(
                              titleText: 'Total Beach Scooter',
                              numberColor: Color(0xFF7E3EFF),
                              containerColor: Color(0xFF7E3EFF),
                              icon: Icons.bike_scooter,
                            ),
                            DashboardCard(
                              titleText: 'Total Beach Chair',
                              numberColor: Color(0xFF00CAD1),
                              containerColor: Color(0xFF00CAD1),
                              icon: Icons.beach_access,
                            ),
                          ],
                        ),
                        SizedBox(height: 30.h),
                        Text(
                          'Our Dedicated Stuff',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              width: 1.w,
                              color: Colors.grey.withOpacity(0.3),
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: const Color(0xFF4FA45C),
                                    ),
                                    onPressed: () {},
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.add,
                                          size: 20.sp,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          'Add Stuff',
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              color: Colors.white),
                                        ),
                                        Icon(
                                          Icons.arrow_drop_down,
                                          size: 15.sp,
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 160.w,
                                    height: 30.h,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: const Color(0xFFF6F6F6),
                                        prefixIcon: Icon(
                                          Icons.search,
                                          size: 15.sp,
                                          color: const Color(0xFFACACAA),
                                        ),
                                        hintText: 'Search any keyword',
                                        hintStyle: TextStyle(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFFACACAA),
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(5.r),
                                        ),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.arrow_back),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.h),
                              Row(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 50.w,
                                    child: Text(
                                      'Select',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 180.w,
                                    child: Text(
                                      'Name',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 180.w,
                                    child: Text(
                                      'NID',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 180.w,
                                    child: Text(
                                      'Mobile',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 130.w,
                                    child: Text(
                                      'Join As',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 135.w,
                                    child: Text(
                                      'Beach Management ID',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 130.w,
                                    child: Text(
                                      'Tourist Police ID',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 120.w,
                                    child: Text(
                                      'ID Card Photo',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.h),
                              ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) => Row(
                                  // mainAxisAlignment:
                                  //     MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 50.w,
                                      child: Icon(
                                        Icons.square_outlined,
                                        color: Colors.grey.withOpacity(0.5),
                                        size: 15.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 180.w,
                                      child: Text(
                                        'Kousik Ambani',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 180.w,
                                      child: Text(
                                        '12345678',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 180.w,
                                      child: Text(
                                        '01234567890',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 130.w,
                                      child: Text(
                                        'Photographer',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          color: const Color(0xFF4FA45C),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 135.w,
                                      child: Text(
                                        '625',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 130.w,
                                      child: Text(
                                        '32568',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 120.w,
                                      height: 40,
                                      child: Image.asset(
                                          'assets/images/image1.png'),
                                    ),
                                  ],
                                ),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 10),
                                itemCount: 10,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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

class DashboardCard extends StatelessWidget {
  const DashboardCard({
    Key? key,
    required this.titleText,
    required this.numberColor,
    required this.containerColor,
    required this.icon,
  }) : super(key: key);
  final String titleText;
  final Color numberColor;
  final Color containerColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.h,
      width: 370.w,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 1.w,
          color: Colors.grey.withOpacity(0.3),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                titleText,
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                    ),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Text(
                          'Laboni Point',
                          style: TextStyle(fontSize: 8.sp, color: Colors.black),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          size: 15.sp,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.w),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                    ),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Text(
                          'August',
                          style: TextStyle(fontSize: 8.sp, color: Colors.black),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          size: 15.sp,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 30.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '846',
                    style: TextStyle(
                      fontSize: 26.sp,
                      color: numberColor,
                    ),
                  ),
                  Text(
                    '25% increase this month',
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: containerColor,
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                    child: Icon(
                      icon,
                      size: 25.sp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NavigationOptions extends StatelessWidget {
  const NavigationOptions({
    Key? key,
    required this.optionName,
    required this.optionIcon,
    required this.optionIconOnPress,
    required this.optionExpandIconOnPress,
  }) : super(key: key);

  final String optionName;
  final IconData optionIcon;
  final VoidCallback optionIconOnPress;
  final VoidCallback optionExpandIconOnPress;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: optionIconOnPress,
              icon: Icon(
                optionIcon,
                color: Colors.white,
                size: 12.sp,
              ),
            ),
            Text(
              optionName,
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.white,
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: optionExpandIconOnPress,
          icon: Icon(
            Icons.forward,
            color: Colors.white,
            size: 10.sp,
          ),
        ),
      ],
    );
  }
}
