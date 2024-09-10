import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgt_owner/shared/widgets/custom_appbar.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';
import 'package:flutter_svg/svg.dart';

class MessangerProfileDetailScreen extends StatefulWidget {
  const MessangerProfileDetailScreen({super.key});

  @override
  State<MessangerProfileDetailScreen> createState() =>
      _MessangerProfileDetailScreenState();
}

class _MessangerProfileDetailScreenState
    extends State<MessangerProfileDetailScreen> {
  final List<String> cardOption = [
    'Assigned Properties',
    'Shift Completed',
    'Total Leaves',
    'Missed Shifts',
  ];

  final List<String> cardOptionValues = [
    '05',
    '10',
    '03',
    '05',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: 'Profile',
        isLeading: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0.h),
        physics: const BouncingScrollPhysics(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          RichText(
              text: TextSpan(
                  text: "Creation Date: ",
                  style: AppFontStyle.boldTextStyle(AppColors.textColor, 12.sp),
                  children: [
                TextSpan(
                    text: "23/05/2023",
                    style: AppFontStyle.mediumTextStyle(
                        AppColors.textColor, 12.sp))
              ])),
          // SizedBox(
          //   height: 8.h,
          // ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 12.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.all(Radius.circular(6.r)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0.w, 3.h), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10.h,
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/guard_1.png",
                          width: 110.w,
                          height: 110.h,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          "Robinson",
                          style: TextStyle(
                              fontSize: 17.sp, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          "Available status",
                          style: TextStyle(
                              color: AppColors.greenColor,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          "Last Shift - 10:00AM - 08:00PM , 23/07/2023 ",
                          style: TextStyle(
                              color: AppColors.grayColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 8.w,
                    child: SvgPicture.asset(
                      "assets/edit_guard.svg",
                      width: 24.w,
                      height: 22.h,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            // height: 200.h,
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.w,
                mainAxisSpacing: 8.w,
                mainAxisExtent: 95.h, // here set custom Height You Want
              ),
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.all(Radius.circular(6.r)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cardOptionValues[index],
                          style: AppFontStyle.semiboldTextStyle(
                              AppColors.primaryColor, 20.sp),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          cardOption[index],
                          overflow: TextOverflow.ellipsis,
                          style: AppFontStyle.mediumTextStyle(
                              AppColors.secondaryColor, 14.sp),
                        ),
                      ],
                    ));
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 12.h),
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.all(Radius.circular(6.r)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 12.h,
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed('/shared_items');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/items.svg",
                            width: 24.w,
                            height: 24.h,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            "Shared Items",
                            style: AppFontStyle.mediumTextStyle(
                                AppColors.textColor, 16.sp),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.w),
                            child: Text(
                              "120",
                              style: AppFontStyle.semiboldTextStyle(
                                  AppColors.primaryColor, 14.sp),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: AppColors.primaryColor,
                            size: 16.sp,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: const Divider(
                    color: AppColors.disableColor,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed('starred_messages');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: AppColors.primaryColor,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            "Starred Messages",
                            style: AppFontStyle.mediumTextStyle(
                                AppColors.textColor, 16.sp),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.w),
                            child: Text(
                              "17",
                              style: AppFontStyle.semiboldTextStyle(
                                  AppColors.primaryColor, 14.sp),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: AppColors.primaryColor,
                            size: 16.sp,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: const Divider(
                    color: AppColors.disableColor,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.of(context).pop();
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
                                        "Are you sure you want to delete this chat?",
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
                                                          AppColors
                                                              .primaryColor,
                                                          16.sp),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6.r),
                                                    side: BorderSide(
                                                      color: AppColors
                                                          .primaryColor,
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
                                                      BorderRadius.circular(
                                                          6.r),
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
                  child: Row(
                    children: [
                      Icon(
                        Icons.delete,
                        color: AppColors.primaryColor,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        "Delete Chat",
                        style: AppFontStyle.mediumTextStyle(
                            AppColors.textColor, 16.sp),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 60.h,
          ),
        ]),
      ),
    );
  }
}
