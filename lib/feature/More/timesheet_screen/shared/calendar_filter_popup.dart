import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sgt_owner/shared/widgets/custom_bottomsheet.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';

class CalendarFilterPopUp extends StatefulWidget {
  const CalendarFilterPopUp({super.key});

  @override
  State<CalendarFilterPopUp> createState() => _CalendarFilterPopUpState();
}

class _CalendarFilterPopUpState extends State<CalendarFilterPopUp> {
  Widget card = Get.arguments["selectedPropertyCard"];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Filter',
          style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600),
        ),
        IconButton(
          padding: EdgeInsets.zero,
          alignment: Alignment.center,
          onPressed: () {
            showModalFilter();
          },
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
          color: AppColors.black,
        )
      ],
    );
  }

  Future showModalFilter() {
    return showModalBottomSheet(
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
                        Navigator.of(context).pop();
                        // Get.to(() => MonthTimesheet());
                        Get.toNamed('/WeekTimesheet',
                            arguments: {"selectedPropertyCard": card});
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "This Week",
                            style: AppFontStyle.regularTextStyle(
                                AppColors.textColor, 14.sp),
                          ),
                          IconButton(
                              style: IconButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  alignment: Alignment.centerRight),
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                "assets/week.svg",
                                width: 23.w,
                                height: 24.h,
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
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                        Get.toNamed('/MonthTimesheet',
                            arguments: {"selectedPropertyCard": card});
                        // Get.to(() => MonthTimesheet());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "This Month",
                            style: AppFontStyle.regularTextStyle(
                                AppColors.textColor, 14.sp),
                          ),
                          IconButton(
                              style: IconButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  alignment: Alignment.centerRight),
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                "assets/month.svg",
                                width: 23.w,
                                height: 24.h,
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
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                        Get.toNamed('/DayTimesheet',
                            arguments: {"selectedPropertyCard": card});
                        // Get.to(() => DayTimesheet());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Today",
                            style: AppFontStyle.regularTextStyle(
                                AppColors.textColor, 14.sp),
                          ),
                          IconButton(
                              style: IconButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  alignment: Alignment.centerRight),
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                "assets/day.svg",
                                width: 23.w,
                                height: 24.h,
                              ))
                        ],
                      ),
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
        });
  }
}
