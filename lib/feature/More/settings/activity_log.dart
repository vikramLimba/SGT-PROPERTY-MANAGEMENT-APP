import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgt_owner/shared/widgets/custom_appbar.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';

class ActivityLog extends StatefulWidget {
  const ActivityLog({super.key});

  @override
  State<ActivityLog> createState() => _ActivityLogState();
}

class _ActivityLogState extends State<ActivityLog> {
  bool isClear = false;

  List activityData = [
    {
      "date": "Today",
      "time1": "Just Now",
      "time2": "12 Min ago",
      "time3": "30 Min ago"
    },
    {
      "date": "Saturday, 16 Aug, 2023",
      "time1": "12:30 PM",
      "time2": "01:00 AM",
      "time3": "02:00 PM"
    },
    {
      "date": "Saturday, 16 Aug, 2023",
      "time1": "12:30 PM",
      "time2": "01:00 AM",
      "time3": "02:00 PM"
    },
    {
      "date": "Saturday, 16 Aug, 2023",
      "time1": "12:30 PM",
      "time2": "01:00 AM",
      "time3": "02:00 PM"
    },
    {
      "date": "Saturday, 16 Aug, 2023",
      "time1": "12:30 PM",
      "time2": "01:00 AM",
      "time3": "02:00 PM"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        titleText: "Acivity Log",
        isLeading: true,
      ),
      body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(16.h),
          child: isClear ? emptyScreen() : activityLog()),
    );
  }

  Widget activityLog() {
    return Stack(
      children: [
        ListView.builder(
            shrinkWrap: true,
            itemCount: activityData.length,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    activityData[index]["date"],
                    style: AppFontStyle.mediumTextStyle(
                        AppColors.secondaryColor, 14.sp),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(6.r)),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Image.asset(
                            "assets/guard_1.png",
                            height: 32.h,
                            width: 32.w,
                          ),
                          title: RichText(
                            text: TextSpan(
                                text: "Role Name, Created",
                                style: TextStyle(
                                    color: AppColors.textColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    overflow: TextOverflow.ellipsis),
                                // AppFontStyle.mediumTextStyle(
                                //     AppColors.textColor, 14.sp),
                                children: [
                                  TextSpan(
                                    text: " Radission Blu Hotel",
                                    style: AppFontStyle.mediumTextStyle(
                                        AppColors.primaryColor, 14.sp),
                                  )
                                ]),
                          ),
                          subtitle: Text(
                            activityData[index]["time1"],
                            style: AppFontStyle.mediumTextStyle(
                                AppColors.secondaryColor, 14.sp),
                          ),
                        ),
                        ListTile(
                          leading: Image.asset(
                            "assets/guard_1.png",
                            height: 32.h,
                            width: 32.w,
                          ),
                          title: RichText(
                            text: TextSpan(
                                text: "Role Name, Created",
                                style: TextStyle(
                                    color: AppColors.textColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    overflow: TextOverflow.ellipsis),
                                // AppFontStyle.mediumTextStyle(
                                //     AppColors.textColor, 14.sp),
                                children: [
                                  TextSpan(
                                    text: " Biverly Hills",
                                    style: AppFontStyle.mediumTextStyle(
                                        AppColors.primaryColor, 14.sp),
                                  )
                                ]),
                          ),
                          subtitle: Text(
                            activityData[index]["time2"],
                            style: AppFontStyle.mediumTextStyle(
                                AppColors.secondaryColor, 14.sp),
                          ),
                        ),
                        ListTile(
                          leading: Image.asset(
                            "assets/guard_1.png",
                            height: 32.h,
                            width: 32.w,
                          ),
                          title: RichText(
                            text: TextSpan(
                                text: "Role Name, Created",
                                style: TextStyle(
                                    color: AppColors.textColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    overflow: TextOverflow.ellipsis),
                                // AppFontStyle.mediumTextStyle(
                                //     AppColors.textColor, 14.sp),
                                children: [
                                  TextSpan(
                                    text: "  White House",
                                    style: AppFontStyle.mediumTextStyle(
                                        AppColors.primaryColor, 14.sp),
                                  )
                                ]),
                          ),
                          subtitle: Text(
                            activityData[index]["time3"],
                            style: AppFontStyle.mediumTextStyle(
                                AppColors.secondaryColor, 14.sp),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  )
                ],
              );
            }),
        Positioned(
            right: 0,
            child: InkWell(
              onTap: () {
                deletePopup();
              },
              child: Text(
                "Clear",
                style: AppFontStyle.semiboldTextStyle(
                    AppColors.secondaryColor, 14.sp),
              ),
            ))
      ],
    );
  }

  Future deletePopup() {
    return Get.dialog(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
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
                        "Are you sure you want to delete this profile picture ?",
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
                                  shadowColor: Colors.transparent,
                                  minimumSize: Size(0, 35.h),
                                  backgroundColor: AppColors.white,
                                  foregroundColor: AppColors.primaryColor,
                                  textStyle: AppFontStyle.semiboldTextStyle(
                                      AppColors.primaryColor, 16.sp),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.r),
                                    side: BorderSide(
                                      color: AppColors.primaryColor,
                                      width: 1.0.w,
                                    ),
                                  )),
                              onPressed: () {
                                setState(() {
                                  isClear = true;
                                });
                                Get.back();
                              },
                              child: const Text(
                                'Yes',
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shadowColor: Colors.transparent,
                                minimumSize: Size(0, 35.h),
                                backgroundColor: AppColors.primaryColor,
                                textStyle: AppFontStyle.semiboldTextStyle(
                                    AppColors.white, 16.sp),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.r),
                                ),
                              ),
                              onPressed: () {
                                Get.back();
                              },
                              child: Text(
                                'No',
                                style: AppFontStyle.semiboldTextStyle(
                                    AppColors.white, 16.sp),
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
  }

  Widget emptyScreen() {
    return SizedBox(
      height: 600.h,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/activity-log.png",
            height: 130.h,
            width: 130.w,
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            'No Activity logs',
            style: AppFontStyle.boldTextStyle(AppColors.primaryColor, 18.sp),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            'Activities will appear here',
            style:
                AppFontStyle.mediumTextStyle(AppColors.secondaryColor, 16.sp),
          ),
        ],
      ),
    );
  }
}
