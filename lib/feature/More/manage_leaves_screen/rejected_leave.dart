import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgt_owner/shared/widgets/custom_buttons.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';

class RejectedLeaveScreen extends StatefulWidget {
  const RejectedLeaveScreen({super.key});

  @override
  State<RejectedLeaveScreen> createState() => _RejectedLeaveScreenState();
}

class _RejectedLeaveScreenState extends State<RejectedLeaveScreen> {
  bool clicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 6,
          shadowColor: Color.fromARGB(255, 186, 185, 185),
          leading: Padding(
            padding: EdgeInsets.only(
              left: 12.w,
            ),
            child: GestureDetector(
              onTap: () {
                clicked == false
                    ? Get.back()
                    : Get.toNamed('/leave_listing_screen');
              },
              child: const Icon(
                Icons.arrow_back_outlined,
                color: AppColors.textColor,
              ),
            ),
          ),
          leadingWidth: 30.w,
          title: Text(
            "Rejected Leaves",
            style: AppFontStyle.semiboldTextStyle(AppColors.textColor, 16.sp),
          ),
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(5.r, 5.r)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5.r,
                          blurRadius: 7.r,
                          offset:
                              Offset(0.w, 3.h), // changes position of shadow
                        ),
                      ],
                    ),
                    margin: EdgeInsets.all(2.w),
                    child: Column(
                      children: [
                        clicked
                            ? Container(
                                decoration: BoxDecoration(
                                    color: AppColors.redColor.withOpacity(0.2),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.elliptical(5.r, 5.r),
                                        topRight: Radius.elliptical(5.r, 5.r))),
                                alignment: Alignment.center,
                                width: Get.width,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.h),
                                  child: Text(
                                    'Rejected Leave',
                                    style: AppFontStyle.semiboldTextStyle(
                                        AppColors.redColor, 14.sp),
                                  ),
                                ),
                              )
                            : Container(),
                        Padding(
                          padding: EdgeInsets.all(8.w),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  // Get.toNamed("/staff_profile");
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(93.r),
                                                child: Image.asset(
                                                  'assets/guard.png',
                                                  fit: BoxFit.fill,
                                                  width: 60.w,
                                                  height: 60.h,
                                                )),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Patricia Sanders',
                                                  style: AppFontStyle
                                                      .semiboldTextStyle(
                                                          AppColors
                                                              .primaryColor,
                                                          16.sp),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Phone Number: ",
                                                      style: AppFontStyle
                                                          .mediumTextStyle(
                                                              AppColors
                                                                  .textColor,
                                                              12.sp),
                                                    ),
                                                    Text(
                                                      '(813) 752-5611',
                                                      style: AppFontStyle
                                                          .mediumTextStyle(
                                                              AppColors
                                                                  .primaryColor,
                                                              12.sp),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  'Supervisor',
                                                  style: AppFontStyle
                                                      .semiboldTextStyle(
                                                          AppColors
                                                              .primaryColor,
                                                          14.sp),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Get.toNamed('/GuardProfile');
                                      },
                                      child: const Icon(
                                        Icons.badge,
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 19.w),
                                    child: Text(
                                      'Subject',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: Colors.grey.shade700,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * .9,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 19.w, vertical: 14.h),
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      border: Border.all(
                                          width: 1.w,
                                          color: AppColors.disableColor),
                                      borderRadius: BorderRadius.all(
                                          Radius.elliptical(5.r, 5.r)),
                                    ),
                                    child: Text(
                                      'Sick Leave',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: AppColors.textColor,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 19.w),
                                    child: Text(
                                      'Leave Duration',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: Colors.grey.shade700,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * .9,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 19.w, vertical: 14.h),
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      border: Border.all(
                                          width: 1.w,
                                          color: AppColors.disableColor),
                                      borderRadius: BorderRadius.all(
                                          Radius.elliptical(5.r, 5.r)),
                                    ),
                                    child: Text(
                                      '09/08/2023 - 16/08/2023',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: AppColors.textColor,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 19.w),
                                    child: Text(
                                      'Reason of Leave',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: Colors.grey.shade700,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * .9,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 19.w, vertical: 14.h),
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      border: Border.all(
                                          width: 1.w,
                                          color: AppColors.disableColor),
                                      borderRadius: BorderRadius.all(
                                          Radius.elliptical(5.r, 5.r)),
                                    ),
                                    child: Text(
                                      "I am writing to you today to request time off on [specific dates] because of [a death in the family/family emergency/situation at home]. I apologize for the short notice and greatly appreciate your consideration on this matter. Let me know if you have any questions. I'm happy to make up for the time that I'm gone",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: AppColors.textColor,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.all(12.w),
                                    child: Text(
                                      'Reason of Rejection',
                                      style: AppFontStyle.semiboldTextStyle(
                                          AppColors.textColor, 16.sp),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 19.w),
                                    child: Text(
                                      'Reason of Leave',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: Colors.grey.shade700,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * .9,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 19.w, vertical: 14.h),
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      border: Border.all(
                                          width: 1.w,
                                          color: AppColors.disableColor),
                                      borderRadius: BorderRadius.all(
                                          Radius.elliptical(5.r, 5.r)),
                                    ),
                                    child: Text(
                                      "I am writing to you today to request time off on [specific dates] because of [a death in the family/family emergency/situation at home]. I apologize for the short notice and greatly appreciate your consideration on this matter. Let me know if you have any questions. I'm happy to make up for the time that I'm gone",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: AppColors.textColor,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ))),
            clicked == false
                ? Container(
                    width: Get.width - 32.w,
                    child: Column(
                      children: [
                        Container(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: AppButton(
                                onTaps: () {
                                  setState(() {
                                    clicked = true;
                                  });
                                },
                                backgoundColor: AppColors.primaryColor,
                                textColor: AppColors.white,
                                titleText: "Reject Leave Request"),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.w, vertical: 16.h),
                            child: AppButton(
                              onTaps: () {},
                              backgoundColor: AppColors.white,
                              textColor: AppColors.primaryColor,
                              titleText: 'Cancel',
                              borderColor: AppColors.primaryColor,
                              isIcon: false,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 38.h,
                        ),
                      ],
                    ),
                  )
                : Container()
          ]),
        ));
  }
}
