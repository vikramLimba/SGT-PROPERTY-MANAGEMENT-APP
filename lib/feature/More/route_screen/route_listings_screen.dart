import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgt_owner/shared/widgets/custom_bottomsheet.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';

class RouteListingScreen extends StatefulWidget {
  const RouteListingScreen({super.key});

  @override
  State<RouteListingScreen> createState() => _RouteListingScreenState();
}

class _RouteListingScreenState extends State<RouteListingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 6,
            shadowColor: const Color.fromARGB(255, 186, 185, 185),
            leading: Padding(
              padding: EdgeInsets.only(
                left: 12.w,
              ),
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Icon(
                  Icons.arrow_back_outlined,
                  color: AppColors.textColor,
                ),
              ),
            ),
            leadingWidth: 30.w,
            title: Row(
              children: [
                Text(
                  "Routes",
                  style: AppFontStyle.semiboldTextStyle(
                      AppColors.textColor, 16.sp),
                ),
                Text(
                  " (40)",
                  style: AppFontStyle.semiboldTextStyle(
                      AppColors.grayColor, 16.sp),
                ),
              ],
            ),
            centerTitle: false,
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  //screenNavigator(context, SettingsScreen());
                },
                icon: const Icon(
                  Icons.search_outlined,
                  color: AppColors.primaryColor,
                ),
              ),
            ]),
        body: const SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: RouteList(),
        ));
  }
}

class RouteList extends StatefulWidget {
  const RouteList({super.key});

  @override
  State<RouteList> createState() => _RouteListState();
}

class _RouteListState extends State<RouteList> {
  final List<String> items = [
    'Radission Blu Hotel',
    'Radission Blu Hotel',
    'Radission Blu Hotel',
    'Radission Blu Hotel',
    'Radission Blu Hotel',
    'Radission Blu Hotel',
    'Radission Blu Hotel',
    'Radission Blu Hotel',
    'Radission Blu Hotel',
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            color: AppColors.white,
            width: Get.width - 32.w,
            child: Padding(
              padding: EdgeInsets.all(8.w),
              child: Container(
                margin: EdgeInsets.all(2.w),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.all(Radius.elliptical(5.r, 5.r)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5.r,
                      blurRadius: 7.r,
                      offset: Offset(0.w, 3.h), // changes position of shadow
                    ),
                  ],
                ),
                child: Stack(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.toNamed('/route_detail_screen');
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                items[index].toString(),
                                style: AppFontStyle.mediumTextStyle(
                                    AppColors.primaryColor, 14.sp),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Route Name:',
                                        style: AppFontStyle.regularTextStyle(
                                            AppColors.textColor, 12.sp),
                                      ),
                                      Text(
                                        ' Beverly ',
                                        style: AppFontStyle.mediumTextStyle(
                                            AppColors.primaryColor, 12.sp),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Assign Guards:',
                                        style: AppFontStyle.regularTextStyle(
                                            AppColors.textColor, 12.sp),
                                      ),
                                      Text(
                                        ' 07 ',
                                        style: AppFontStyle.mediumTextStyle(
                                            AppColors.primaryColor, 12.sp),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Shift Name:',
                                        style: AppFontStyle.regularTextStyle(
                                            AppColors.textColor, 12.sp),
                                      ),
                                      Text(
                                        ' Suhana shift',
                                        style: AppFontStyle.mediumTextStyle(
                                            AppColors.primaryColor, 12.sp),
                                      ),
                                      Text(
                                        ' | ',
                                        style: AppFontStyle.mediumTextStyle(
                                            AppColors.primaryBackColor, 12.sp),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Total Checkpoint:',
                                            style:
                                                AppFontStyle.regularTextStyle(
                                                    AppColors.textColor, 12.sp),
                                          ),
                                          Text(
                                            ' 07 ',
                                            style: AppFontStyle.mediumTextStyle(
                                                AppColors.primaryColor, 12.sp),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: InkWell(
                              onTap: () {
                                showModalBottomSheet<int>(
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (context) {
                                    return AppBottomSheet(
                                      child: Container(
                                        color: AppColors.white,
                                        child: Column(children: [
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                               Navigator.of(context).pop();
                                              Get.toNamed('/route_detail_screen');
                                            },
                                            child: Center(
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                    top: 15.h, bottom: 16.h),
                                                height: 48.h,
                                                width: Get.width - 80,
                                                decoration: const BoxDecoration(
                                                  border: Border(
                                                    bottom: BorderSide(
                                                      color:
                                                          AppColors.grayColor,
                                                      width: 1,
                                                    ),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'View Route',
                                                      style: AppFontStyle
                                                          .regularTextStyle(
                                                              AppColors
                                                                  .textColor,
                                                              14.sp),
                                                    ),
                                                    const Icon(
                                                      Icons.cable,
                                                      color: AppColors
                                                          .primaryColor,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                              Get.toNamed('/route_map_with_checkpoint_screen');
                                            },
                                            child: Center(
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                    top: 15.h, bottom: 16.h),
                                                height: 48.h,
                                                width: Get.width - 80,
                                                decoration: BoxDecoration(
                                                  border: Border(
                                                    bottom: BorderSide(
                                                      color:
                                                          AppColors.grayColor,
                                                      width: 1.w,
                                                    ),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'View On Map',
                                                      style: AppFontStyle
                                                          .regularTextStyle(
                                                              AppColors
                                                                  .textColor,
                                                              14.sp),
                                                    ),
                                                    const Icon(
                                                      Icons.location_on,
                                                      color: AppColors
                                                          .primaryColor,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                              Get.toNamed('/edit_route');
                                            },
                                            child: Center(
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                    top: 15.h, bottom: 16.h),
                                                height: 48.h,
                                                width: Get.width - 80,
                                                decoration: BoxDecoration(
                                                  border: Border(
                                                    bottom: BorderSide(
                                                      color:
                                                          AppColors.grayColor,
                                                      width: 1.w,
                                                    ),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Edit Route',
                                                      style: AppFontStyle
                                                          .regularTextStyle(
                                                              AppColors
                                                                  .textColor,
                                                              14.sp),
                                                    ),
                                                    const Icon(
                                                      Icons.edit_square,
                                                      color: AppColors
                                                          .primaryColor,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.of(context)
                                                            .pop();
                                                        Get.dialog(
                                                          Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Padding(
                                                                padding: const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        32),
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .all(
                                                                      Radius.circular(
                                                                          5.r),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(
                                                                            20.0),
                                                                    child:
                                                                        Material(
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          Text(
                                                                            "Are you sure you want to delete this route?",
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style:
                                                                                AppFontStyle.mediumTextStyle(AppColors.textColor, 14.sp),
                                                                          ),
                                                                          SizedBox(
                                                                              height: 20.h),
                                                                          //Buttons
                                                                          Row(
                                                                            children: [
                                                                              Expanded(
                                                                                child: ElevatedButton(
                                                                                  style: ElevatedButton.styleFrom(
                                                                                      minimumSize: Size(0, 35.h),
                                                                                      backgroundColor: AppColors.white,
                                                                                      foregroundColor: AppColors.primaryColor,
                                                                                      textStyle: AppFontStyle.semiboldTextStyle(AppColors.primaryColor, 16.sp),
                                                                                      shape: RoundedRectangleBorder(
                                                                                        borderRadius: BorderRadius.circular(6.r),
                                                                                        side: BorderSide(
                                                                                          color: AppColors.primaryColor,
                                                                                          width: 1.w,
                                                                                        ),
                                                                                      )),
                                                                                  onPressed: () {
                                                                                    Get.back();
                                                                                  },
                                                                                  child: Text(
                                                                                    "Delete",
                                                                                    style: AppFontStyle.semiboldTextStyle(AppColors.primaryColor, 16.sp),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              SizedBox(width: 10.w),
                                                                              Expanded(
                                                                                child: ElevatedButton(
                                                                                  style: ElevatedButton.styleFrom(
                                                                                    minimumSize: Size(0, 35.h),
                                                                                    backgroundColor: AppColors.primaryColor,
                                                                                    textStyle: AppFontStyle.semiboldTextStyle(AppColors.white, 16.sp),
                                                                                    shape: RoundedRectangleBorder(
                                                                                      borderRadius: BorderRadius.circular(6.r),
                                                                                    ),
                                                                                  ),
                                                                                  onPressed: () {
                                                                                    Get.back();
                                                                                  },
                                                                                  child: Text(
                                                                                    "Cancel",
                                                                                    style: AppFontStyle.semiboldTextStyle(AppColors.white, 16.sp),
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
                                                          ),
                                                        );
                                            },
                                            child: Center(
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                    top: 15.h, bottom: 16.h),
                                                height: 48.h,
                                                width: Get.width - 80.w,
                                                decoration: BoxDecoration(
                                                  border: Border(
                                                    bottom: BorderSide(
                                                      color:
                                                          AppColors.grayColor,
                                                      width: 1.w,
                                                    ),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Delete Route',
                                                      style: AppFontStyle
                                                          .regularTextStyle(
                                                              AppColors
                                                                  .textColor,
                                                              14.sp),
                                                    ),
                                                    const Icon(
                                                      Icons.delete,
                                                      color: AppColors
                                                          .primaryColor,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Center(
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                  top: 4.h, bottom: 4.h),
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
                                            ),
                                          ),
                                        ]),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: const Icon(
                                Icons.more_vert,
                              ),
                            )),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          );
        });
  }
}