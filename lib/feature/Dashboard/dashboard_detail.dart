import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgt_owner/shared/widgets/dashed.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;

class DetailedDashboard extends StatefulWidget {
  const DetailedDashboard({super.key});

  @override
  State<DetailedDashboard> createState() => _DetailedDashboardState();
}

class _DetailedDashboardState extends State<DetailedDashboard> {
  final List<String> reportType = [
    'General',
    'Maintenance',
    'Parking',
    'Emergency',
  ];

  final List<String> messagesType = [
    'Total Chat Heads',
    'Unread Messages',
    'Total Photos',
    'Total Videos',
  ];

  final List<String> staffPosition = [
    'Administrator',
    'Supervisor',
    'Accountant',
    'User Manager',
    'Manager',
  ];

  final List<String> propertiesList = [
    'Radission Blu Hotel',
    'Radission Blu Hotel',
    'Radission Blu Hotel',
    'Radission Blu Hotel',
  ];

  final List<String> cardOption = [
    'Total Properties',
    'Total Shifts',
    'Total Checkpoints',
    'Total Routes',
  ];

  final List<String> cardOptionValues = [
    '24',
    '10',
    '06',
    '05',
  ];

  List<List<Color>> color = [
    [
      Color(0xffe5eaed),
      Color(0xfff5f6f9),
    ],
    [
      Color(0xffd1d7f8),
      Color(0xffeef1f8),
    ],
    [
      Color(0xfff7e7d1),
      Color(0xfff5f3f1),
    ],
    [
      Color(0xffd6eae6),
      Color(0xffeff4f5),
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good Morning",
              style: AppFontStyle.regularTextStyle(
                  AppColors.secondaryColor, 14.sp),
            ),
            Text(
              "Sam Dorman",
              style: AppFontStyle.semiboldTextStyle(AppColors.textColor, 24.sp),
            ),
            Container(
              height: 300.h,
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15.w,
                  mainAxisSpacing: 15.w,
                  mainAxisExtent: 120.w, // here set custom Height You Want
                ),
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      padding: EdgeInsets.all(8.w),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        gradient: LinearGradient(
                          colors: color[index],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            width: 116.w,
                            child: Text(
                              cardOption[index],
                              style: AppFontStyle.semiboldTextStyle(
                                  AppColors.primaryColor, 18.sp),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 5,
                            child: Text(
                              cardOptionValues[index],
                              style: AppFontStyle.semiboldTextStyle(
                                  AppColors.textColor, 24.sp),
                            ),
                          ),
                        ],
                      ));
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: const Divider(
                color: AppColors.disableColor,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "All Guards",
                  style: AppFontStyle.semiboldTextStyle(
                      AppColors.textColor, 16.sp),
                ),
                Text(
                  "View All",
                  style: AppFontStyle.semiboldTextStyle(
                      AppColors.primaryColor, 14.sp),
                ),
              ],
            ),
            SizedBox(
              height: 17.h,
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.r)),
                  margin: EdgeInsets.symmetric(vertical: 6.h, horizontal: 0),
                  shadowColor: AppColors.black,
                  elevation: 3.h,
                  surfaceTintColor: AppColors.white,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    child: Column(
                      children: [
                        ListTile(
                          // minVerticalPadding: 14.5.h,
                          // horizontalTitleGap: 12.w,
                          // contentPadding: EdgeInsets.only(left: 12.w),
                          leading: Image.asset(
                            'assets/guard_1.png',
                            width: 40.w,
                            height: 40.h,
                          ),
                          title: Text(
                            "John Dewly",
                            style: AppFontStyle.semiboldTextStyle(
                                AppColors.textColor, 16.sp),
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Radission Blu Hotel",
                                style: AppFontStyle.semiboldTextStyle(
                                    AppColors.grayColor, 14.sp),
                              ),
                              Text(
                                "ACTIVE",
                                style: AppFontStyle.semiboldTextStyle(
                                    AppColors.greenColor, 14.sp),
                              ),
                            ],
                          ),
                          onTap: () {
                            Get.toNamed("/GuardProfile");
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                                text: TextSpan(
                                    text: "Created By:",
                                    style: AppFontStyle.mediumTextStyle(
                                        AppColors.textColor, 14.sp),
                                    children: [
                                  TextSpan(
                                      text: " Mac Charlie",
                                      style: AppFontStyle.mediumTextStyle(
                                          AppColors.primaryColor, 14.sp))
                                ])),
                            Text(
                              "10/09/23 - 9:00 AM",
                              style: AppFontStyle.regularTextStyle(
                                  AppColors.grayColor, 12.sp),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: const Divider(
                color: AppColors.disableColor,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Properties (101)",
                  style: AppFontStyle.semiboldTextStyle(
                      AppColors.textColor, 16.sp),
                ),
                Text(
                  "View All",
                  style: AppFontStyle.semiboldTextStyle(
                      AppColors.primaryColor, 14.sp),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.h),
              width: Get.width - 32.w,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.all(Radius.circular(6.r)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        // minVerticalPadding: 14.5.h,
                        // horizontalTitleGap: 12.w,
                        // contentPadding: EdgeInsets.only(left: 12.w),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Residential Properties",
                              style: AppFontStyle.semiboldTextStyle(
                                  AppColors.textColor, 14.sp),
                            ),
                            SvgPicture.asset(
                              "assets/arrow_right_container.svg",
                              width: 20.w,
                              height: 21.h,
                            ),
                          ],
                        ),
                        subtitle: Text(
                          "30 Properties",
                          style: AppFontStyle.semiboldTextStyle(
                              AppColors.grayColor, 14.sp),
                        ),
                        onTap: () {},
                      ),
                      const Divider(
                        color: AppColors.disableColor,
                      )
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: const Divider(
                color: AppColors.disableColor,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Activity Log",
                  style: AppFontStyle.semiboldTextStyle(
                      AppColors.textColor, 16.sp),
                ),
                Text(
                  "View All",
                  style: AppFontStyle.semiboldTextStyle(
                      AppColors.primaryColor, 14.sp),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.h),
              width: Get.width - 32.w,
              height: 343.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.all(Radius.circular(6.r)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ActivityLogs(),
                    Expanded(child: ActivityLogsDetails())
                  ],
                ),
              ),
            ),
            const Divider(
              color: AppColors.disableColor,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.h),
              padding: EdgeInsets.only(
                  bottom: 0.h, left: 13.w, right: 13.w, top: 16.h),
              width: Get.width - 32.w,
              height: 178.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.all(Radius.circular(6.r)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            "assets/problem.svg",
                            height: 12.h,
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            "Reports Analytics",
                            style: AppFontStyle.semiboldTextStyle(
                                AppColors.textColor, 14.sp),
                          ),
                          Spacer(),
                          SvgPicture.asset(
                            "assets/arrow_right_container.svg",
                            width: 20.w,
                            height: 21.h,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      DottedBorder(
                          padding: EdgeInsets.symmetric(
                              horizontal: 11.w, vertical: 8.h),
                          color: AppColors.grayColor,
                          child: Column(
                            children: [
                              Text(
                                "22.3k",
                                style: AppFontStyle.semiboldTextStyle(
                                    AppColors.primaryColor, 16.sp),
                              ),
                              Text(
                                "Total Reports",
                                style: AppFontStyle.semiboldTextStyle(
                                    AppColors.grayColor, 12.sp),
                              ),
                            ],
                          ))
                    ],
                  ),
                  Positioned(
                    bottom: 0.h,
                    left: 32.w,
                    child: SvgPicture.asset(
                      'assets/report.svg',
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "All Guards Reports",
                  style: AppFontStyle.semiboldTextStyle(
                      AppColors.textColor, 16.sp),
                ),
                Text(
                  "View All",
                  style: AppFontStyle.semiboldTextStyle(
                      AppColors.primaryColor, 14.sp),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.h),
              width: Get.width - 32.w,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.all(Radius.circular(6.r)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        // minVerticalPadding: 14.5.h,
                        // horizontalTitleGap: 12.w,
                        // contentPadding: EdgeInsets.only(left: 12.w),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              reportType[index],
                              style: AppFontStyle.semiboldTextStyle(
                                  AppColors.textColor, 14.sp),
                            ),
                            Row(
                              children: [
                                // Center(
                                //   child: SvgPicture.asset(
                                //     index == 0
                                //         ? 'assets/progress_1.svg'
                                //         : index == 1
                                //             ? 'assets/progress_2.svg'
                                //             : index == 2
                                //                 ? 'assets/progress_3.svg'
                                //                 : index == 3
                                //                     ? 'assets/progress_4.svg'
                                //                     : 'assets/progress_1.svg',
                                //     width: 30.w,
                                //     height: 50.h,
                                //   ),
                                // ),
                                Container(
                                  width: 80.w,
                                  child: LinearProgressIndicator(
                                    borderRadius: BorderRadius.all(
                                        Radius.elliptical(5.r, 5.r)),
                                    color: index == 0
                                        ? AppColors.greenColor
                                        : index == 1
                                            ? Colors.amber.shade300
                                            : index == 2
                                                ? Colors.blue.shade400
                                                : index == 3
                                                    ? Colors.blue.shade900
                                                    : AppColors.grayColor,
                                    backgroundColor: index == 0
                                        ? AppColors.greenColor.withOpacity(0.5)
                                        : index == 1
                                            ? Colors.amber.shade100
                                            : index == 2
                                                ? Colors.blue.shade100
                                                : index == 3
                                                    ? Colors.blue.shade700
                                                    : AppColors.grayColor,
                                    // minHeight: 2.h,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  "3.2k",
                                  style: AppFontStyle.semiboldTextStyle(
                                      AppColors.grayColor, 14.sp),
                                ),
                              ],
                            ),
                            // SvgPicture.asset(
                            //   "assets/arrow_right_container.svg",
                            //   width: 20.w,
                            //   height: 21.h,
                            // ),
                          ],
                        ),
                        onTap: () {
                          Get.toNamed("/report_screen");
                        },
                      ),
                      const Divider(
                        color: AppColors.disableColor,
                      )
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: const Divider(
                color: AppColors.disableColor,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Shift Analysis",
                  style: AppFontStyle.semiboldTextStyle(
                      AppColors.textColor, 16.sp),
                ),
                Row(
                  children: [
                    Text(
                      "May",
                      style: AppFontStyle.semiboldTextStyle(
                          AppColors.grayColor, 14.sp),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Icon(
                      Icons.calendar_today_rounded,
                      color: AppColors.grayColor,
                    ),
                  ],
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.h),
              padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 12.h),
              width: Get.width - 32.w,
              // height: 130.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.all(Radius.circular(6.r)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        "500k",
                        style: AppFontStyle.semiboldTextStyle(
                            AppColors.grayColor, 10.sp),
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      Text(
                        "100k",
                        style: AppFontStyle.semiboldTextStyle(
                            AppColors.grayColor, 10.sp),
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      Text(
                        "50k",
                        style: AppFontStyle.semiboldTextStyle(
                            AppColors.grayColor, 10.sp),
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      Text(
                        "10k",
                        style: AppFontStyle.semiboldTextStyle(
                            AppColors.grayColor, 10.sp),
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      Text(
                        "0k",
                        style: AppFontStyle.semiboldTextStyle(
                            AppColors.grayColor, 10.sp),
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    "assets/shift_chart.svg",
                    // width: 20.w,
                    // height: 21.h,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: const Divider(
                color: AppColors.disableColor,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "Messenger",
                      style: AppFontStyle.semiboldTextStyle(
                          AppColors.textColor, 16.sp),
                    ),
                    Text(
                      "Chatting Statistics",
                      style: AppFontStyle.regularTextStyle(
                          AppColors.grayColor, 12.sp),
                    ),
                  ],
                ),
                Text(
                  "View All",
                  style: AppFontStyle.semiboldTextStyle(
                      AppColors.primaryColor, 14.sp),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.h),
              width: Get.width - 32.w,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.all(Radius.circular(6.r)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                    child: Text(
                      "All Properties",
                      style: AppFontStyle.mediumTextStyle(
                          AppColors.textColor, 16.sp),
                    ),
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            // minVerticalPadding: 14.5.h,
                            // horizontalTitleGap: 12.w,
                            // contentPadding: EdgeInsets.only(left: 12.w),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  messagesType[index],
                                  style: AppFontStyle.semiboldTextStyle(
                                      AppColors.textColor, 14.sp),
                                ),
                                SvgPicture.asset(
                                  "assets/arrow_right_container.svg",
                                  width: 20.w,
                                  height: 21.h,
                                ),
                              ],
                            ),
                            subtitle: Text(
                              "250",
                              style: AppFontStyle.semiboldTextStyle(
                                  AppColors.grayColor, 14.sp),
                            ),
                            onTap: () {},
                          ),
                          const Divider(
                            color: AppColors.disableColor,
                          )
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: const Divider(
                color: AppColors.disableColor,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Staff",
                  style: AppFontStyle.semiboldTextStyle(
                      AppColors.textColor, 16.sp),
                ),
                Text(
                  "View All",
                  style: AppFontStyle.semiboldTextStyle(
                      AppColors.primaryColor, 14.sp),
                ),
              ],
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 8.h),
                    width: Get.width - 32.w,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.all(Radius.circular(6.r)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: ListTile(
                      // minVerticalPadding: 14.5.h,
                      // horizontalTitleGap: 12.w,
                      // contentPadding: EdgeInsets.only(left: 12.w),
                      leading: Image.asset(
                        'assets/guard_1.png',
                        width: 40.w,
                        height: 40.h,
                      ),
                      title: Text(
                        "John Dewly",
                        style: AppFontStyle.semiboldTextStyle(
                            AppColors.textColor, 16.sp),
                      ),
                      subtitle: Text(
                        staffPosition[index],
                        style: AppFontStyle.semiboldTextStyle(
                            AppColors.grayColor, 14.sp),
                      ),
                      onTap: () {
                        // Get.toNamed("/GuardProfile");
                      },
                    ),
                  );
                }),
            Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: const Divider(
                color: AppColors.disableColor,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Routes",
                  style: AppFontStyle.semiboldTextStyle(
                      AppColors.textColor, 16.sp),
                ),
                Text(
                  "View All",
                  style: AppFontStyle.semiboldTextStyle(
                      AppColors.primaryColor, 14.sp),
                ),
              ],
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: propertiesList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 8.h),
                    width: Get.width - 32.w,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.all(Radius.circular(6.r)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              Offset(0.w, 3.h), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Container(
                      margin: EdgeInsets.all(2.w),
                      color: AppColors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed('/route_detail_screen');
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                propertiesList[index].toString(),
                                style: AppFontStyle.mediumTextStyle(
                                    AppColors.primaryColor, 16.sp),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Route Name:',
                                    style: AppFontStyle.semiboldTextStyle(
                                        AppColors.textColor, 12.sp),
                                  ),
                                  Text(
                                    ' Beverly ',
                                    style: AppFontStyle.semiboldTextStyle(
                                        AppColors.primaryColor, 12.sp),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Assign Guards:',
                                    style: AppFontStyle.semiboldTextStyle(
                                        AppColors.textColor, 12.sp),
                                  ),
                                  Text(
                                    ' 07 ',
                                    style: AppFontStyle.semiboldTextStyle(
                                        AppColors.primaryColor, 12.sp),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Shift Name:',
                                        style: AppFontStyle.semiboldTextStyle(
                                            AppColors.textColor, 12.sp),
                                      ),
                                      Text(
                                        ' Suhana shift',
                                        style: AppFontStyle.semiboldTextStyle(
                                            AppColors.primaryColor, 12.sp),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Total Checkpoint:',
                                        style: AppFontStyle.semiboldTextStyle(
                                            AppColors.textColor, 12.sp),
                                      ),
                                      Text(
                                        ' 07 ',
                                        style: AppFontStyle.mediumTextStyle(
                                            AppColors.primaryColor, 12.sp),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }

  ActivityLogs() {
    return SizedBox(
      width: 50.w,
      child: Column(
        children: [
          Container(
            height: 343.h,
            width: 30.w,
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Stack(
                    clipBehavior: Clip.none,
                    children: [
                      SizedBox(
                        width: 343.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              height: 12.h,
                              width: 12.w,
                              margin: EdgeInsets.symmetric(
                                  vertical: 7.w, horizontal: 1.w),
                              decoration: BoxDecoration(
                                  color: Color((math.Random().nextDouble() *
                                              0xFFFFFF)
                                          .toInt())
                                      .withOpacity(1.0),
                                  borderRadius: BorderRadius.circular(50.r)),
                            ),
                            index == 3
                                ? Container()
                                : Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 4.h),
                                    child: Container(
                                        height: 120.h,
                                        child: VerticalDivider(
                                          color: AppColors.disableColor,
                                          thickness: 1.w,
                                        )),
                                  )
                          ],
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }

  ActivityLogsDetails() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Video next product ',
                    style: AppFontStyle.semiboldTextStyle(
                        AppColors.textColor, 16.sp),
                  ),
                  Text(
                    'Tomorrow',
                    style: AppFontStyle.regularTextStyle(
                        AppColors.grayColor, 12.sp),
                  ),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                'Product introduction and details video',
                style:
                    AppFontStyle.regularTextStyle(AppColors.grayColor, 14.sp),
              ),
              SizedBox(
                height: 70.h,
              ),
            ],
          ),
        );
      },
    );
  }
}
