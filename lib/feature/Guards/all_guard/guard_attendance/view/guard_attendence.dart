import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';

class GuardAttendance extends StatefulWidget {
  const GuardAttendance({super.key});

  @override
  State<GuardAttendance> createState() => _GuardAttendanceState();
}

class _GuardAttendanceState extends State<GuardAttendance> {
  List<bool> attendance = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  List<String> attendanceString = [
    "Absent",
    "Present",
    "Absent",
    "Present",
    "Absent",
    "Present",
    "Absent",
    "Present",
    "Absent",
    "Present",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            },
          ),
          toolbarHeight: 63.h,
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.all(16.0.h),
            physics: const BouncingScrollPhysics(),
            child: buildAttendanceCard()),
    );
  }

  Widget buildAttendanceCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Text(
                'Attendance',
                style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              width: 80.w,
              height: 40.h,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(6.r)),
              child: Padding(
                padding: EdgeInsets.all(8.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'May',
                      style: TextStyle(
                          color: AppColors.lightPrimaryColor,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    Icon(
                      Icons.calendar_today,
                      color: AppColors.lightPrimaryColor,
                      size: 24.h,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          'May,2023',
          style: TextStyle(
              color: AppColors.textColor,
              fontSize: 17.sp,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 8.h,
        ),
        attendanceCardList()
      ],
    );
  }

  Widget attendanceCardList() {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: attendance.length,
        itemBuilder: (context, index) {
          return card(index);
        });
  }

  Widget card(int index) {
    return SizedBox(
      // height: 300.h,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
        elevation: 2.h,
        margin: EdgeInsets.only(bottom: 8.h),
        surfaceTintColor: AppColors.white,
        shadowColor: AppColors.secondaryColor,
        child: Padding(
          padding: EdgeInsets.all(12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 24.w,
                        height: 24.h,
                        child: CircleAvatar(
                          backgroundColor: AppColors.primaryColor,
                          child: Container(
                            child: Text(
                              "${index + 1}",
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        "09/08/2023:",
                        style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        " ${attendanceString[index]}",
                        style: TextStyle(
                            color: attendanceString[index] == "Absent"
                                ? AppColors.redColor
                                : AppColors.greenColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                      height: 24.h,
                      child: attendanceString[index] == "Absent"
                          ? IconButton(
                              style: IconButton.styleFrom(
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap),
                              alignment: Alignment.center,
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                setState(() {
                                  if (attendance[index] == false) {
                                    attendance[index] = true;
                                  } else {
                                    attendance[index] = false;
                                  }
                                });
                              },
                              icon: attendance[index] == true
                                  ? const Icon(
                                      Icons.expand_less,
                                    )
                                  : const Icon(
                                      Icons.expand_more,
                                    ))
                          : null)
                ],
              ),
              Visibility(
                  visible: attendance[index],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        "Reason of Leave",
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      Text("Applied On 22 April, 2023 at 10:53 AM",
                          style: AppFontStyle.lightTextStyle(
                              AppColors.grayColor, 12.sp)),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                          "Korem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.",
                          style: AppFontStyle.lightTextStyle(
                              AppColors.lightPrimaryColor, 14.sp)),
                      Text(
                          "Korem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.",
                          style: AppFontStyle.lightTextStyle(
                              AppColors.lightPrimaryColor, 14.sp)),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
