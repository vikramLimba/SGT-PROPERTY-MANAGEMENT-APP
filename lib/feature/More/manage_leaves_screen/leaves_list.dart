import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgt_owner/feature/More/manage_leaves_screen/leaves_list_modal.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';

class LeavesList extends StatefulWidget {
  const LeavesList({super.key});

  @override
  State<LeavesList> createState() => _LeavesListState();
}

class _LeavesListState extends State<LeavesList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: leavedummyModalData.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:EdgeInsets.all(8.w),
            child: Container(
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
              margin: EdgeInsets.all(2),
              child: Padding(
                padding:  EdgeInsets.all(8),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.toNamed("/requested_leave_screen");
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(93.r),
                                  child: Image.asset(
                                    leavedummyModalData[index].image.toString(),
                                    fit: BoxFit.fill,
                                    width: 54.w,
                                    height: 54.h,
                                  )),
                              SizedBox(
                                width: 10.w,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    leavedummyModalData[index].name.toString(),
                                    style: AppFontStyle.semiboldTextStyle(
                                        AppColors.primaryColor, 16.sp),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Subject: ",
                                        style: AppFontStyle.semiboldTextStyle(
                                            AppColors.textColor, 14.sp),
                                      ),
                                      Text(
                                        leavedummyModalData[index].subject.toString(),
                                        style: AppFontStyle.semiboldTextStyle(
                                            AppColors.primaryColor, 14.sp),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Requested Date: ",
                                        style: AppFontStyle.semiboldTextStyle(
                                            AppColors.textColor, 14.sp),
                                      ),
                                      Text(
                                        leavedummyModalData[index].requestedDate.toString(),
                                        style: AppFontStyle.semiboldTextStyle(
                                            AppColors.primaryColor, 14.sp),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Status: ",
                                        style: AppFontStyle.semiboldTextStyle(
                                            AppColors.textColor, 14.sp),
                                      ),
                                      Text(
                                        leavedummyModalData[index].status.toString(),
                                        style: AppFontStyle.semiboldTextStyle(
                                            AppColors.primaryColor, 14.sp),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
