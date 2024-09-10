import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgt_owner/shared/widgets/custom_appbar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';

class StarredMessegedScreen extends StatefulWidget {
  const StarredMessegedScreen({super.key});

  @override
  State<StarredMessegedScreen> createState() => _StarredMessegedScreenState();
}

class _StarredMessegedScreenState extends State<StarredMessegedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          titleText: 'Starred Messages',
          isLeading: true,
        ),
        body:

            // Container(
            //   height: 650.h,
            //   width: double.infinity,
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     crossAxisAlignment:CrossAxisAlignment.center,
            //     children: [
            //       SvgPicture.asset(
            //         "assets/no_starred_message.svg",
            //         width: 165.w,
            //         height: 160.h,
            //       ),
            //       SizedBox(
            //         height: 16.h,
            //       ),
            //       Text(
            //         "No Starred Messages",
            //         style: AppFontStyle.boldTextStyle(AppColors.primaryColor, 18.sp),
            //       ),
            //       SizedBox(
            //         height: 8.h,
            //       ),
            //       Container(
            //         width: 250.w,
            //         child: Text(
            //           "Hold any message to star it, so you can easily find it later.",
            //           textAlign: TextAlign.center,
            //           style: AppFontStyle.regularTextStyle(AppColors.grayColor, 14.sp),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Sam Jackson',
                      style: AppFontStyle.semiboldTextStyle(
                          AppColors.textColor, 16.sp)),
                  Text('12:00 PM',
                      style: AppFontStyle.mediumTextStyle(
                          AppColors.grayColor, 12.sp)),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                width: 148.w,
                padding: EdgeInsets.all(6.w),
                decoration: BoxDecoration(
                    color: AppColors.grayColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5.r),
                      topRight: Radius.circular(5.r),
                      bottomRight: Radius.circular(5.r),
                    )),
                child: Text('Hey how are you?',
                    style:
                        AppFontStyle.mediumTextStyle(AppColors.white, 12.sp)),
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('You',
                      style: AppFontStyle.semiboldTextStyle(
                          AppColors.textColor, 16.sp)),
                  Text('12:05 PM',
                      style: AppFontStyle.mediumTextStyle(
                          AppColors.grayColor, 12.sp)),
                ],
              ),
               SizedBox(
                height: 16.h,
              ),
              InkWell(
                onLongPress: () {
                  Get.dialog(
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 32.h),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.r),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Material(
                                child: Column(
                                  children: [
                                    Text(
                                      "Are you sure you want to delete this selection?",
                                      textAlign: TextAlign.center,
                                      style: AppFontStyle.mediumTextStyle(
                                          AppColors.textColor, 14.sp),
                                    ),
                                    SizedBox(height: 20.h),
                                    //Buttons
                                    Row(
                                      children: [
                                        Expanded(
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                minimumSize: Size(0, 35.h),
                                                backgroundColor:
                                                    AppColors.white,
                                                foregroundColor:
                                                    AppColors.primaryColor,
                                                textStyle: AppFontStyle
                                                    .semiboldTextStyle(
                                                        AppColors.primaryColor,
                                                        16.sp),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6.r),
                                                  side: BorderSide(
                                                    color:
                                                        AppColors.primaryColor,
                                                    width: 1.0.w,
                                                  ),
                                                )),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                              // Get.back();
                                            },
                                            child: const Text(
                                              'Delete',
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10.w),
                                        Expanded(
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              minimumSize: Size(0, 35.h),
                                              backgroundColor:
                                                  AppColors.primaryColor,
                                              textStyle: AppFontStyle
                                                  .semiboldTextStyle(
                                                      AppColors.white, 16.sp),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(6.r),
                                              ),
                                            ),
                                            onPressed: () {
                                              Get.back();
                                            },
                                            child: const Text(
                                              'Cancel',
                                              style: TextStyle(
                                                  color: AppColors.white),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                child: SvgPicture.asset(
                  "assets/guard_oversize.svg",
                  height: 170.h,
                ),
              ),
            ],
          ),
        ));
  }
}
