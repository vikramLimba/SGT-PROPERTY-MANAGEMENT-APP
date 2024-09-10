import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:sgt_owner/feature/More/timesheet_screen/shared/calendar_filter_popup.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';

class MonthTimesheet extends StatefulWidget {
  const MonthTimesheet({super.key});

  @override
  State<MonthTimesheet> createState() => _MonthTimesheetState();
}

class _MonthTimesheetState extends State<MonthTimesheet> {
  DateTime? selectedDate;

  Widget propertyCard = Get.arguments["selectedPropertyCard"];

  // bool _isVisible = false;

  static List<Map<dynamic, dynamic>> shitsDetails = [
    {
      "Day": "Mon  ",
      "Date": "01",
      "shift": "02 Shifts",
      "shifts": [
        {
          "shift-name": "Morning Hallway Shift 1",
          "shift-time": "9:00 PM to 10:00 PM"
        },
        {
          "shift-name": "Morning Hallway Shift 2",
          "shift-time": "9:00 PM to 10:00 PM"
        },
      ]
    },
    {
      "Day": "Tue  ",
      "Date": "02",
      "shift": "Hallway Shift",
      "shifts": [
        {
          "shift-name": "Morning Hallway Shift 1",
          "shift-time": "9:00 PM to 10:00 PM"
        },
        {
          "shift-name": "Morning Hallway Shift 2",
          "shift-time": "9:00 PM to 10:00 PM"
        },
      ]
    },
    {
      "Day": "Wed  ",
      "Date": "03",
      "shift": "Hallway Shift",
      "shifts": [
        {
          "shift-name": "Morning Hallway Shift 1",
          "shift-time": "9:00 PM to 10:00 PM"
        },
        {
          "shift-name": "Morning Hallway Shift 2",
          "shift-time": "9:00 PM to 10:00 PM"
        },
      ]
    },
    {
      "Day": "Thu  ",
      "Date": "04",
      "shift": "Hallway Shift",
      "shifts": [
        {
          "shift-name": "Morning Hallway Shift 1",
          "shift-time": "9:00 PM to 10:00 PM"
        },
        {
          "shift-name": "Morning Hallway Shift 2",
          "shift-time": "9:00 PM to 10:00 PM"
        },
      ]
    },
    {
      "Day": "Fri  ",
      "Date": "05",
      "shift": "Hallway Shift",
      "shifts": [
        {
          "shift-name": "Morning Hallway Shift 1",
          "shift-time": "9:00 PM to 10:00 PM"
        },
        {
          "shift-name": "Morning Hallway Shift 2",
          "shift-time": "9:00 PM to 10:00 PM"
        },
      ]
    },
  ];

  List<bool> visibilityList = List.filled(shitsDetails.length, false);

  @override
  Widget build(BuildContext context) {
    // print(visibilityList);
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
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(), child: monthTimesheet()),
    );
  }

  Widget monthTimesheet() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 6.h),
          child: Container(
            child: propertyCard,
          ),
        ),
        monthCalendar(),
        Padding(
          padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'This Month',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
              ),
              const CalendarFilterPopUp()
            ],
          ),
        ),
        monthDropdowns()
      ],
    );
  }

  // EventList<Event> _markedDateMap = EventList<Event>(events: {});
  // @override
  // void initState() {
  //   addMarker(DateTime(2024, 4, 03));
  //   super.initState();
  // }

  // addMarker(DateTime startEventDateTime) {
  //   var eventDateTime = startEventDateTime;

  //   for (int i = 0; i < 5; i++) {
  //     if (eventDateTime.day == 1) {
  //       eventDateTime = eventDateTime.add(Duration(days: (4)));
  //       print(eventDateTime);
  //     } else {
  //       eventDateTime = eventDateTime.add(Duration(days: (5)));
  //     }
  //     print(eventDateTime.toLocal());
  //     _markedDateMap.add(
  //         eventDateTime,
  //         Event(
  //           date: eventDateTime,
  //           title: 'Event $i',
  //           icon: _eventIcon,
  //         ));
  //   }
  // }

  // static Widget _eventIcon = Container(
  //   decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.all(Radius.circular(1000)),
  //       border: Border.all(color: Colors.blue, width: 2.0)),
  //   child: Icon(
  //     Icons.person,
  //     color: Colors.amber,
  //   ),
  // );

  // List<String> visibilityList1 = List.generate(shitsDetails.length, (index) {
  //   return shitsDetails[index]["shift"];
  // });

  // final List<MarkedDate> _markedDateList = [
  //   MarkedDate(
  //       color: AppColors.primaryColor,
  //       date: DateTime(2024, 4, 1),
  //       textStyle: AppFontStyle.mediumTextStyle(AppColors.white, 16.sp)),
  //   MarkedDate(
  //       color: AppColors.primaryColor,
  //       date: DateTime(2024, 4, 2),
  //       textStyle: AppFontStyle.mediumTextStyle(AppColors.white, 16.sp)),
  //   MarkedDate(
  //       color: AppColors.primaryColor,
  //       date: DateTime(2024, 4, 3),
  //       textStyle: AppFontStyle.mediumTextStyle(AppColors.white, 16.sp)),
  //   MarkedDate(
  //       color: AppColors.primaryColor,
  //       date: DateTime(2024, 4, 4),
  //       textStyle: AppFontStyle.mediumTextStyle(AppColors.white, 16.sp)),
  //   MarkedDate(
  //       color: AppColors.primaryColor,
  //       date: DateTime(2024, 4, 5),
  //       textStyle: AppFontStyle.mediumTextStyle(AppColors.white, 16.sp)),
  //   MarkedDate(
  //       color: AppColors.primaryColor,
  //       date: DateTime(2024, 4, 6),
  //       textStyle: AppFontStyle.mediumTextStyle(AppColors.white, 16.sp)),
  //   MarkedDate(
  //       color: AppColors.primaryColor,
  //       date: DateTime(2024, 4, 7),
  //       textStyle: AppFontStyle.mediumTextStyle(AppColors.white, 16.sp)),
  //   MarkedDate(
  //       color: AppColors.primaryColor,
  //       date: DateTime(2024, 4, 8),
  //       textStyle: AppFontStyle.mediumTextStyle(AppColors.white, 16.sp)),
  //   MarkedDate(
  //       color: AppColors.primaryColor,
  //       date: DateTime(2024, 4, 9),
  //       textStyle: AppFontStyle.mediumTextStyle(AppColors.white, 16.sp)),
  //   MarkedDate(
  //       color: AppColors.primaryColor,
  //       date: DateTime(2024, 4, 10),
  //       textStyle: AppFontStyle.mediumTextStyle(AppColors.white, 16.sp)),
  //   MarkedDate(
  //       color: AppColors.primaryColor,
  //       date: DateTime(2024, 4, 11),
  //       textStyle: AppFontStyle.mediumTextStyle(AppColors.white, 16.sp)),
  //   MarkedDate(
  //       color: AppColors.primaryColor,
  //       date: DateTime(2024, 4, 12),
  //       textStyle: AppFontStyle.mediumTextStyle(AppColors.white, 16.sp)),
  //   MarkedDate(
  //       color: AppColors.primaryColor,
  //       date: DateTime(2024, 4, 13),
  //       textStyle: AppFontStyle.mediumTextStyle(AppColors.white, 16.sp)),
  //   MarkedDate(
  //       color: AppColors.primaryColor,
  //       date: DateTime(2024, 4, 14),
  //       textStyle: AppFontStyle.mediumTextStyle(AppColors.white, 16.sp))
  // ];

  EventList<Event> markedDateMap = EventList<Event>(events: {});
  List<DateTime> markedDates = [
    DateTime(2024, 4, 1),
    DateTime(2024, 4, 2),
    DateTime(2024, 4, 3),
    DateTime(2024, 4, 4),
    DateTime(2024, 4, 5),
    DateTime(2024, 4, 6),
    DateTime(2024, 4, 7),
    DateTime(2024, 4, 8),
    DateTime(2024, 4, 9),
    DateTime(2024, 4, 10),
    DateTime(2024, 4, 11),
    DateTime(2024, 4, 12),
    DateTime(2024, 4, 13),
    DateTime(2024, 4, 14),
    DateTime(2024, 4, 15),
    DateTime(2024, 4, 16),
    DateTime(2024, 4, 17),
    DateTime(2024, 4, 18),
    DateTime(2024, 4, 19),
    DateTime(2024, 4, 20),
    DateTime(2024, 4, 21),
    DateTime(2024, 4, 22),
    DateTime(2024, 4, 23),
    DateTime(2024, 4, 24),
    DateTime(2024, 4, 25),
    DateTime(2024, 4, 26),
    DateTime(2024, 4, 27),
    DateTime(2024, 4, 28),
    DateTime(2024, 4, 29),
    DateTime(2024, 4, 30),
  ];

  static Widget _dayIcon(String day) {
    return Container(
      height: 50,
      width: 37.w,
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(4.r),
          border: Border.all(color: AppColors.primaryColor)),
      child: Center(
        child: Text(
          day,
          style: AppFontStyle.mediumTextStyle(AppColors.white, 16.sp),
        ),
      ),
    );
  }

  addDates() {
    for (int i = 0; i < markedDates.length; i++) {
      markedDateMap.add(
          markedDates[i],
          Event(
              date: markedDates[i],
              icon: _dayIcon(markedDates[i].day.toString())));
    }
  }

  @override
  void initState() {
    addDates();
    super.initState();
  }

  Widget monthCalendar() {
    return Card(
      margin: EdgeInsets.zero,
      child: Container(
          height: 320.h,
          color: AppColors.white,
          child: Padding(
            padding: EdgeInsets.all(21.0.h),
            // child: CalendarCarousel(
            //   // markedDateShowIcon: true,
            //   markedDateCustomShapeBorder: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(4.r)),
            //   markedDateIconMaxShown: 1,
            //   markedDatesMap: markedDateMap,
            //   markedDateMoreShowTotal: null,
            //   markedDateIconBuilder: (event) {
            //     return event.icon;
            //   },
            //   headerTitleTouchable: true,

            //   //   return Container(
            //   //     padding: EdgeInsets.zero,
            //   //     // height: 40.h,
            //   //     width: 37.w,
            //   //     color: AppColors.primaryColor,
            //   //     child: Center(
            //   //         child: Text(
            //   //       event.date.day.toString(),
            //   //       style: TextStyle(color: AppColors.white),
            //   //     )),
            //   //   );
            //   // },
            //   // markedDatesMap: _markedDateMap,
            //   customGridViewPhysics: const NeverScrollableScrollPhysics(),
            //   onDayPressed: (DateTime date, List events) {
            //     setState(() {
            //       selectedDate = date;
            //     });
            //   },
            //   selectedDayBorderColor: Colors.transparent,
            //   selectedDayTextStyle: const TextStyle(
            //       color: AppColors.white, fontWeight: FontWeight.w500),
            //   selectedDayButtonColor: AppColors.primaryColor,
            //   selectedDateTime: selectedDate,
            //   weekdayTextStyle: TextStyle(
            //       fontSize: 16.sp,
            //       fontWeight: FontWeight.w500,
            //       color: AppColors.black),
            //   nextDaysTextStyle: TextStyle(
            //       fontSize: 14.sp,
            //       fontWeight: FontWeight.w500,
            //       color: AppColors.disableColor),
            //   inactiveWeekendTextStyle: TextStyle(
            //       fontSize: 14.sp,
            //       fontWeight: FontWeight.w500,
            //       color: AppColors.disableColor),
            //   inactiveDaysTextStyle: TextStyle(
            //       fontSize: 14.sp,
            //       fontWeight: FontWeight.w500,
            //       color: AppColors.disableColor),
            //   daysTextStyle: TextStyle(
            //       fontSize: 16.sp,
            //       fontWeight: FontWeight.w500,
            //       color: AppColors.black),
            //   firstDayOfWeek: 1,
            //   iconColor: AppColors.black,
            //   weekendTextStyle: TextStyle(
            //     color: AppColors.black,
            //     fontSize: 14.sp,
            //     fontWeight: FontWeight.w500,
            //   ),
            //   height: 380.h,
            //   headerTextStyle: const TextStyle(
            //       color: AppColors.black,
            //       fontSize: 16,
            //       fontWeight: FontWeight.w500),
            //   daysHaveCircularBorder: false,
            //   todayTextStyle: selectedDate == null
            //       ? TextStyle(
            //           fontSize: 16.sp,
            //           color: AppColors.white,
            //           fontWeight: FontWeight.w500)
            //       : TextStyle(
            //           color: AppColors.white,
            //           fontSize: 16.sp,
            //           fontWeight: FontWeight.w500),
            //   todayButtonColor:
            //       // selectedDate == null
            //       //     ?
            //       AppColors.primaryColor,
            //   // : Colors.transparent,
            //   todayBorderColor:
            //       selectedDate == null ? AppColors.black : Colors.transparent,
            //   minSelectedDate: DateTime(1980),
            //   maxSelectedDate: DateTime(3000),
            // ),
          )),
    );
  }

  Widget monthDropdowns() {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 0.h, 16.w, 16.h),
      child: ListView.builder(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: shitsDetails.length,
          itemBuilder: (BuildContext context, index) {
            return dropdown(index);
          }),
    );
  }

  Widget dropdown(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                SizedBox(
                  width: 12.h,
                ),
                Text(
                  "${shitsDetails[index]["Day"]}",
                  // dayName,
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  " ${shitsDetails[index]["Date"]}",
                  style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            visibilityList[index] == true
                ? SizedBox(
                    height: 24.h,
                    child: IconButton(
                        style: IconButton.styleFrom(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                        alignment: Alignment.center,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            if (visibilityList[index] == false) {
                              print(visibilityList[index]);
                              visibilityList[index] = true;
                            } else {
                              visibilityList[index] = false;
                            }
                          });
                        },
                        icon: visibilityList[index] == true
                            ? const Icon(
                                Icons.expand_less,
                              )
                            : const Icon(
                                Icons.expand_more,
                              )),
                  )
                : const SizedBox()
          ]),
        ),
        Visibility(
          visible: visibilityList[index] == false ? true : false,
          child: Container(
            color: AppColors.primaryBackColor,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 14.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 12.h,
                      ),
                      Text(
                        "${shitsDetails[index]["shift"]}",
                        // dayName,
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24.h,
                    child: IconButton(
                        style: IconButton.styleFrom(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                        alignment: Alignment.center,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            if (visibilityList[index] == false) {
                              print(visibilityList[index]);
                              visibilityList[index] = true;
                            } else {
                              visibilityList[index] = false;
                            }
                          });
                        },
                        icon: visibilityList[index] == true
                            ? const Icon(
                                Icons.expand_less,
                              )
                            : const Icon(
                                Icons.expand_more,
                              )),
                  )
                ],
              ),
            ),
          ),
        ),
        Visibility(
            visible: visibilityList[index],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 8.h,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: shitsDetails[index]["shifts"].length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int innerIndex) {
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
                                    "${shitsDetails[index]["shifts"][innerIndex]["shift-name"]}",
                                    // "Morning Hallway Shift",
                                    style: TextStyle(
                                        color: AppColors.primaryColor,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                      "${shitsDetails[index]["shifts"][innerIndex]["shift-time"]}",

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
    );
  }
}
