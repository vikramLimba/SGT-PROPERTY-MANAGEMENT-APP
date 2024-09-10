import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgt_owner/style/colors.dart';

class GuardCreateSuccessPopup extends StatefulWidget {
  const GuardCreateSuccessPopup({super.key});

  @override
  State<GuardCreateSuccessPopup> createState() =>
      _GuardCreateSuccessPopupState();
}

class _GuardCreateSuccessPopupState extends State<GuardCreateSuccessPopup> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pop(context);
      Get.toNamed('/AllGuards');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(5.r)),
        width: double.maxFinite,
        height: 310.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/ang-1.png",
              height: 150.h,
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                "Guard Profile successfully Created!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              "App link sended to guard registered email.",
              style: TextStyle(
                  color: AppColors.grayColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
