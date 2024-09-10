import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgt_owner/feature/Properties/property_view_carousal.dart';
import 'package:sgt_owner/shared/widgets/custom_appbar.dart';
import 'package:sgt_owner/shared/widgets/custom_buttons.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';

class RouteDetailScreen extends StatefulWidget {
  const RouteDetailScreen({super.key});

  @override
  State<RouteDetailScreen> createState() => _RouteDetailScreenState();
}

class _RouteDetailScreenState extends State<RouteDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        titleText: 'Radission Blu Hotel',
        isLeading: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(children: [
          SizedBox(
            height: 16.h,
          ),
          const PropertyCarousal(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
            child: const Divider(
              color: AppColors.disableColor,
            ),
          ),
          Container(
              width: Get.width - 32.w,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Route Name",
                      style: AppFontStyle.semiboldTextStyle(
                          AppColors.textColor, 16.sp),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Shift Name:",
                              style: AppFontStyle.mediumTextStyle(
                                  AppColors.primaryColor, 12.sp),
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            Text(
                              "Hallway shift 1",
                              style: AppFontStyle.mediumTextStyle(
                                  AppColors.textColor, 12.sp),
                            ),
                          ],
                        ),
                        Text(
                          "10/06/23",
                          style: AppFontStyle.mediumTextStyle(
                              AppColors.textColor, 12.sp),
                        ),
                      ],
                    ),
                  ])),
          SizedBox(
            height: 8.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
            child: const Divider(
              color: AppColors.disableColor,
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 12.w),
                  child: Text(
                    "Start",
                    style:
                        AppFontStyle.boldTextStyle(AppColors.textColor, 12.sp),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 26.h),
                      child: Container(
                        height: 83.h * 6,
                        width: 45.w,
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 6,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  index == 3
                                      ? Container(
                                          margin: EdgeInsets.only(
                                              top: 10.h, bottom: 3.h),
                                          padding: EdgeInsets.all(3.w),
                                          decoration: BoxDecoration(
                                              color: AppColors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color:
                                                      AppColors.secondaryColor,
                                                  offset: Offset(0, 0),
                                                  blurRadius: 10.r,
                                                  spreadRadius: 4.r,
                                                ),
                                              ],
                                              border: Border.all(
                                                  color: AppColors.primaryColor,
                                                  width: 2.w),
                                              borderRadius:
                                                  BorderRadius.circular(50.r)),
                                          child: Container(
                                            height: 8.h,
                                            width: 8.w,
                                            decoration: BoxDecoration(
                                                color: AppColors.primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        50.r)),
                                          ),
                                        )
                                      : Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'CP${index + 1}',
                                              style:
                                                  AppFontStyle.mediumTextStyle(
                                                      AppColors.textColor,
                                                      8.sp),
                                            ),
                                            Container(
                                              height: 8.h,
                                              width: 8.w,
                                              margin: EdgeInsets.all(7.r),
                                              decoration: BoxDecoration(
                                                  color:
                                                      AppColors.secondaryColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50.r)),
                                            ),
                                          ],
                                        ),
                                  index == 5
                                      ? Container()
                                      : Container(
                                          height: 60.h,
                                          child: VerticalDivider(
                                            color: AppColors.primaryColor,
                                            thickness: 2.w,
                                          ))
                                ],
                              );
                            }),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 81.h * 6,
                        // width: 100,
                        // color: Colors.amber,
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 6,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {},
                                child: Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.8.w,
                                      height: 80.h,
                                      // margin: EdgeInsets.only(right: 20),
                                      alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.only(bottom: 5.h),
                                      decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10.r),
                                          topRight: Radius.circular(10.r),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            // mainAxisSize: MainAxisSize.min,
                                            // crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                'assets/QR_Sample.png',
                                                width: 30.w,
                                                fit: BoxFit.contain,
                                              ),
                                              Column(
                                                // mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Radission Blu Hotel 1',
                                                    style: AppFontStyle
                                                        .mediumTextStyle(
                                                            AppColors
                                                                .primaryColor,
                                                            13.sp),
                                                  ),
                                                  SizedBox(height: 5.h),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Check-in: ',
                                                        style: AppFontStyle
                                                            .semiboldTextStyle(
                                                                AppColors
                                                                    .textColor,
                                                                10.sp),
                                                      ),
                                                      Text(
                                                        '11:00 AM',
                                                        style: AppFontStyle
                                                            .semiboldTextStyle(
                                                                AppColors
                                                                    .greenColor,
                                                                10.sp),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                          Text(
                                            'Completed',
                                            style: AppFontStyle.boldTextStyle(
                                                AppColors.greenColor, 16.sp),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // SizedBox(
                                    //   width:
                                    //       MediaQuery.of(context).size.width,
                                    //   child: Divider(
                                    //     height: 0,
                                    //     color: AppColors.secondaryColor,
                                    //     thickness: 2.h,
                                    //   ),
                                    // )
                                  ],
                                ),
                              );
                            }),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: Get.width - 32.w,
            child: Column(
              children: [
                Container(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: AppButton(
                        onTaps: () {
                          Get.toNamed('/edit_route');
                        },
                        backgoundColor: AppColors.primaryColor,
                        textColor: AppColors.white,
                        titleText: "Edit Route"),
                  ),
                ),
              
                Container(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 16.h),
                    child: AppButton(
                      onTaps: () {},
                      backgoundColor: AppColors.white,
                      textColor: AppColors.primaryColor,
                      titleText: 'Download all checkpoint QR',
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
        ]),
      ),
    );
  }
}
