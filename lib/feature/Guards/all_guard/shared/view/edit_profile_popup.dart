import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgt_owner/feature/Guards/all_guard/edit_guard_profile/view/edit_guard_profile.dart';
import 'package:sgt_owner/feature/Guards/all_guard/guard_attendance/view/guard_attendence.dart';
import 'package:sgt_owner/shared/widgets/custom_bottomsheet.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';

class EditProfilePopUP extends StatefulWidget {
  const EditProfilePopUP({super.key});

  @override
  State<EditProfilePopUP> createState() => _EditProfilePopUPState();
}

class _EditProfilePopUPState extends State<EditProfilePopUP> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(alignment: Alignment.centerRight),
        onPressed: () {
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
                        padding: EdgeInsets.only(top: 15.h, bottom: 16.h),
                        height: 48.h,
                        width: Get.width - 80.w,
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
                              'Edit Profile',
                              style: AppFontStyle.regularTextStyle(
                                  AppColors.textColor, 14.sp),
                            ),
                            IconButton(
                                style: IconButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    alignment: Alignment.centerRight),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Get.to(() => EditGuardProfile());
                                },
                                icon: Image.asset(
                                  "assets/profile.png",
                                  height: 20.h,
                                ))
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.only(top: 15.h, bottom: 16.h),
                        height: 48.h,
                        width: Get.width - 80.w,
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
                              'Change Password',
                              style: AppFontStyle.regularTextStyle(
                                  AppColors.textColor, 14.sp),
                            ),
                            IconButton(
                                padding: EdgeInsets.zero,
                                alignment: Alignment.centerRight,
                                onPressed: () {
                                  Navigator.pop(context);
                                  Get.toNamed("/PasswordPage");
                                },
                                icon: const Icon(
                                  Icons.password,
                                  color: AppColors.primaryColor,
                                ))
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.only(top: 15.h, bottom: 16.h),
                        height: 48.h,
                        width: Get.width - 80.w,
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
                              'Send Application',
                              style: AppFontStyle.regularTextStyle(
                                  AppColors.textColor, 14.sp),
                            ),
                            IconButton(
                                padding: EdgeInsets.zero,
                                alignment: Alignment.centerRight,
                                onPressed: () {
                                  Navigator.pop(context);
                                  _showDialogSendApp();
                                },
                                icon: Image.asset(
                                  "assets/send-app.png",
                                  height: 20.h,
                                ))
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.only(top: 15.h, bottom: 16.h),
                        height: 48.h,
                        width: Get.width - 80.w,
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
                              'Delete Guard Profile',
                              style: AppFontStyle.regularTextStyle(
                                  AppColors.textColor, 14.sp),
                            ),
                            IconButton(
                                style: IconButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  alignment: Alignment.centerRight,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                  _showDialogDeleteProfile();
                                },
                                icon: Icon(
                                  Icons.delete_outline,
                                  color: AppColors.primaryColor,
                                  size: 20.h,
                                ))
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.only(top: 15.h, bottom: 16.h),
                        height: 48.h,
                        width: Get.width - 80.w,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.transparent,
                              width: 1.w,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Guard Attendance',
                              style: AppFontStyle.regularTextStyle(
                                  AppColors.textColor, 14.sp),
                            ),
                            IconButton(
                                padding: EdgeInsets.zero,
                                alignment: Alignment.centerRight,
                                onPressed: () {
                                  Navigator.pop(context);
                                  Get.to(() => GuardAttendance());
                                },
                                icon: Icon(
                                  Icons.calendar_today,
                                  color: AppColors.primaryColor,
                                  size: 18.h,
                                ))
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.only(top: 15.h, bottom: 16.h),
                        height: 20.h,
                        width: Get.width - 80.w,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: AppColors.grayColor,
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
        child: Image.asset(
          "assets/Vector-1.png",
          width: 2.5.w,
          height: 12.5.h,
        ));
  }

  Future _showDialogSendApp() async {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            insetPadding: EdgeInsets.all(8.h),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(6.r)),
              height: 263.h,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/send.png',
                      height: 160.h,
                      width: 160.w,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "Application Link sent to guard Registered Email & Phone Number.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Future _showDialogDeleteProfile() async {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            insetPadding: EdgeInsets.all(15.h),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(6.r)),
              height: 150.h,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Are you sure you want to delete this Guard?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 35.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                fixedSize: Size(127.w, 35.h),
                                side: const BorderSide(
                                    color: AppColors.primaryColor),
                                surfaceTintColor: AppColors.white,
                                backgroundColor: AppColors.white,
                                foregroundColor: AppColors.primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.r))),
                            onPressed: () {},
                            child: Text(
                              "Delete",
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.w600),
                            )),
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                minimumSize: Size(130.w, 35.h),
                                side: const BorderSide(
                                    color: AppColors.primaryColor),
                                surfaceTintColor: AppColors.white,
                                backgroundColor: AppColors.primaryColor,
                                foregroundColor: AppColors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.r))),
                            onPressed: () {},
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.w600),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  
}
