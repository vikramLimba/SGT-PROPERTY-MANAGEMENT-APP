import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgt_owner/style/colors.dart';

class MissedShifts extends StatefulWidget {
  const MissedShifts({super.key});

  @override
  State<MissedShifts> createState() => _MissedShiftsState();
}

class _MissedShiftsState extends State<MissedShifts> {
  List days = ["Today", "Yesterday", "Date: 24 June 2023"];

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
        body: SingleChildScrollView(
            padding: EdgeInsets.all(16.0.h),
            physics: const BouncingScrollPhysics(),
            child: shiftCardList()),
    );
  }

  Widget shiftCardList() {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: days.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return shiftCard(index);
        });
  }

  Widget shiftCard(index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          days[index],
          style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 8.h,
        ),
        card(),
      ],
    );
  }

  Widget card() {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 2,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.r)),
              elevation: 2.h,
              margin: EdgeInsets.only(bottom: 8.h),
              surfaceTintColor: AppColors.white,
              shadowColor: AppColors.secondaryColor,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          clipBehavior: Clip.antiAlias,
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                          child: Image.asset(
                            'assets/properties-10.png',
                            height: 55.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Radission Blu Hotel',
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            SizedBox(
                              width: 230.w,
                              child: Text(
                                '4517 Washington Ave. Manchester, Kentucky 3949',
                                softWrap: true,
                                style: TextStyle(
                                  // overflow: TextOverflow.ellipsis,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(
                                text: TextSpan(
                                    text: "Check-In:",
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.primaryColor,
                                        overflow: TextOverflow.ellipsis),
                                    children: [
                                  TextSpan(
                                      text: " 10:00 AM",
                                      style: TextStyle(
                                          color: AppColors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                          overflow: TextOverflow.ellipsis))
                                ])),
                            SizedBox(
                              height: 10.h,
                              child: VerticalDivider(
                                width: 10.w,
                                thickness: 1.w,
                              ),
                            ),
                            RichText(
                                text: TextSpan(
                                    text: "Check-Out:",
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.primaryColor,
                                        overflow: TextOverflow.ellipsis),
                                    children: [
                                  TextSpan(
                                      text: " 02:00 PM",
                                      style: TextStyle(
                                          color: AppColors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                          overflow: TextOverflow.ellipsis))
                                ])),
                          ],
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Text(
                          "Missed Shift",
                          style: TextStyle(
                              color: AppColors.redColor,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    )
                  ],
                ),
              ));
        });
  }
}
