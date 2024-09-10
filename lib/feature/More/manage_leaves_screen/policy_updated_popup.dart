import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sgt_owner/shared/widgets/custom_buttons.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';

class LeavePolicyUpdatedDialog extends StatefulWidget {
  String? status;
  LeavePolicyUpdatedDialog({super.key, this.status});

  @override
  State<LeavePolicyUpdatedDialog> createState() =>
      _LeavePolicyUpdatedDialogState();
}

class _LeavePolicyUpdatedDialogState extends State<LeavePolicyUpdatedDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(8.h),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(6.r)),
        height: 148.h,
        width: MediaQuery.of(context).size.width - 32.w,
        child: Padding(
          padding: EdgeInsets.all(8.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.status == 'update'
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: 60.w),
                      child: Text(
                        "Leave policy updated successfully?",
                        textAlign: TextAlign.center,
                        style: AppFontStyle.mediumTextStyle(
                            AppColors.primaryColor, 18.sp),
                      ),
                    )
                  : Text(
                      "Are you sure you want to delete this leave policy?",
                      textAlign: TextAlign.center,
                      style: AppFontStyle.mediumTextStyle(
                          AppColors.primaryColor, 18.sp),
                    ),
              SizedBox(height: 23.h),
              widget.status == 'update'
                  ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.r)),
                        fixedSize: Size.fromHeight(47.h),
                        foregroundColor: AppColors.white,
                        backgroundColor: AppColors.primaryColor,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        Get.offNamed('leave_listing_screen');
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 35.w, vertical: 8.h),
                        child: Text(
                          "Done",
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w600),
                        ),
                      ))
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 1.w, color: AppColors.primaryColor),
                                borderRadius: BorderRadius.circular(7.r),
                              ),
                              fixedSize: Size.fromHeight(47.h),
                              foregroundColor: AppColors.primaryColor,
                              backgroundColor: AppColors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                             Get.offNamed('leave_listing_screen');
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 38.w, vertical: 8.h),
                              child: Text(
                                "Delete",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            )),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7.r)),
                              fixedSize: Size.fromHeight(47.h),
                              foregroundColor: AppColors.white,
                              backgroundColor: AppColors.primaryColor,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 38.w, vertical: 8.h),
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            )),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
