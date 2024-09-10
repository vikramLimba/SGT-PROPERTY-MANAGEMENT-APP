import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgt_owner/feature/Messages/widgets/custom_shape.dart';
import 'package:sgt_owner/feature/Messages/widgets/share_to_connect_screen.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';
import 'package:flutter_svg/svg.dart';

class SentMessageScreen extends StatelessWidget {
  final String message;
  const SentMessageScreen({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final messageTextGroup = Flexible(
      child: Container(
        child: InkWell(
          onLongPress: () {
            Get.dialog(Dialog(
              child: Container(
                width: 120.w,
                height: 183.h,
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(6.r)),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Get.toNamed("/report_screen");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Star",
                            style: AppFontStyle.regularTextStyle(
                                AppColors.textColor, 12.sp),
                          ),
                          Icon(
                            Icons.star,
                            color: AppColors.primaryColor,
                            size: 20.w,
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: AppColors.disableColor,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Get.toNamed("/shift_screen");
                        Navigator.of(context).pop();
                        Get.to(ShareToConnection());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Forward",
                            style: AppFontStyle.regularTextStyle(
                                AppColors.textColor, 12.sp),
                          ),
                          SvgPicture.asset(
                            "assets/forward_vector.svg",
                            width: 20.w,
                            height: 21.h,
                            color: AppColors.primaryColor,
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: AppColors.disableColor,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Get.toNamed('/staff_screen');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Reply",
                            style: AppFontStyle.regularTextStyle(
                                AppColors.textColor, 12.sp),
                          ),
                          SvgPicture.asset(
                            "assets/reply_vector.svg",
                            width: 20.w,
                            height: 21.h,
                            color: AppColors.primaryColor,
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: AppColors.disableColor,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Get.toNamed('/staff_screen');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Copy",
                            style: AppFontStyle.regularTextStyle(
                                AppColors.textColor, 12.sp),
                          ),
                          Icon(
                            Icons.copy,
                            color: AppColors.primaryColor,
                            size: 20.w,
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: AppColors.disableColor,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Get.toNamed("/report_screen");
                        Navigator.of(context).pop();
                        Get.dialog(deleteMessage());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Delete",
                            style: AppFontStyle.regularTextStyle(
                                AppColors.textColor, 12.sp),
                          ),
                          Icon(
                            Icons.delete_outline,
                            color: AppColors.primaryColor,
                            size: 20.w,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(18),
                      bottomLeft: Radius.circular(18),
                      bottomRight: Radius.circular(18),
                    ),
                  ),
                  child: Text(
                    message,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
              CustomPaint(painter: CustomShape(AppColors.primaryColor)),
            ],
          ),
        ),
      ),
    );

    return Padding(
      padding: EdgeInsets.only(right: 18.0, left: 50, top: 15, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          SizedBox(height: 30),
          messageTextGroup,
        ],
      ),
    );
  }

  Widget deleteMessage() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.h),
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
                        "Are you sure you want to delete this message?",
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
                                Get.back();
                              },
                              child: const Text(
                                'Delete',
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
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
                              child: const Text(
                                'Cancel',
                                style: TextStyle(color: AppColors.white),
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
    );
  }
}
