import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgt_owner/feature/More/manage_leaves_screen/leaves_list.dart';
import 'package:sgt_owner/shared/widgets/custom_bottomsheet.dart';
import 'package:sgt_owner/style/colors.dart';
import '../../../style/font_style.dart';

class LeaveListingScreen extends StatefulWidget {
  const LeaveListingScreen({super.key});

  @override
  State<LeaveListingScreen> createState() => _LeaveListingScreenState();
}

class _LeaveListingScreenState extends State<LeaveListingScreen> {
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
              "Manage Leaves",
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 16.h, bottom: 8.h),
                width: Get.width - 32.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "All Requests",
                      style: AppFontStyle.semiboldTextStyle(
                          AppColors.textColor, 16.sp),
                    ),
                    const FilterOptions(),
                  ],
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
               SizedBox(
                height: Get.height,
                child: 
                LeavesList()),
            ],
          ),
        ));
  }
}

class FilterOptions extends StatelessWidget {
  const FilterOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
                    height: 20.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      // Get.toNamed('/route_detail_screen');
                    },
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.only(top: 15.h, bottom: 16.h),
                        height: 48.h,
                        width: Get.width - 80,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: AppColors.grayColor,
                              width: 1,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Total Leaves',
                                  style: AppFontStyle.regularTextStyle(
                                      AppColors.textColor, 14.sp),
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                                Text(
                                  '(20)',
                                  style: AppFontStyle.semiboldTextStyle(
                                      AppColors.grayColor, 14.sp),
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.format_list_numbered,
                              color: AppColors.primaryColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Get.toNamed('/route_map_with_checkpoint_screen');
                    },
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.only(top: 15.h, bottom: 16.h),
                        height: 48.h,
                        width: Get.width - 80,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: AppColors.grayColor,
                              width: 1.w,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Approved Leaves',
                                  style: AppFontStyle.regularTextStyle(
                                      AppColors.textColor, 14.sp),
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                                Text(
                                  '(08)',
                                  style: AppFontStyle.semiboldTextStyle(
                                      AppColors.grayColor, 14.sp),
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.check_circle,
                              color: AppColors.primaryColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.only(top: 15.h, bottom: 16.h),
                        height: 48.h,
                        width: Get.width - 80,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: AppColors.grayColor,
                              width: 1.w,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Rejected Leaves',
                                  style: AppFontStyle.regularTextStyle(
                                      AppColors.textColor, 14.sp),
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                                Text(
                                  '(06)',
                                  style: AppFontStyle.semiboldTextStyle(
                                      AppColors.grayColor, 14.sp),
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.block,
                              color: AppColors.primaryColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.only(top: 15.h, bottom: 16.h),
                        height: 48.h,
                        width: Get.width - 80,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: AppColors.grayColor,
                              width: 1.w,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Pending Leaves',
                                  style: AppFontStyle.regularTextStyle(
                                      AppColors.textColor, 14.sp),
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                                Text(
                                  '(06)',
                                  style: AppFontStyle.semiboldTextStyle(
                                      AppColors.grayColor, 14.sp),
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.schedule,
                              color: AppColors.primaryColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Get.toNamed('LeavePolicyScreen');
                    },
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.only(top: 15.h, bottom: 16.h),
                        height: 48.h,
                        width: Get.width - 80,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: AppColors.grayColor,
                              width: 1.w,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Leave Policy',
                              style: AppFontStyle.regularTextStyle(
                                  AppColors.textColor, 14.sp),
                            ),
                            const Icon(
                              Icons.description,
                              color: AppColors.primaryColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.only(top: 4.h, bottom: 4.h),
                      height: 48.h,
                      width: Get.width - 80.w,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: AppColors.secondaryColor,
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
      child: Row(
        children: [
          Text(
            "Filter",
            style: AppFontStyle.boldTextStyle(AppColors.primaryColor, 16.sp),
          ),
          const Icon(
            Icons.expand_more,
            color: AppColors.primaryColor,
          ),
        ],
      ),
    );
  }
}
