import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgt_owner/feature/More/settings/activity_log.dart';
import 'package:sgt_owner/feature/More/settings/billing_and_invoice.dart';
import 'package:sgt_owner/feature/More/settings/feedback.dart';
import 'package:sgt_owner/feature/More/settings/manage_notification.dart';
import 'package:sgt_owner/feature/More/settings/plans.dart';
import 'package:sgt_owner/feature/More/settings/send_application/view/send_application.dart';
import 'package:sgt_owner/feature/authentication/Privacy_policy/privacy_policy.dart';
import 'package:sgt_owner/feature/authentication/Privacy_policy/terms_and_conditions.dart';
import 'package:sgt_owner/shared/widgets/custom_buttons.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';
import 'package:flutter_svg/svg.dart';

class MoreTabScreen extends StatefulWidget {
  const MoreTabScreen({super.key});

  @override
  State<MoreTabScreen> createState() => _MoreTabScreenState();
}

class _MoreTabScreenState extends State<MoreTabScreen> {
  bool expanded = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        // color: AppColors.white,
        width: Get.width,
        child: Column(
          children: [
            SizedBox(
              height: 16.h,
            ),
            Container(
              width: Get.width - 32.w,
              decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(8.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(93.r),
                            child: Image.asset(
                              "assets/user.png",
                              fit: BoxFit.fill,
                              width: 54.w,
                              height: 54.h,
                            )),
                        SizedBox(
                          width: 8.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "John Michael",
                                  style: AppFontStyle.semiboldTextStyle(
                                      AppColors.primaryColor, 20.sp),
                                ),
                                SizedBox(
                                  width: 100.w,
                                ),
                                Image.asset(
                                  'assets/edit.png',
                                  width: 24.w,
                                  height: 21.h,
                                  fit: BoxFit.contain,
                                ),
                              ],
                            ),
                            Text(
                              "+01 953 2556 226",
                              style: AppFontStyle.mediumTextStyle(
                                  AppColors.textColor, 14.sp),
                            ),
                            Text(
                              "jonmichael@gmail.com",
                              style: AppFontStyle.mediumTextStyle(
                                  AppColors.textColor, 14.sp),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Container(
                      width: Get.width - 32.w,
                      child: const Divider(
                        color: AppColors.disableColor,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "O’Max Pvt. Ltd.",
                          style: AppFontStyle.semiboldTextStyle(
                              AppColors.primaryColor, 16.sp),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Lucknow",
                          style: AppFontStyle.mediumTextStyle(
                              AppColors.textColor, 14.sp),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 4.w, vertical: 2.h),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(5.r, 5.r)),
                            color: AppColors.primaryBackColor,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                "assets/silver_plan.png",
                                fit: BoxFit.fill,
                                width: 16.w,
                                height: 16.h,
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              Text(
                                "Silver",
                                style: AppFontStyle.semiboldTextStyle(
                                    AppColors.textColor, 14.sp),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 18.h,
            ),
            Container(
              width: Get.width - 32.w,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.all(Radius.elliptical(5.r, 5.r)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5.r,
                    blurRadius: 7.r,
                    offset: Offset(0.w, 3.h), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: 12.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed("/report_screen");
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/reports_vector.png",
                            fit: BoxFit.fill,
                            width: 20.w,
                            height: 20.h,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            "Reports",
                            style: AppFontStyle.mediumTextStyle(
                                AppColors.textColor, 16.sp),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    const Divider(
                      color: AppColors.disableColor,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed("/shift_screen");
                      },
                      child: Row(
                        children: [
                          const Icon(
                            Icons.business_center,
                            color: AppColors.grayColor,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            "Shifts",
                            style: AppFontStyle.mediumTextStyle(
                                AppColors.textColor, 16.sp),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    const Divider(
                      color: AppColors.disableColor,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed('/staff_screen');
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.group,
                            color: AppColors.grayColor,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            "Staff",
                            style: AppFontStyle.mediumTextStyle(
                                AppColors.textColor, 16.sp),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    const Divider(
                      color: AppColors.disableColor,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed("/checkpoint_listing_screen");
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/checkpoint_vector.png",
                            fit: BoxFit.fill,
                            width: 20.w,
                            height: 20.h,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            "Checkpoint",
                            style: AppFontStyle.mediumTextStyle(
                                AppColors.textColor, 16.sp),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    const Divider(
                      color: AppColors.disableColor,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed('/route_listing_screen');
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.cable,
                            color: AppColors.grayColor,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            "Routes",
                            style: AppFontStyle.mediumTextStyle(
                                AppColors.textColor, 16.sp),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    const Divider(
                      color: AppColors.disableColor,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed('/timesheet_totalallproperties_screen');
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.archive,
                            color: AppColors.grayColor,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            "Timesheet",
                            style: AppFontStyle.mediumTextStyle(
                                AppColors.textColor, 16.sp),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    const Divider(
                      color: AppColors.disableColor,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed('/leave_listing_screen');
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/edit_guard.svg",
                            width: 20.w,
                            height: 21.h,
                            color: AppColors.grayColor,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            "Manage Leaves",
                            style: AppFontStyle.mediumTextStyle(
                                AppColors.textColor, 16.sp),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    const Divider(
                      color: AppColors.disableColor,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed('/attendence_total_guards');
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.list_alt,
                            color: AppColors.grayColor,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            "Guard Attendance",
                            style: AppFontStyle.mediumTextStyle(
                                AppColors.textColor, 16.sp),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    const Divider(
                      color: AppColors.disableColor,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed('/roles_and_permission_screen');
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.category,
                            color: AppColors.grayColor,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            "Roles & Permission",
                            style: AppFontStyle.mediumTextStyle(
                                AppColors.textColor, 16.sp),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    const Divider(
                      color: AppColors.disableColor,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          expanded = !expanded;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.settings,
                                color: AppColors.grayColor,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                "Settings",
                                style: AppFontStyle.mediumTextStyle(
                                    AppColors.textColor, 16.sp),
                              ),
                            ],
                          ),
                          Icon(
                            expanded ? Icons.expand_less : Icons.expand_more,
                            color: AppColors.grayColor,
                          ),
                        ],
                      ),
                    ),
                    expanded ? hamburgerList() : Container(),
                    SizedBox(
                      height: 12.h,
                    ),
                    const Divider(
                      color: AppColors.disableColor,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    AppButton(
                        onTaps: () {},
                        backgoundColor: AppColors.primaryColor,
                        textColor: AppColors.white,
                        titleText: "Logout"),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(() => TermsAndConditions());
                          },
                          child: Text(
                            'Terms & Conditions | ',
                            style: AppFontStyle.semiboldTextStyle(
                                AppColors.primaryColor, 12.sp),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => PrivacyPolicy());
                          },
                          child: Text(
                            'Privacy Policy',
                            style: AppFontStyle.semiboldTextStyle(
                                AppColors.primaryColor, 12.sp),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
          ],
        ),
      ),
    );
  }

  hamburgerList() {
    return Column(children: [
      SizedBox(
        height: 12.h,
      ),
      const Divider(
        color: AppColors.disableColor,
      ),
      SizedBox(
        height: 24.h,
      ),
      InkWell(
        onTap: () {
          Get.to(() => ManageNotifications());
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.notifications_active,
                  color: AppColors.grayColor,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  "Manage Notifications",
                  style:
                      AppFontStyle.mediumTextStyle(AppColors.textColor, 16.sp),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.grayColor,
              size: 14.sp,
            ),
          ],
        ),
      ),
      SizedBox(
        height: 12.h,
      ),
      const Divider(
        color: AppColors.disableColor,
      ),
      SizedBox(
        height: 24.h,
      ),
      GestureDetector(
        onTap: () {
          Get.to(() => PlansPage());
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  "assets/plans.svg",
                  width: 20.w,
                  height: 21.h,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  "Plans",
                  style:
                      AppFontStyle.mediumTextStyle(AppColors.textColor, 16.sp),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.grayColor,
              size: 14.sp,
            ),
          ],
        ),
      ),
      SizedBox(
        height: 12.h,
      ),
      const Divider(
        color: AppColors.disableColor,
      ),
      SizedBox(
        height: 24.h,
      ),
      GestureDetector(
        onTap: () {
          Get.to(() => const BillingAndInvoice());
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  "assets/biiling_invoice.svg",
                  width: 20.w,
                  height: 21.h,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  "Billing & Invoice",
                  style:
                      AppFontStyle.mediumTextStyle(AppColors.textColor, 16.sp),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.grayColor,
              size: 14.sp,
            ),
          ],
        ),
      ),
      SizedBox(
        height: 12.h,
      ),
      const Divider(
        color: AppColors.disableColor,
      ),
      SizedBox(
        height: 24.h,
      ),
      GestureDetector(
        onTap: () {
          Get.to(() => const FeedbackPage());
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  "assets/feedback.svg",
                  width: 20.w,
                  height: 21.h,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  "Give Feedback",
                  style:
                      AppFontStyle.mediumTextStyle(AppColors.textColor, 16.sp),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.grayColor,
              size: 14.sp,
            ),
          ],
        ),
      ),
      SizedBox(
        height: 12.h,
      ),
      const Divider(
        color: AppColors.disableColor,
      ),
      SizedBox(
        height: 24.h,
      ),
      GestureDetector(
        onTap: () {
          Get.to(() => const SendApplication());
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  "assets/send_inclined.svg",
                  width: 20.w,
                  height: 21.h,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  "Send Application",
                  style:
                      AppFontStyle.mediumTextStyle(AppColors.textColor, 16.sp),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.grayColor,
              size: 14.sp,
            ),
          ],
        ),
      ),
      SizedBox(
        height: 12.h,
      ),
      const Divider(
        color: AppColors.disableColor,
      ),
      SizedBox(
        height: 24.h,
      ),
      GestureDetector(
        onTap: () {
          Get.to(() => ActivityLog());
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  "assets/activity.svg",
                  width: 20.w,
                  height: 21.h,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  "Activity Log",
                  style:
                      AppFontStyle.mediumTextStyle(AppColors.textColor, 16.sp),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.grayColor,
              size: 14.sp,
            ),
          ],
        ),
      ),
      SizedBox(
        height: 12.h,
      ),
      const Divider(
        color: AppColors.disableColor,
      ),
      SizedBox(
        height: 24.h,
      ),
      GestureDetector(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  "assets/help.svg",
                  width: 20.w,
                  height: 21.h,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  "Help & Others",
                  style:
                      AppFontStyle.mediumTextStyle(AppColors.textColor, 16.sp),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.grayColor,
              size: 14.sp,
            ),
          ],
        ),
      ),
    ]);
  }
}
