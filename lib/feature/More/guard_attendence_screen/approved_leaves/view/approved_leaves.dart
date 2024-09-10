import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';

class ApprovedLeaves extends StatefulWidget {
  const ApprovedLeaves({super.key});

  @override
  State<ApprovedLeaves> createState() => _ApprovedLeavesState();
}

class _ApprovedLeavesState extends State<ApprovedLeaves> {
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
    "Approved",
    "Approved",
    "Approved",
    "Approved",
    "Approved",
    "Approved",
    "Approved",
    "Approved",
    "Approved",
    "Approved",
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
        RichText(
            text: TextSpan(
                text: "Total Working Days",
                style:
                    AppFontStyle.semiboldTextStyle(AppColors.textColor, 16.sp),
                children: [
              TextSpan(
                text: " (40)",
                style:
                    AppFontStyle.semiboldTextStyle(AppColors.grayColor, 16.sp),
              )
            ])),
        SizedBox(
          height: 16.h,
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
                            color: AppColors.greenColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                      height: 24.h,
                      child: IconButton(
                          style: IconButton.styleFrom(
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap),
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
                                )))
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
                              AppColors.lightPrimaryColor, 12.sp)),
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
                              AppColors.textColor, 14.sp)),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
