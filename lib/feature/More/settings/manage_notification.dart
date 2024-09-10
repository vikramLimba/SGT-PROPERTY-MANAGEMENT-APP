import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgt_owner/shared/widgets/custom_appbar.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';

class ManageNotifications extends StatefulWidget {
  const ManageNotifications({super.key});

  @override
  State<ManageNotifications> createState() => _ManageNotificationsState();
}

class _ManageNotificationsState extends State<ManageNotifications> {
  bool check = true;
  List<Map<dynamic, dynamic>> tiles = [
    {"checked": true, "title": "Message"},
    {"checked": true, "title": "Reports"},
    {"checked": false, "title": "General Feed"},
    {"checked": false, "title": "Shift Completion"},
    {"checked": true, "title": "Clock In/Out Notifications"},
    {"checked": false, "title": "Properties Creation"},
    {"checked": true, "title": "Guard Misses Shift"},
    {"checked": true, "title": "Route Changed"},
    {"checked": false, "title": "Shift Deleted"},
    {"checked": true, "title": "Leave Approved"},
    {"checked": true, "title": "Checkpoint Deleted"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        titleText: "Manage Notifications",
        isLeading: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.white, borderRadius: BorderRadius.circular(6.r)),
          child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: tiles.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SwitchListTile.adaptive(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 5.h),
                        activeColor: AppColors.primaryColor,
                        title: Text(
                          tiles[index]["title"],
                          style: AppFontStyle.mediumTextStyle(
                              AppColors.textColor, 16.sp),
                        ),
                        value: tiles[index]["checked"],
                        onChanged: (value) {
                          setState(() {
                            tiles[index]["checked"] = !tiles[index]["checked"];
                          });
                        }),
                    Divider(
                      height: 0,
                      thickness: 1.w,
                      color: AppColors.disableColor,
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}
