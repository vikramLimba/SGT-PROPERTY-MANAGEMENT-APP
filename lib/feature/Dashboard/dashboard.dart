import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgt_owner/feature/Dashboard/dashboard_detail.dart';
import 'package:sgt_owner/feature/Properties/property_creation/views/property_creation.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';
import 'package:flutter_svg/svg.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Good Morning",
                style: AppFontStyle.regularTextStyle(
                    AppColors.secondaryColor, 14.sp),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Sam Dorman",
                    style: AppFontStyle.semiboldTextStyle(
                        AppColors.textColor, 24.sp),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(DetailedDashboard());
                  },
                  child: Text(
                    "click here for\n Detailed Dashboard",
                    style:
                        AppFontStyle.boldTextStyle(AppColors.greenColor, 10.sp),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            Image.asset(
              "assets/no_property_added.png",
              width: 200.w,
              height: 150.h,
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              "No Property Added",
              style: AppFontStyle.boldTextStyle(AppColors.textColor, 16.sp),
            ),
            SizedBox(
              height: 12.h,
            ),
            SizedBox(
              // width: Get.width-184.w,
              height: 38.h,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.r))),
                  onPressed: () {
                    Get.to(PropertyCreationPage());
                  },
                  child: Text(
                    "+ Add New Property",
                    style:
                        AppFontStyle.semiboldTextStyle(AppColors.white, 16.sp),
                  )),
            ),
            SizedBox(
              height: 16.h,
            ),
            Divider(
              thickness: 1.h,
              color: AppColors.disableColor,
            ),
            SizedBox(
              height: 16.h,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "All Guards",
                style:
                    AppFontStyle.semiboldTextStyle(AppColors.textColor, 16.sp),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Image.asset(
              "assets/ang-1.png",
              width: 130.w,
              height: 130.h,
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              "No Property Added",
              style: AppFontStyle.boldTextStyle(AppColors.primaryColor, 16.sp),
            ),
            SizedBox(
              height: 12.h,
            ),
            SizedBox(
              // width: Get.width-184.w,
              height: 38.h,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.r))),
                  onPressed: () {
                    Get.toNamed('ProfilePage');
                  },
                  child: Text(
                    "+ Add New Guard",
                    style:
                        AppFontStyle.semiboldTextStyle(AppColors.white, 16.sp),
                  )),
            ),
            SizedBox(
              height: 16.h,
            ),
            Divider(
              thickness: 1.h,
              color: AppColors.disableColor,
            ),
            SizedBox(
              height: 16.h,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Activity Log",
                style:
                    AppFontStyle.semiboldTextStyle(AppColors.textColor, 16.sp),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Image.asset(
              "assets/activity-log.png",
              width: 130.w,
              height: 130.h,
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              "No Activity logs",
              style: AppFontStyle.boldTextStyle(AppColors.primaryColor, 16.sp),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              "Activities will appear here",
              style:
                  AppFontStyle.mediumTextStyle(AppColors.secondaryColor, 16.sp),
            ),
            SizedBox(
              height: 16.h,
            ),
            Divider(
              thickness: 1.h,
              color: AppColors.disableColor,
            ),
            SizedBox(
              height: 16.h,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Report Analytics",
                style:
                    AppFontStyle.semiboldTextStyle(AppColors.textColor, 16.sp),
              ),
            ),
            SizedBox(
              height: 28.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/problem.svg",
                    height: 12.h,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    "Report Analytics",
                    style: AppFontStyle.semiboldTextStyle(
                        AppColors.textColor, 14.sp),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.w),
              child: Align(
                alignment: Alignment.centerLeft,
                child: DottedBorder(
                    borderType: BorderType.RRect,
                    dashPattern: const [2, 2],
                    radius: Radius.circular(6.r),
                    color: AppColors.secondaryColor,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 20.h),
                      child: Text(
                        "Total Reports",
                        style: AppFontStyle.semiboldTextStyle(
                            AppColors.secondaryColor, 16.sp),
                      ),
                    )),
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
            SvgPicture.asset(
              "assets/chart.svg",
              height: 50.h,
            ),
            SizedBox(
              height: 16.h,
            ),
            Divider(
              thickness: 1.h,
              color: AppColors.disableColor,
            ),
            SizedBox(
              height: 16.h,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "All Guards Reports",
                style:
                    AppFontStyle.semiboldTextStyle(AppColors.textColor, 16.sp),
              ),
            ),
            SizedBox(
              height: 26.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.w, bottom: 12.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "General",
                    style: AppFontStyle.regularTextStyle(
                        AppColors.textColor, 14.sp),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.disableColor,
                        borderRadius: BorderRadius.circular(5.r)),
                    width: 80.w,
                    height: 5.h,
                  )
                ],
              ),
            ),
            Divider(
              thickness: 1.h,
              color: AppColors.disableColor,
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.w, bottom: 12.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Maintenance",
                    style: AppFontStyle.regularTextStyle(
                        AppColors.textColor, 14.sp),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.disableColor,
                        borderRadius: BorderRadius.circular(5.r)),
                    width: 80.w,
                    height: 5.h,
                  )
                ],
              ),
            ),
            Divider(
              thickness: 1.h,
              color: AppColors.disableColor,
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.w, bottom: 12.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Parking",
                    style: AppFontStyle.regularTextStyle(
                        AppColors.textColor, 14.sp),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.disableColor,
                        borderRadius: BorderRadius.circular(5.r)),
                    width: 80.w,
                    height: 5.h,
                  )
                ],
              ),
            ),
            Divider(
              thickness: 1.h,
              color: AppColors.disableColor,
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.w, bottom: 12.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "General",
                    style: AppFontStyle.regularTextStyle(
                        AppColors.textColor, 14.sp),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.disableColor,
                        borderRadius: BorderRadius.circular(5.r)),
                    width: 80.w,
                    height: 5.h,
                  )
                ],
              ),
            ),
            Divider(
              thickness: 1.h,
              color: AppColors.disableColor,
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Shift Analysis",
                    style: AppFontStyle.semiboldTextStyle(
                        AppColors.textColor, 16.sp),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "May",
                      style:
                          AppFontStyle.semiboldTextStyle(Colors.black54, 16.sp),
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Icon(
                      Icons.calendar_today,
                      color: Colors.black54,
                      size: 24.w,
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 32.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 6.w,
                ),
                Column(
                  children: [
                    Text(
                      "500K",
                      style: AppFontStyle.semiboldTextStyle(
                          AppColors.secondaryColor, 10.sp),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    Text(
                      "100K",
                      style: AppFontStyle.semiboldTextStyle(
                          AppColors.secondaryColor, 10.sp),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    Text(
                      "50K",
                      style: AppFontStyle.semiboldTextStyle(
                          AppColors.secondaryColor, 10.sp),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    Text(
                      "10K",
                      style: AppFontStyle.semiboldTextStyle(
                          AppColors.secondaryColor, 10.sp),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    Text(
                      "0",
                      style: AppFontStyle.semiboldTextStyle(
                          AppColors.secondaryColor, 10.sp),
                    ),
                  ],
                ),
                SizedBox(
                  width: 7.w,
                ),
                SvgPicture.asset(
                  "assets/shift-chart.svg",
                  height: 200.h,
                )
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Divider(
              thickness: 1.h,
              color: AppColors.disableColor,
            ),
            SizedBox(
              height: 16.h,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Messenger",
                style:
                    AppFontStyle.semiboldTextStyle(AppColors.textColor, 18.sp),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Chatting Statistics",
                style: AppFontStyle.regularTextStyle(
                    AppColors.secondaryColor, 12.sp),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "All Properties",
                style: AppFontStyle.mediumTextStyle(AppColors.textColor, 16.sp),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Total Chat Heads",
                style: AppFontStyle.mediumTextStyle(AppColors.textColor, 14.sp),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Divider(
              thickness: 1.h,
              color: AppColors.disableColor,
            ),
            SizedBox(
              height: 12.h,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Unread Messages",
                style: AppFontStyle.mediumTextStyle(AppColors.textColor, 14.sp),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Divider(
              thickness: 1.h,
              color: AppColors.disableColor,
            ),
            SizedBox(
              height: 12.h,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Total Photos",
                style: AppFontStyle.mediumTextStyle(AppColors.textColor, 14.sp),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Divider(
              thickness: 1.h,
              color: AppColors.disableColor,
            ),
            SizedBox(
              height: 12.h,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Total Videos",
                style: AppFontStyle.mediumTextStyle(AppColors.textColor, 14.sp),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Divider(
              thickness: 1.h,
              color: AppColors.disableColor,
            ),
            SizedBox(
              height: 16.h,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Staff",
                style:
                    AppFontStyle.semiboldTextStyle(AppColors.textColor, 18.sp),
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Total Routes",
                style:
                    AppFontStyle.semiboldTextStyle(AppColors.textColor, 18.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
