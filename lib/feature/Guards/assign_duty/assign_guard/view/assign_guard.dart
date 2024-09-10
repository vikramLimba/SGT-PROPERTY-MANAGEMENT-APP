import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgt_owner/feature/Guards/assign_duty/guards/view/guards_page.dart';
import 'package:sgt_owner/feature/Guards/assign_duty/shared/view/assignDuty_progress_bar.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';

class AssignGuard extends StatefulWidget {
  const AssignGuard({super.key});

  @override
  State<AssignGuard> createState() => _AssignGuardState();
}

class _AssignGuardState extends State<AssignGuard> {
  Widget selectedGuardsCard = Get.arguments["selectedGuardsCard"];
  Widget selectedPropertyCard = Get.arguments["selectedPropertyCard"];
  Widget selectedRoutesCard = Get.arguments["selectedRoutesCard"];

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: AppColors.white,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 8.h),
                    child: const AssignDutyProgrssBar(currentIndex: 2),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Selected Guard',
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                        height: 19.h,
                        child: TextButton(
                            style:
                                TextButton.styleFrom(padding: EdgeInsets.zero),
                            onPressed: () {
                              Get.to(() => const GuardsPage());
                            },
                            child: Text(
                              "Change Guard",
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500),
                            )))
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                Container(
                  child: selectedGuardsCard,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Selected Property',
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                        height: 19.h,
                        child: TextButton(
                            style:
                                TextButton.styleFrom(padding: EdgeInsets.zero),
                            onPressed: () {
                              Get.back();
                              // Get.toNamed(
                              //   '/PropertiesPage',
                              // );
                            },
                            child: Text(
                              "Change Property",
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500),
                            ))),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                Container(
                  child: selectedPropertyCard,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Selected Routes',
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                        height: 19.h,
                        child: TextButton(
                            style:
                                TextButton.styleFrom(padding: EdgeInsets.zero),
                            onPressed: () {
                              Get.back();
                            },
                            child: Text(
                              "Change Route",
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500),
                            ))),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                Container(child: selectedRoutesCard),
                SizedBox(
                  height: 85.h,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 10.h),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        foregroundColor: AppColors.white,
                        minimumSize: Size(double.maxFinite, 47.h),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.r))),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              insetPadding:
                                  EdgeInsets.symmetric(horizontal: 16.w),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(5.r)),
                                width: double.maxFinite,
                                height: 310.h,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // SizedBox(
                                    //   height: 52.h,
                                    // ),
                                    Image.asset(
                                      "assets/ang-1.png",
                                      height: 150.h,
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Text(
                                      "Duty Assigned successfully!",
                                      style: TextStyle(
                                          color: AppColors.primaryColor,
                                          fontSize: 17.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 12.h,
                                    ),
                                    SizedBox(
                                        width: 160.w,
                                        height: 35.h,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                padding: EdgeInsets.zero,
                                                backgroundColor:
                                                    AppColors.primaryColor,
                                                foregroundColor:
                                                    AppColors.white,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6.r))),
                                            onPressed: () {
                                              Get.toNamed('/add_guard_screen');
                                            },
                                            child: Text(
                                              "Back to dashboard",
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w600),
                                            )))
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    child: Text(
                      "Assign Guard",
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w600),
                    )),
              ),
            ),
          ],
        ),
    );
  }
}
