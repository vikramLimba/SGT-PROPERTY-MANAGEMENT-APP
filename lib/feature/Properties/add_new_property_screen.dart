// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:get/get.dart';
import 'package:sgt_owner/shared/widgets/custom_appbar.dart';
import 'package:sgt_owner/shared/widgets/custom_bottomsheet.dart';
import 'package:sgt_owner/shared/widgets/custom_buttons.dart';
import 'package:sgt_owner/shared/widgets/custom_progressbar.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';

class AddNewPropertyScreen extends StatefulWidget {
  const AddNewPropertyScreen({super.key});

  @override
  State<AddNewPropertyScreen> createState() => _AddNewPropertyScreenState();
}

class _AddNewPropertyScreenState extends State<AddNewPropertyScreen> {
  bool expand = false;
  bool expanded = true;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius:
                        BorderRadius.all(Radius.elliptical(10.r, 10.r))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/property.png',
                      width: 99.w,
                      height: 72.h,
                      fit: BoxFit.contain,
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed("/property_creation");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: AppColors.white),
                        padding: EdgeInsets.all(8.w),
                        child: Text(
                          '+ Add New Property',
                          style: AppFontStyle.semiboldTextStyle(
                              AppColors.primaryColor, 14.sp),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'Recently Added',
                style:
                    AppFontStyle.semiboldTextStyle(AppColors.textColor, 16.sp),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            carouselSlider(),
            SizedBox(
              height: 16.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'All Properties',
                    style: AppFontStyle.mediumTextStyle(
                        AppColors.textColor, 16.sp),
                  ),
                  Row(
                    children: [
                      Text(
                        'Filter',
                        style: AppFontStyle.mediumTextStyle(
                            AppColors.primaryColor, 16.sp),
                      ),
                      Stack(
                        children: [
                          Icon(
                            Icons.expand_more,
                            color: AppColors.primaryColor,
                          ),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: InkWell(
                                onTap: () {
                                  showModalBottomSheet<int>(
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) {
                                      return AppBottomSheet(
                                        child: Container(
                                          color: AppColors.white,
                                          child: Column(children: [
                                            SizedBox(
                                              height: 12.h,
                                            ),
                                            Center(
                                              child: Container(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Filters',
                                                      style: AppFontStyle
                                                          .semiboldTextStyle(
                                                              AppColors
                                                                  .primaryColor,
                                                              16.sp),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Center(
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                    top: 15.h, bottom: 16.h),
                                                height: 48.h,
                                                width: Get.width - 80.w,
                                                decoration: BoxDecoration(
                                                  border: Border(
                                                    bottom: BorderSide(
                                                      color:
                                                          AppColors.grayColor,
                                                      width: 1.w,
                                                    ),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Assign Properties',
                                                      style: AppFontStyle
                                                          .regularTextStyle(
                                                              AppColors
                                                                  .textColor,
                                                              14.sp),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Center(
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                    top: 15.h, bottom: 16.h),
                                                height: 48.h,
                                                width: Get.width - 80.w,
                                                decoration: BoxDecoration(
                                                  border: Border(
                                                    bottom: BorderSide(
                                                      color:
                                                          AppColors.grayColor,
                                                      width: 1.w,
                                                    ),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Unassign Properties',
                                                      style: AppFontStyle
                                                          .regularTextStyle(
                                                              AppColors
                                                                  .textColor,
                                                              14.sp),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Center(
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                    top: 15.h, bottom: 16.h),
                                                height: 48.h,
                                                width: Get.width - 80.w,
                                                decoration: BoxDecoration(
                                                  border: Border(
                                                    bottom: BorderSide(
                                                      color:
                                                          AppColors.grayColor,
                                                      width: 1.w,
                                                    ),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Recently Created',
                                                      style: AppFontStyle
                                                          .regularTextStyle(
                                                              AppColors
                                                                  .textColor,
                                                              14.sp),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Center(
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                    top: 15.h, bottom: 16.h),
                                                height: 48.h,
                                                width: Get.width - 80.w,
                                                decoration: BoxDecoration(
                                                  border: Border(
                                                    bottom: BorderSide(
                                                      color:
                                                          AppColors.grayColor,
                                                      width: 1.w,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ]),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.expand_more,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Container(
              width: Get.width - 32.w,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius:
                      BorderRadius.all(Radius.elliptical(10.r, 10.r))),
              margin: EdgeInsets.symmetric(horizontal: 12.w),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              child: Image.asset(
                                'assets/property_image.jpeg',
                                width: 120.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              width: 95.w,
                              height: 48.h,
                              color: Colors.black.withOpacity(0.3),
                              alignment: Alignment.center,
                              child: Text(
                                'Assigned',
                                style: AppFontStyle.mediumTextStyle(
                                    AppColors.white, 14.sp),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.only(left: 8.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Radission Blu Hotel',
                                style: AppFontStyle.semiboldTextStyle(
                                    AppColors.primaryColor, 16.sp),
                              ),
                              Text(
                                'Residential Property',
                                style: AppFontStyle.mediumTextStyle(
                                    AppColors.textColor, 12.sp),
                              ),
                              Text(
                                'This is a Property description: area where in person can write basic...',
                                style: AppFontStyle.regularTextStyle(
                                    AppColors.disableColor, 12.sp),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: AppColors.primaryColor,
                                      ),
                                      Text(
                                        'Lucknow...',
                                        style: AppFontStyle.regularTextStyle(
                                            AppColors.primaryColor, 12.sp),
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        expanded = !expanded;
                                      });
                                    },
                                    child: Icon(
                                      expanded
                                          ? Icons.expand_less
                                          : Icons.expand_more,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ))
                      ],
                    ),
                    expanded
                        ? Column(
                            children: [
                              SizedBox(
                                height: 16.h,
                              ),
                              MyProgressPage(currentIndex: 4),
                              SizedBox(
                                height: 12.h,
                              ),
                              SizedBox(
                                width: double.infinity,
                                height: 46.h,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.primaryColor,
                                        foregroundColor: AppColors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.r))),
                                    onPressed: () {
                                      Get.toNamed("/manage_property_screen");
                                      // print('Clicked');
                                    },
                                    child: Text(
                                      "Manage Property",
                                      style: AppFontStyle.semiboldTextStyle(
                                          AppColors.white, 16.sp),
                                    )),
                              ),
                            ],
                          )
                        : Container()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget carouselSlider() {
    return CarouselSlider(
      options: CarouselOptions(
          height: expand ? 280.h : 140.h,
          // aspectRatio: expand == true ? 1.3.h : 2.78.h,
          clipBehavior: Clip.none,
          viewportFraction: 1),
      items: [1, 2, 3, 4].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Card(
                color: AppColors.white,
                surfaceTintColor: AppColors.white,
                margin: EdgeInsets.zero,
                child: Column(
                  children: [
                    Card(
                      color: AppColors.white,
                      surfaceTintColor: AppColors.white,
                      margin: EdgeInsets.zero,
                      borderOnForeground: false,
                      clipBehavior: Clip.none,
                      child: Row(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5.r),
                                      bottomLeft: Radius.circular(5.r)),
                                  // image: DecorationImage(
                                  //     image: NetworkImage(
                                  //       'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
                                  //     ),
                                  //     fit: BoxFit.fill)
                                ),
                                child: Image.network(
                                  "https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg",
                                  height: 140.h,
                                  width: 120.w,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                width: 95.w,
                                height: 86.h,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.6),
                                    borderRadius: BorderRadius.circular(5.r)),
                                child: Text(
                                  'Create Shift',
                                  style: AppFontStyle.mediumTextStyle(
                                      AppColors.white, 14.sp),
                                ),
                              ),
                            ],
                          ),
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 8.w, top: 8.h, bottom: 8.h),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Radission Blu Hotel',
                                    style: AppFontStyle.semiboldTextStyle(
                                        AppColors.primaryColor, 16.sp),
                                  ),
                                  Text(
                                    'Residential Property',
                                    style: AppFontStyle.mediumTextStyle(
                                        AppColors.textColor, 12.sp),
                                  ),
                                  Text(
                                    'This is a Property description: area where in person can write basic...',
                                    softWrap: true,
                                    style: AppFontStyle.regularTextStyle(
                                        AppColors.secondaryColor, 12.sp),
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  SizedBox(
                                    // height: 15.h,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.location_on,
                                              color: AppColors.primaryColor,
                                            ),
                                            Text(
                                              'Lucknow...',
                                              style:
                                                  AppFontStyle.regularTextStyle(
                                                      AppColors.primaryColor,
                                                      12.sp),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 16.w),
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                expand = !expand;
                                              });
                                            },
                                            child: Icon(
                                              expand
                                                  ? Icons.expand_less
                                                  : Icons.expand_more,
                                              color: AppColors.primaryColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Visibility(
                      visible: expand,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 16.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MyProgressPage(currentIndex: 0),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 12.h, horizontal: 8.w),
                            child: Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              AppColors.primaryColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.r))),
                                      onPressed: () {},
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 14.h),
                                        child: Text(
                                          "Create shift & Assign Guard",
                                          style: AppFontStyle.semiboldTextStyle(
                                              AppColors.white, 16.sp),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
