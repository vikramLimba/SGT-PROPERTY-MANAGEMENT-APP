import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgt_owner/feature/Properties/assign_guard/views/assign_guard.dart';
import 'package:sgt_owner/shared/widgets/custom_buttons.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';

class RequestedLeaveScreen extends StatefulWidget {
  const RequestedLeaveScreen({super.key});

  @override
  State<RequestedLeaveScreen> createState() => _RequestedLeaveScreenState();
}

class _RequestedLeaveScreenState extends State<RequestedLeaveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
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
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back_outlined,
                  color: AppColors.textColor,
                ),
              ),
            ),
            leadingWidth: 30.w,
            title: Text(
              "Requested Leaves",
              style: AppFontStyle.semiboldTextStyle(AppColors.textColor, 16.sp),
            ),
            centerTitle: false,
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  //screenNavigator(context, SettingsScreen());
                },
                icon: const Icon(
                  Icons.search_outlined,
                  color: AppColors.primaryColor,
                ),
              ),
            ]),
        body: Column(children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(Radius.elliptical(5.r, 5.r)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5.r,
                        blurRadius: 7.r,
                        offset: Offset(0.w, 3.h), // changes position of shadow
                      ),
                    ],
                  ),
                  margin: EdgeInsets.all(2.w),
                  child: Padding(
                    padding: EdgeInsets.all(8.w),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            // Get.toNamed("/staff_profile");
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(93.r),
                                          child: Image.asset(
                                            'assets/guard.png',
                                            fit: BoxFit.fill,
                                            width: 54.w,
                                            height: 54.h,
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
                                            style:
                                                AppFontStyle.semiboldTextStyle(
                                                    AppColors.primaryColor,
                                                    16.sp),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Phone Number: ",
                                                style: AppFontStyle
                                                    .mediumTextStyle(
                                                        AppColors.textColor,
                                                        12.sp),
                                              ),
                                              Text(
                                                '(813) 752-5611',
                                                style: AppFontStyle
                                                    .mediumTextStyle(
                                                        AppColors.primaryColor,
                                                        12.sp),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            'Supervisor',
                                            style:
                                                AppFontStyle.semiboldTextStyle(
                                                    AppColors.grayColor, 14.sp),
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
                          height: 17.h,
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
                              width: MediaQuery.of(context).size.width * .9,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 19.w, vertical: 14.h),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                border: Border.all(
                                    width: 1.w, color: AppColors.disableColor),
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
                              width: MediaQuery.of(context).size.width * .9,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 19.w, vertical: 14.h),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                border: Border.all(
                                    width: 1.w, color: AppColors.disableColor),
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
                              width: MediaQuery.of(context).size.width * .9,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 19.w, vertical: 14.h),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                border: Border.all(
                                    width: 1.w, color: AppColors.disableColor),
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
                          ],
                        ),
                      ],
                    ),
                  ))),
          Container(
            width: Get.width - 32.w,
            child: Column(
              children: [
                Container(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: AppButton(
                        onTaps: () {
                          // Get.toNamed('/edit_route');
                          Get.dialog(ApproveLeavesDialog());
                        },
                        backgoundColor: AppColors.primaryColor,
                        textColor: AppColors.white,
                        titleText: "Approve Leave"),
                  ),
                ),
                Container(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
                    child: AppButton(
                      onTaps: () {
                        Get.toNamed('/rejected_leave_screen');
                      },
                      backgoundColor: AppColors.white,
                      textColor: AppColors.primaryColor,
                      titleText: 'Reject',
                      borderColor: AppColors.primaryColor,
                      isIcon: false,
                    ),
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}

class ApproveLeavesDialog extends StatefulWidget {
  ApproveLeavesDialog({
    super.key,
  });

  @override
  State<ApproveLeavesDialog> createState() => _ApproveLeavesDialogState();
}

class _ApproveLeavesDialogState extends State<ApproveLeavesDialog> {
  bool expand = false;
  bool tapped = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(5.r),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.elliptical(5.r, 5.r),
                        topRight: Radius.elliptical(5.r, 5.r),
                      ),
                    ),
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Assign Another Guard On duty",
                        style: AppFontStyle.semiboldTextStyle(
                            AppColors.white, 16.sp),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 19.w),
                          child: Text(
                            'Shift 1',
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: const Color(0xFF636578),
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .9,
                          padding: EdgeInsets.symmetric(
                              horizontal: 19.w, vertical: 14.h),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            border: Border.all(
                                width: 1.w, color: AppColors.disableColor),
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(5.r, 5.r)),
                          ),
                          child: Text(
                            'Hallway - Morning',
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.dialog(GuardsListings());
                              },
                              child: Padding(
                                padding: EdgeInsets.only(top: 8.h),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * .9,
                                  padding: EdgeInsets.only(
                                      left: 19.w,
                                      top: 14.w,
                                      bottom: 14.w,
                                      right: 11.w),
                                  decoration: BoxDecoration(
                                      color: AppColors.white,
                                      border: Border.all(
                                          width: 1,
                                          color: AppColors.disableColor),
                                      borderRadius: BorderRadius.all(
                                          Radius.elliptical(5.r, 5.r))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Select guard to send application ',
                                          style: AppFontStyle.regularTextStyle(
                                              AppColors.disableColor, 12.sp)),
                                      Icon(
                                        Icons.keyboard_arrow_down,
                                        color: AppColors.textColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 10.w,
                              child: Container(
                                color: AppColors.white,
                                child: Text(
                                  ' Available Guard  ',
                                  style: AppFontStyle.mediumTextStyle(
                                      AppColors.grayColor, 12.sp),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          contentPadding: EdgeInsets.all(0),
                          value: tapped,
                          fillColor: MaterialStatePropertyAll(AppColors.white),
                          checkColor: AppColors.primaryColor,
                          title: Text(
                            'Assign All shifts of guard 1',
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w400),
                          ),
                          onChanged: (value) {
                            setState(() {
                              tapped = value!;
                            });
                          },
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(Get.width - 32.w, 47.h),
                            backgroundColor: AppColors.primaryColor,
                            textStyle: AppFontStyle.semiboldTextStyle(
                                AppColors.white, 16.sp),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                          ),
                          onPressed: () {
                            Get.back();
                          },
                          child: Text(
                            "Assign Duty",
                            style: AppFontStyle.semiboldTextStyle(
                                AppColors.white, 14.sp),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(Get.width - 32.w, 47.h),
                              backgroundColor: AppColors.white,
                              foregroundColor: AppColors.primaryColor,
                              textStyle: AppFontStyle.semiboldTextStyle(
                                  AppColors.primaryColor, 16.sp),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.r),
                                side: BorderSide(
                                  color: AppColors.primaryColor,
                                  width: 1.w,
                                ),
                              )),
                          onPressed: () {
                            Get.back();
                          },
                          child: Text(
                            "Not Now",
                            style: AppFontStyle.semiboldTextStyle(
                                AppColors.primaryColor, 14.sp),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ],
    );
  }
}

class GuardsListings extends StatefulWidget {
  const GuardsListings({super.key});

  @override
  State<GuardsListings> createState() => _GuardsListingsState();
}

class _GuardsListingsState extends State<GuardsListings> {
  List<bool> checkBox = [
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
    false,
    false,
    false,
    false,
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.symmetric(vertical: 120.h),
      child: Column(
        children: [
          Container(
            color: AppColors.primaryColor,
            padding: EdgeInsets.symmetric(horizontal: 19, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Available Guards',
                  style: AppFontStyle.mediumTextStyle(AppColors.white, 16.sp),
                ),
                Text(
                  '17',
                  style: AppFontStyle.mediumTextStyle(AppColors.white, 16.sp),
                ),
              ],
            ),
          ),
          Container(
            height: 350.h,
            child: GlowingOverscrollIndicator(
              color: AppColors.primaryColor,
              axisDirection: AxisDirection.down,
              child: RawScrollbar(
                minThumbLength: 40.h,
                thumbColor: AppColors.primaryColor,
                radius: Radius.circular(20),
                thickness: 5,
                child: guardCard(),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.primaryBackColor,
            ),
            width: Get.width,
            height: 66.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal:25.w,vertical: 8.h),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(6.r)),backgroundColor: AppColors.primaryColor),
                onPressed: () {
                },
                child: Text(
                    'Assign Guard',
                    style: AppFontStyle.mediumTextStyle(AppColors.white, 16.sp),
                  ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget guardCard() {
    return ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: checkBox.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                setState(() {
                  checkBox[index] = true;
                });
                if (checkBox[index] == true) {
                  Navigator.pop(context);
                }
              },
              child: card(index));
        });
  }

  Widget card(index) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: SizedBox(
        height: 75.h,
        child: Card(
          margin: EdgeInsets.zero,
          surfaceTintColor: Colors.white,
          elevation: 2.h,
          shadowColor: AppColors.grayColor,
          color: checkBox[index] == true
              ? AppColors.primaryBackColor
              : AppColors.white,
          shape: const RoundedRectangleBorder(),
          child: Row(children: [
            RotatedBox(
              quarterTurns: (1),
              child: Container(
                height: 16.h,
                decoration: BoxDecoration(
                    color: checkBox[index] == true
                        ? AppColors.primaryColor
                        : AppColors.primaryBackColor),
                child: Center(
                  child: Text(
                    "Available",
                    style: TextStyle(
                        color: checkBox[index] == true
                            ? AppColors.white
                            : AppColors.primaryColor,
                        fontSize: 12.h,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 6.w),
              child: Image(
                  height: 55.h,
                  width: 55.w,
                  image: const AssetImage("assets/guard_image.png")),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Lorri Warf ${index + 1}",
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  RichText(
                      text: TextSpan(
                          text: "Email:",
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black),
                          children: [
                        TextSpan(
                            text: " Lorri201@gmail.com",
                            style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                overflow: TextOverflow.ellipsis))
                      ])),
                  SizedBox(
                    height: 2.h,
                  ),
                  RichText(
                      text: TextSpan(
                          text: "Phone Number:",
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black),
                          children: [
                        TextSpan(
                            text: " (920) 948-1722",
                            style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                overflow: TextOverflow.ellipsis))
                      ])),
                ],
              ),
            ),
            Padding(
              padding: Platform.isAndroid
                  ? EdgeInsets.all(14.w)
                  : EdgeInsets.all(0.w),
              child: Checkbox(
                  side: const BorderSide(color: AppColors.primaryColor),
                  value: checkBox[index],
                  activeColor: AppColors.primaryColor,
                  onChanged: (bool? newValue) {
                    setState(() {
                      Future.delayed(Duration.zero, () {
                        // Get.toNamed('/PropertiesPage',
                        //     arguments: {"selectedGuardsCard": card(index)});
                        Navigator.pop(context);
                      });

                      checkBox[index] = newValue!;
                    });
                  }),
            )
          ]),
        ),
      ),
    );
  }
}
