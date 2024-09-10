// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgt_owner/feature/Properties/manage_property/views/subscreen/checkpoint/checkpoints.dart';
import 'package:sgt_owner/feature/Properties/manage_property/views/subscreen/guard_assigned.dart';
import 'package:sgt_owner/feature/Properties/manage_property/views/subscreen/property_details.dart';
import 'package:sgt_owner/feature/Properties/manage_property/views/subscreen/reports/reports.dart';
import 'package:sgt_owner/feature/Properties/manage_property/views/subscreen/routes/routes.dart';
import 'package:sgt_owner/feature/Properties/manage_property/views/subscreen/shifts/shifts.dart';
import 'package:sgt_owner/shared/widgets/custom_appbar.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';

class ManagePropertyScreen extends StatefulWidget {
  const ManagePropertyScreen({super.key});

  @override
  State<ManagePropertyScreen> createState() => _ManagePropertyScreenState();
}

class _ManagePropertyScreenState extends State<ManagePropertyScreen>
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
      length: 7,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          titleText: 'Radission Blu Hotel',
          isLeading: true,
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.primaryBackColor.withOpacity(0.8),
                    borderRadius: BorderRadius.all(Radius.elliptical(5.r, 5.r)),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 2.w, right: 2.w),
                        child: TabBar(
                          labelPadding: EdgeInsets.symmetric(
                              horizontal: 0.w, vertical: 0.h),
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
                          tabAlignment: TabAlignment.center,
                          isScrollable: true,
                          // padding: EdgeInsets.zero,
                          controller: _tabController,
                          // indicatorWeight: 2,
                          tabs: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              child: Tab(
                                child: Text(
                                  'Property Details',
                                  style: AppFontStyle.semiboldTextStyle(
                                      AppColors.primaryColor, 13.sp),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              child: Tab(
                                child: Text(
                                  'Shifts (05)',
                                  style: AppFontStyle.semiboldTextStyle(
                                      AppColors.primaryColor, 13.sp),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              child: Tab(
                                child: Text(
                                  'Checkpoints (12)',
                                  style: AppFontStyle.semiboldTextStyle(
                                      AppColors.primaryColor, 13.sp),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              child: Tab(
                                child: Text(
                                  'Routes (06)',
                                  style: AppFontStyle.semiboldTextStyle(
                                      AppColors.primaryColor, 13.sp),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              child: Tab(
                                child: Text(
                                  'Guard Assigned (10)',
                                  style: AppFontStyle.semiboldTextStyle(
                                      AppColors.primaryColor, 13.sp),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              child: Tab(
                                child: Text(
                                  'Timesheets',
                                  style: AppFontStyle.semiboldTextStyle(
                                      AppColors.primaryColor, 13.sp),
                                ),
                              ),
                            ),
                            Padding(
                               padding: EdgeInsets.symmetric(horizontal: 8.w),
                              child: Tab(
                                child: Text(
                                  'Reports (20)',
                                  style: AppFontStyle.semiboldTextStyle(
                                      AppColors.primaryColor, 13.sp),
                                ),
                              ),
                            ),
                          ],
                          // indicatorColor: Colors.transparent,
                          // labelColor: Colors.white,
                          unselectedLabelColor: AppColors.textColor,
                          indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppColors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                child: TabBarView(controller: _tabController, children: [
                  PropertyDetails(),
                  Shifts(),
                  Checkpoints(),
                  Routes(),
                  GuardAssigned(),
                  Center(
                    child: Text('Tab 6'),
                  ),
                  Reports(),
                ]),
              ),
            ]));
  }
}
