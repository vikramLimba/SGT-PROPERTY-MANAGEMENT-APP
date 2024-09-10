// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgt_owner/feature/More/reports_screen/tab_reports_screens/emergency_tab.dart';
import 'package:sgt_owner/feature/More/reports_screen/tab_reports_screens/general_tab.dart';
import 'package:sgt_owner/feature/More/reports_screen/tab_reports_screens/maintanance_tab.dart';
import 'package:sgt_owner/feature/More/reports_screen/tab_reports_screens/parking_tab.dart';
import 'package:sgt_owner/shared/widgets/custom_appbar.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen>
    with TickerProviderStateMixin {
  bool expand = true;
  bool expanded = true;
  late TabController _tabController;

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      initialIndex: 0,
      length: 4,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: 'All reoprts',
        isLeading: true,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 18.h),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor.withOpacity(0.6),
                  borderRadius: BorderRadius.all(Radius.elliptical(5.r, 5.r)),
                ),
                child: Column(
                  children: [
                    TabBar(
                      labelPadding:
                          EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
                      // tabAlignment: TabAlignment.center,
                      labelStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      unselectedLabelStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      labelColor: Colors.white,
                      indicatorColor: Colors.transparent,
                      dividerColor: Colors.transparent,
                      padding: EdgeInsets.all(2.h),
                      isScrollable: false,
                      tabAlignment: TabAlignment.fill,
                      // padding: EdgeInsets.zero,
                      controller: _tabController,
                      // indicatorWeight: 2,
                      tabs: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Tab(
                            child: Text(
                              'General',
                              style: AppFontStyle.semiboldTextStyle(
                                  AppColors.textColor, 12.sp),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: Tab(
                            child: Text(
                              'Maintanance',
                              style: AppFontStyle.semiboldTextStyle(
                                  AppColors.textColor, 12.sp),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Tab(
                            child: Text(
                              'Emergency',
                              style: AppFontStyle.semiboldTextStyle(
                                  AppColors.textColor, 12.sp),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Tab(
                            child: Text(
                              'Parking',
                              style: AppFontStyle.semiboldTextStyle(
                                  AppColors.textColor, 12.sp),
                            ),
                          ),
                        ),
                      ],
                      // indicatorColor: Colors.transparent,
                      // labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                      indicator: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5.r),
                          color: AppColors.white),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              child: TabBarView(controller: _tabController, children: [
                GeneralReportTab(),
                MaintananceReportTab(),
                EmergencyReportTab(),
                ParkingReportTab(),
              ]),
            ),
          ]),
    );
  }
}
