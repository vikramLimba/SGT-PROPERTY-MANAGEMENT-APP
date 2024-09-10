import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:sgt_owner/feature/Guards/assign_duty/shared/view/assignDuty_progress_bar.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';

class GuardsPage extends StatefulWidget {
  const GuardsPage({super.key});

  @override
  State<GuardsPage> createState() => _GuardsPageState();
}

class _GuardsPageState extends State<GuardsPage> {
  List<bool> checkBox = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
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
        title: Text(
          'Assign Duty',
          style: AppFontStyle.semiboldTextStyle(AppColors.black, 17.sp),
        ),
        titleSpacing: 8,
        centerTitle: false,
        toolbarHeight: 63.h,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.h),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                color: AppColors.white,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 8.h),
                  child: const AssignDutyProgrssBar(currentIndex: 0),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              guardCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget guardCard() {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: checkBox.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                setState(() {
                  checkBox[index] = true;
                });
                if (checkBox[index] == true) {
                  Get.toNamed('/PropertiesPage',
                      arguments: {"selectedGuardsCard": card(index)});
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
                        Get.toNamed('/PropertiesPage',
                            arguments: {"selectedGuardsCard": card(index)});
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
