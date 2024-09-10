import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgt_owner/shared/widgets/custom_appbar.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';

class AttendenceTotalGuards extends StatelessWidget {
  const AttendenceTotalGuards({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: CustomAppBar(
        titleText: 'Guard Attendance',
        isLeading: true,
      ),
        body: SingleChildScrollView(
            padding: EdgeInsets.all(16.0.h),
            physics: const BouncingScrollPhysics(),
            child: totalGuards()),
      );
  }

  Widget totalGuards() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
            text: TextSpan(
                text: "Total Guards",
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
        buildCardlist(),
      ],
    );
  }

  Widget buildCardlist() {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 8,
        itemBuilder: (context, index) {
          return buildCard();
        });
  }

  Widget buildCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
      elevation: 2.h,
      margin: EdgeInsets.only(bottom: 8.h),
      surfaceTintColor: AppColors.white,
      shadowColor: AppColors.secondaryColor,
      child: Padding(
        padding: EdgeInsets.all(12.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 4.h,
                ),
                Container(
                  height: 60.h,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: Image.asset('assets/guard_5.png'),
                ),
              ],
            ),
            SizedBox(
              width: 12.w,
            ),
            SizedBox(
              width: 215.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Larko Makson',
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700),
                      ),
                      Icon(
                        Icons.calendar_today,
                        color: AppColors.lightPrimaryColor,
                        size: 18.h,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  RichText(
                      text: TextSpan(
                          text: "Working Days:",
                          style: AppFontStyle.mediumTextStyle(
                              AppColors.textColor, 14.sp),
                          children: [
                        TextSpan(
                          text: " 224",
                          style: AppFontStyle.mediumTextStyle(
                              AppColors.primaryColor, 14.sp),
                        )
                      ])),
                  SizedBox(
                    height: 8.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed("/AbsentRecord");
                    },
                    child: RichText(
                        text: TextSpan(
                            text: "Total Absent:",
                            style: AppFontStyle.mediumTextStyle(
                                AppColors.textColor, 14.sp),
                            children: [
                          TextSpan(
                            text: " 24",
                            style: AppFontStyle.mediumTextStyle(
                                AppColors.primaryColor, 14.sp),
                          )
                        ])),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('ApprovedLeaves');
                    },
                    child: RichText(
                        text: TextSpan(
                            text: "Approved Leaves:",
                            style: AppFontStyle.mediumTextStyle(
                                AppColors.textColor, 14.sp),
                            children: [
                          TextSpan(
                            text: " 14",
                            style: AppFontStyle.mediumTextStyle(
                                AppColors.primaryColor, 14.sp),
                          )
                        ])),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
