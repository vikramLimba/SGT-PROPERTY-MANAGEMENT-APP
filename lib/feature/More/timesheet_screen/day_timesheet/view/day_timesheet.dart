import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart';
import 'package:sgt_owner/feature/More/timesheet_screen/shared/calendar_filter_popup.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';

class DayTimesheet extends StatefulWidget {
  const DayTimesheet({super.key});

  @override
  State<DayTimesheet> createState() => _DayTimesheetState();
}

class _DayTimesheetState extends State<DayTimesheet> {
  DateTime? selectedDate;

  Widget propertyCard = Get.arguments["selectedPropertyCard"];

  bool _isVisible = false;

  List<Map<dynamic, dynamic>> shitsDetails = [
    {
      "shift-name": "Morning Hallway Shift",
      "shift-time": "9:00 PM to 10:00 PM"
    },
    {
      "shift-name": "Morning Hallway Shift 8AM",
      "shift-time": "9:00 PM to 10:00 PM"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SingleChildScrollView(child: dayTimesheet()),
    );
  }

  Widget dayTimesheet() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 6.h),
          child: Container(
            child: propertyCard,
          ),
        ),
        dayCalendar(),
        Padding(
          padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Today',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
              ),
              CalendarFilterPopUp()
            ],
          ),
        ),
        todayDropdownCard()
      ],
    );
  }

  Widget dayCalendar() {
    return Card(
      margin: EdgeInsets.zero,
      child: Container(
          height: 320.h,
          color: AppColors.white,
          child: Padding(
            padding: EdgeInsets.all(21.0.h),
            child: CalendarCarousel(
              customGridViewPhysics: NeverScrollableScrollPhysics(),
              onDayPressed: (DateTime date, List events) {
                setState(() {
                  selectedDate = date;
                });
              },
              selectedDayBorderColor: Colors.transparent,
              selectedDayTextStyle: const TextStyle(
                  color: AppColors.white, fontWeight: FontWeight.w500),
              selectedDayButtonColor: AppColors.primaryColor,
              selectedDateTime: selectedDate,
              weekdayTextStyle: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black),
              nextDaysTextStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.disableColor),
              inactiveWeekendTextStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.disableColor),
              inactiveDaysTextStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.disableColor),
              daysTextStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black),
              firstDayOfWeek: 1,
              iconColor: AppColors.black,
              weekendTextStyle: TextStyle(
                color: AppColors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              height: 380.h,
              headerTextStyle: const TextStyle(
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
              daysHaveCircularBorder: false,
              todayTextStyle: selectedDate == null
                  ? const TextStyle(color: AppColors.white)
                  : TextStyle(
                      color: AppColors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500),
              todayButtonColor:
                  // selectedDate == null
                  //     ?
                  AppColors.primaryColor,
              // : Colors.transparent,
              todayBorderColor:
                  selectedDate == null ? AppColors.black : Colors.transparent,
              minSelectedDate: DateTime(1980),
              maxSelectedDate: DateTime(3000),
            ),
          )),
    );
  }

  Widget todayDropdownCard() {
    var date = DateTime.now();
    var dayName = (DateFormat('EE').format(date));
    int day = date.day;
    int year = date.year;

    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 0.h, 16.w, 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 12.h,
                  ),
                  Text(
                    dayName,
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    " $day, $year",
                    style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                  height: 24.h,
                  child: IconButton(
                      style: IconButton.styleFrom(
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        setState(() {
                          if (_isVisible == false) {
                            _isVisible = true;
                          } else {
                            _isVisible = false;
                          }
                        });
                      },
                      icon: _isVisible == true
                          ? const Icon(
                              Icons.expand_less,
                            )
                          : const Icon(
                              Icons.expand_more,
                            )))
            ],
          ),
          Visibility(
              visible: _isVisible,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 8.h,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: shitsDetails.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Container(
                              width: double.infinity,
                              color: AppColors.primaryBackColor,
                              child: Padding(
                                padding: EdgeInsets.all(12.0.h),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${shitsDetails[index]["shift-name"]}",
                                      // "Morning Hallway Shift",
                                      style: TextStyle(
                                          color: AppColors.primaryColor,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text("${shitsDetails[index]["shift-time"]}",

                                        // "9:00 PM to 10:00 PM",
                                        style: AppFontStyle.regularTextStyle(
                                            AppColors.secondaryColor, 14.sp)),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                          ],
                        );
                      }),
                  Center(
                    child: Container(
                      padding: EdgeInsets.only(top: 15.h, bottom: 16.h),
                      height: 8.h,
                      width: Get.width,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: AppColors.disableColor,
                            width: 1.w,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
