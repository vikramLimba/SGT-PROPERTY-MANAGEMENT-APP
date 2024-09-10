import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgt_owner/shared/widgets/custom_bottomsheet.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';

class AddNewGuardPopUp extends StatefulWidget {
  const AddNewGuardPopUp({
    super.key,
  });

  @override
  State<AddNewGuardPopUp> createState() => _AddNewGuardPopUpState();
}

class _AddNewGuardPopUpState extends State<AddNewGuardPopUp> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 19.h,
        child: TextButton(
            style: TextButton.styleFrom(
                padding: EdgeInsets.zero, alignment: Alignment.centerRight),
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
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed("/AddNewGuard");
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Add New Guard',
                                    style: AppFontStyle.regularTextStyle(
                                        AppColors.textColor, 14.sp),
                                  ),
                                  IconButton(
                                      style: IconButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                          alignment: Alignment.centerRight),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        Get.toNamed("/AddNewGuard");
                                      },
                                      icon: const Icon(
                                        Icons.add_circle,
                                        color: AppColors.primaryColor,
                                      ))
                                ],
                              ),
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
                                  'Assign Duty',
                                  style: AppFontStyle.regularTextStyle(
                                      AppColors.textColor, 14.sp),
                                ),
                                IconButton(
                                    padding: EdgeInsets.zero,
                                    alignment: Alignment.centerRight,
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.assignment_add,
                                      color: AppColors.primaryColor,
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
            )));
  }
}
