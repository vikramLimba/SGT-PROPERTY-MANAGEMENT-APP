import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgt_owner/shared/widgets/custom_bottomsheet.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';

class CheckpointList extends StatefulWidget {
  const CheckpointList({super.key});

  @override
  State<CheckpointList> createState() => _CheckpointListState();
}

class _CheckpointListState extends State<CheckpointList> {

  final List<String> items = [
    'Hallway Checkpoint',
    'Hyatt Checkpoint',
    'Ramada Checkpoint',
    'Marriot Checkpoint',
    'Novotel Checkpoint',
    'Clarks Checkpoint',
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
                          child: GestureDetector(
                            onTap:() {
                              Get.toNamed("/checkpoint_detail_screen");
                            },
                            child: Card(
                              margin: EdgeInsets.all(2.w),
                              color: AppColors.white,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/QR_Sample.png',
                                        width: 99.w,
                                        height: 72.h,
                                        fit: BoxFit.contain,
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            items[index].toString(),
                                            style: AppFontStyle.mediumTextStyle(
                                                AppColors.primaryColor, 14.sp),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Property:',
                                                style:
                                                    AppFontStyle.regularTextStyle(
                                                        AppColors.textColor,
                                                        12.sp),
                                              ),
                                              Text(
                                                ' Radission Blu Hotel ',
                                                style:
                                                    AppFontStyle.mediumTextStyle(
                                                        AppColors.primaryColor,
                                                        12.sp),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Checkpoint Tasks:',
                                                style:
                                                    AppFontStyle.regularTextStyle(AppColors.textColor,12.sp),
                                              ),
                                              Text(
                                                ' 04 ',
                                                style:
                                                    AppFontStyle.mediumTextStyle(AppColors.primaryColor,12.sp),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Center(
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
                                                Get.toNamed("/checkpoint_detail_screen");
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
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'View Checkpoint',
                                                        style: AppFontStyle
                                                            .regularTextStyle(
                                                                AppColors
                                                                    .textColor,
                                                                14.sp),
                                                      ),
                                                      Icon(
                                                        Icons.location_on_outlined,
                                                        // FontAwesome5.images,
                                                        color: AppColors
                                                            .primaryColor,
                                                        size: 22.w,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).pop();
                                                Get.toNamed('/edit_checkpoint_and_task');
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
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Edit Checkpoint & Task',
                                                        style: AppFontStyle
                                                            .regularTextStyle(
                                                                AppColors
                                                                    .textColor,
                                                                14.sp),
                                                      ),
                                                      Icon(
                                                        Icons.edit_outlined,
                                                        color: AppColors
                                                            .primaryColor,
                                                        size: 22.w,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).pop();
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
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Download Checkpoint QR',
                                                        style: AppFontStyle
                                                            .regularTextStyle(
                                                                AppColors
                                                                    .textColor,
                                                                14.sp),
                                                      ),
                                                      Icon(
                                                        Icons.download_rounded,
                                                        // FontAwesome5.images,
                                                        color: AppColors
                                                            .primaryColor,
                                                        size: 22.w,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).pop();
                                                Get.dialog(
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    32.h),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                  5.r),
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(20.0),
                                                            child: Material(
                                                              child: Column(
                                                                children: [
                                                                  Text(
                                                                    "Are you sure you want to delete this checkpoint?",
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: AppFontStyle.mediumTextStyle(
                                                                        AppColors
                                                                            .textColor,
                                                                        14.sp),
                                                                  ),
                                                                  SizedBox(
                                                                      height:
                                                                          20.h),
                                                                  //Buttons
                                                                  Row(
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            ElevatedButton(
                                                                          style: ElevatedButton.styleFrom(
                                                                              minimumSize: Size(0, 35.h),
                                                                              backgroundColor: AppColors.white,
                                                                              foregroundColor: AppColors.primaryColor,
                                                                              textStyle: AppFontStyle.semiboldTextStyle(AppColors.primaryColor, 16.sp),
                                                                              shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(6.r),
                                                                                side: BorderSide(
                                                                                  color: AppColors.primaryColor,
                                                                                  width: 1.0.w,
                                                                                ),
                                                                              )),
                                                                          onPressed:
                                                                              () {
                                                                            Get.back();
                                                                          },
                                                                          child:
                                                                              const Text(
                                                                            'Delete',
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                          width:
                                                                              10.w),
                                                                      Expanded(
                                                                        child:
                                                                            ElevatedButton(
                                                                          style:
                                                                              ElevatedButton.styleFrom(
                                                                            minimumSize:
                                                                                Size(0, 35.h),
                                                                            backgroundColor:
                                                                                AppColors.primaryColor,
                                                                            textStyle:
                                                                                AppFontStyle.semiboldTextStyle(AppColors.white, 16.sp),
                                                                            shape:
                                                                                RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(6.r),
                                                                            ),
                                                                          ),
                                                                          onPressed:
                                                                              () {
                                                                            Get.back();
                                                                          },
                                                                          child:
                                                                              const Text(
                                                                            'Cancel',
                                                                            style:
                                                                                TextStyle(color: AppColors.white),
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
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Delete',
                                                        style: AppFontStyle
                                                            .regularTextStyle(
                                                                AppColors
                                                                    .textColor,
                                                                14.sp),
                                                      ),
                                                      Icon(
                                                        Icons.delete_outline,
                                                        color: AppColors
                                                            .primaryColor,
                                                        size: 26.w,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).pop();
                                                Get.toNamed('/checkpoint_history_screen');
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
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'View History',
                                                        style: AppFontStyle
                                                            .regularTextStyle(
                                                                AppColors
                                                                    .textColor,
                                                                14.sp),
                                                      ),
                                                      Icon(
                                                        Icons.more_time_sharp,
                                                        // FontAwesome5.images,
                                                        color: AppColors
                                                            .primaryColor,
                                                        size: 22.w,
                                                      ),
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
                                                      color:
                                                          AppColors.grayColor,
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
                                  color: AppColors.primaryColor,
                                )),
                          )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    });
  }
}