import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgt_owner/shared/widgets/custom_appbar.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';
import 'package:flutter_svg/svg.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final controller = TextEditingController();
  String formFieldvalue = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        titleText: "Feedback",
        isLeading: true,
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(16.h), child: feedback()),
    );
  }

  Widget feedback() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Give feedback",
          style: AppFontStyle.semiboldTextStyle(AppColors.textColor, 16.sp),
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          "What do you think of the issue search experience with SGT",
          style: AppFontStyle.regularTextStyle(AppColors.textColor, 14.sp),
        ),
        SizedBox(
          height: 12.h,
        ),
        faces(),
        SizedBox(
          height: 16.h,
        ),
        Text(
          "What are the main reason for your rating?",
          style: AppFontStyle.semiboldTextStyle(AppColors.textColor, 16.sp),
        ),
        SizedBox(
          height: 10.h,
        ),
        textBox(),
        SizedBox(
          height: 16.h,
        ),
        buttons()
      ],
    );
  }

  Widget faces() {
    return Row(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            width: 65.w,
            height: 60.h,
            decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                      color: AppColors.black.withOpacity(0.15),
                      offset: Offset(0.w, 2.h),
                      blurRadius: 6.r,
                      spreadRadius: 0)
                ],
                borderRadius: BorderRadius.all(Radius.circular(6.r))),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SvgPicture.asset(
                  //   "assets/test.svg",
                  //   width: 20.w,
                  //   height: 21.h,
                  // ),

                  Image.asset(
                    "assets/Bitmap.jpg",
                    height: 24.h,
                    width: 24.w,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "Terrible",
                    style: AppFontStyle.regularTextStyle(
                        AppColors.textColor, 12.sp),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: 4.w,
        ),
        InkWell(
          onTap: () {},
          child: Container(
            width: 65.w,
            height: 60.h,
            decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                      color: AppColors.black.withOpacity(0.15),
                      offset: Offset(0.w, 2.h),
                      blurRadius: 6.r,
                      spreadRadius: 0)
                ],
                borderRadius: BorderRadius.all(Radius.circular(6.r))),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SvgPicture.asset(
                  //   "assets/test.svg",
                  //   width: 20.w,
                  //   height: 21.h,
                  // ),

                  Image.asset(
                    "assets/Bitmap.jpg",
                    height: 24.h,
                    width: 24.w,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "Good",
                    style: AppFontStyle.regularTextStyle(
                        AppColors.textColor, 12.sp),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: 4.w,
        ),
        InkWell(
          onTap: () {},
          child: Container(
            width: 65.w,
            height: 60.h,
            decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                      color: AppColors.black.withOpacity(0.15),
                      offset: Offset(0.w, 2.h),
                      blurRadius: 6.r,
                      spreadRadius: 0)
                ],
                borderRadius: BorderRadius.all(Radius.circular(6.r))),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SvgPicture.asset(
                  //   "assets/test.svg",
                  //   width: 20.w,
                  //   height: 21.h,
                  // ),

                  Image.asset(
                    "assets/Bitmap.jpg",
                    height: 24.h,
                    width: 24.w,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "Amazing",
                    style: AppFontStyle.regularTextStyle(
                        AppColors.textColor, 12.sp),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: 4.w,
        ),
        InkWell(
          onTap: () {},
          child: Container(
            width: 65.w,
            height: 60.h,
            decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                      color: AppColors.black.withOpacity(0.15),
                      offset: Offset(0.w, 2.h),
                      blurRadius: 6.r,
                      spreadRadius: 0)
                ],
                borderRadius: BorderRadius.all(Radius.circular(6.r))),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SvgPicture.asset(
                  //   "assets/test.svg",
                  //   width: 20.w,
                  //   height: 21.h,
                  // ),

                  Image.asset(
                    "assets/Bitmap.jpg",
                    height: 24.h,
                    width: 24.w,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "Bad",
                    style: AppFontStyle.regularTextStyle(
                        AppColors.textColor, 12.sp),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: 4.w,
        ),
        InkWell(
          onTap: () {},
          child: Container(
            width: 65.w,
            height: 60.h,
            decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                      color: AppColors.black.withOpacity(0.15),
                      offset: Offset(0.w, 2.h),
                      blurRadius: 6.r,
                      spreadRadius: 0)
                ],
                borderRadius: BorderRadius.all(Radius.circular(6.r))),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SvgPicture.asset(
                  //   "assets/test.svg",
                  //   width: 20.w,
                  //   height: 21.h,
                  // ),

                  Image.asset(
                    "assets/Bitmap.jpg",
                    height: 24.h,
                    width: 24.w,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "Okay",
                    style: AppFontStyle.regularTextStyle(
                        AppColors.textColor, 12.sp),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget textBox() {
    return TextFormField(
      controller: controller,
      maxLength: 250,
      style: AppFontStyle.regularTextStyle(AppColors.textColor, 14.sp),
      maxLines: 6,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.white,
        hintText: "Write here...",
        hintStyle: AppFontStyle.regularTextStyle(AppColors.disableColor, 12.sp),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.hintColor)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.hintColor)),
      ),
      onChanged: (value) {
        setState(() {
          formFieldvalue = value;
        });
      },
    );
  }

  Widget buttons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(160.w, 50.h),
                  shadowColor: Colors.transparent,
                  surfaceTintColor: Colors.transparent,
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: AppColors.primaryColor),
                      borderRadius: BorderRadius.circular(6.r))),
              onPressed: () {},
              child: Text(
                "Cancel",
                style: AppFontStyle.semiboldTextStyle(
                    AppColors.primaryColor, 14.sp),
              )),
        ),
        SizedBox(
          width: 12.w,
        ),
        Expanded(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(160.w, 50.h),
                  shadowColor: Colors.transparent,
                  surfaceTintColor: Colors.transparent,
                  backgroundColor: formFieldvalue.isEmpty
                      ? AppColors.disableColor
                      : AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.r))),
              onPressed: () {},
              child: Text(
                "Submit",
                style: AppFontStyle.semiboldTextStyle(AppColors.white, 14.sp),
              )),
        ),
      ],
    );
  }
}
