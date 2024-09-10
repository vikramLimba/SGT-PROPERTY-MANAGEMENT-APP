// import 'dart:html';s

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:scrollable_clean_calendar/models/day_values_model.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';
// import 'package:scrollable_clean_calendar/utils/extensions.dart';

class AbsentRecord extends StatefulWidget {
  const AbsentRecord({super.key});

  @override
  State<AbsentRecord> createState() => _AbsentRecordState();
}

class _AbsentRecordState extends State<AbsentRecord> {
  final calendarController = CleanCalendarController(
    initialFocusDate: DateTime.now(),
    minDate: DateTime(2000),
    maxDate: DateTime(3000),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            },
          ),
          toolbarHeight: 63.h,
        ),
        body: Padding(
          padding: EdgeInsets.all(16.h),
          child: totalWorkingDays(),
        ),
      ),
    );
  }

  Widget totalWorkingDays() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        RichText(
            text: TextSpan(
                text: "Total Working Days",
                style:
                    AppFontStyle.semiboldTextStyle(AppColors.textColor, 16.sp),
                children: [
              TextSpan(
                text: " (40)",
                style:
                    AppFontStyle.semiboldTextStyle(AppColors.grayColor, 16.sp),
              )
            ])),
        SizedBox(
          height: 16.h,
        ),
        Flexible(child: Container(child: absentListCalendar()))
      ],
    );
  }

  static DayValues absentDate1 = DayValues(
      day: DateTime(2024, 4, 3),
      text: "3",
      isSelected: false,
      isFirstDayOfWeek: false,
      isLastDayOfWeek: false,
      minDate: DateTime(2000),
      maxDate: DateTime(3000));

  static DayValues absentDate2 = DayValues(
      day: DateTime(2024, 4, 4),
      text: "4",
      isSelected: false,
      isFirstDayOfWeek: false,
      isLastDayOfWeek: false,
      minDate: DateTime(2024),
      maxDate: DateTime(2024));

  static DayValues absentDate3 = DayValues(
      day: DateTime(2024, 4, 6),
      text: "6",
      isSelected: false,
      isFirstDayOfWeek: false,
      isLastDayOfWeek: false,
      minDate: DateTime(2024),
      maxDate: DateTime(2024));

  List absentDatesList = [absentDate1, absentDate2, absentDate3];

  List<AbsentDate> absentDatesList1 = [
    AbsentDate(date: DateTime(2024, 4, 3), text: "3"),
    AbsentDate(date: DateTime(2024, 4, 4), text: "4"),
    AbsentDate(date: DateTime(2024, 4, 6), text: "6"),
  ];
  Widget absentListCalendar() {
    return ScrollableCleanCalendar(
      spaceBetweenCalendars: 16.h,
      calendarCrossAxisSpacing: 1,
      calendarMainAxisSpacing: 1,
      monthTextAlign: TextAlign.center,
      monthBuilder: (context, month) {
        return Container(
          height: 40.h,
          width: 50.w,
          color: AppColors.white,
          child: Center(
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: "Attendance of",
                    style: AppFontStyle.semiboldTextStyle(
                        AppColors.primaryColor, 14.sp),
                    children: [
                      TextSpan(
                        text: " $month",
                        style: AppFontStyle.semiboldTextStyle(
                            AppColors.textColor, 16.sp),
                      )
                    ])),
          ),
        );
      },
      weekdayBuilder: (context, weekday) {
        return Container(
          height: 40.h,
          width: 60.w,
          color: AppColors.white,
          child: Center(
              child: Text(
            weekday,
            style: AppFontStyle.regularTextStyle(AppColors.grayColor, 12.sp),
          )),
        );
      },
      dayBuilder: (context, values) {
        return ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: absentDatesList.length,
            itemBuilder: (context, index) {
              final absentDate = absentDatesList[index];
              // assign list of dates to values=============>
              // values = absentDatesList[index];
              return Column(
                children: [
                  absentDate == values.day
                      ? Container(
                          height: 40.h,
                          color: values.day == absentDate
                              ? Colors.red
                              : Colors.white,
                          child: Center(
                            child: Text(values.text,
                                // values.text,
                                style: values.isLastDayOfWeek
                                    ? AppFontStyle.mediumTextStyle(
                                        AppColors.grayColor, 12.sp)
                                    : values.day.year == absentDate.year &&
                                            values.day.month ==
                                                absentDate.month &&
                                            values.day.day == absentDate.day
                                        ? AppFontStyle.mediumTextStyle(
                                            AppColors.white, 12.sp)
                                        : AppFontStyle.mediumTextStyle(
                                            AppColors.black, 12.sp)),
                          ),
                        )
                      : Container(
                          height: 40.h,
                          color: Colors.white,
                          child: Center(
                            child: Text(
                              values.text,
                              style: values.isLastDayOfWeek
                                  ? AppFontStyle.mediumTextStyle(
                                      AppColors.grayColor, 12.sp)
                                  : AppFontStyle.mediumTextStyle(
                                      AppColors.greenColor, 12.sp),
                            ),
                          ),
                        ),
                ],
              );
              // : Column(
              //     children: [
              //       if (absentDate != values.day)
              //         Container(
              //           height: 40.h,
              //           color: Colors.white,
              //           child: Center(
              //             child: Text(
              //               values.text,
              //               style: values.isLastDayOfWeek
              //                   ? AppFontStyle.mediumTextStyle(
              //                       AppColors.grayColor, 12.sp)
              //                   : AppFontStyle.mediumTextStyle(
              //                       AppColors.greenColor, 12.sp),
              //             ),
              //           ),
              //         ),
              //     ],
              //   );

              //         // FutureBuilder(
              //         //     future: Future.delayed(Duration(milliseconds: 5000)),
              //         //     builder: ((context, snapshot) {
              //         //       return values.day == absentDatesList[index].day
              //         //           ? Container(
              //         //               height: 40.h,
              //         //               width: 50.w,
              //         //               color: Colors.red,
              //         //               child: Center(
              //         //                 child: Text(
              //         //                   values.text,
              //         //                   style: values.isLastDayOfWeek
              //         //                       ? AppFontStyle.mediumTextStyle(
              //         //                           AppColors.grayColor, 12.sp)
              //         //                       : AppFontStyle.mediumTextStyle(
              //         //                           AppColors.white, 12.sp),
              //         //                 ),
              //         //               ),
              //         //             )
              //         //           : Container(
              //         //               height: 40.h,
              //         //               width: 50.w,
              //         //               color: Colors.white,
              //         //               child: Center(
              //         //                 child: Text(
              //         //                   values.text,
              //         //                   style: values.isLastDayOfWeek
              //         //                       ? AppFontStyle.mediumTextStyle(
              //         //                           AppColors.grayColor, 12.sp)
              //         //                       : AppFontStyle.mediumTextStyle(
              //         //                           AppColors.greenColor, 12.sp),
              //         //                 ),
              //         //               ),
              //         //             );
              //         //     }));

              //         // values.day == absentDate1.day
              //         //     ? Container(
              //         //         height: 40.h,
              //         //         width: 50.w,
              //         //         color: Colors.red,
              //         //         child: Center(
              //         //           child: Text(
              //         //             values.text,
              //         //             style: values.isLastDayOfWeek
              //         //                 ? AppFontStyle.mediumTextStyle(
              //         //                     AppColors.grayColor, 12.sp)
              //         //                 : AppFontStyle.mediumTextStyle(
              //         //                     AppColors.white, 12.sp),
              //         //           ),
              //         //         ),
              //         //       )
              //         //     : Container(
              //         //         height: 40.h,
              //         //         width: 50.w,
              //         //         color: Colors.white,
              //         //         child: Center(
              //         //           child: Text(
              //         //             values.text,
              //         //             style: values.isLastDayOfWeek
              //         //                 ? AppFontStyle.mediumTextStyle(
              //         //                     AppColors.grayColor, 12.sp)
              //         //                 : AppFontStyle.mediumTextStyle(
              //         //                     AppColors.greenColor, 12.sp),
              //         //           ),
              //         //         ),
              //         //       );
              //         //  Text("${absentList[index].day}");
            });
      },
      spaceBetweenMonthAndCalendar: 0.h,
      dayRadius: 0,
      padding: EdgeInsets.zero,
      calendarController: calendarController,
      layout: Layout.DEFAULT,
    );
  }
}

class AbsentDate {
  final DateTime date;
  final String text;

  AbsentDate({
    required this.date,
    required this.text,
  });
}
