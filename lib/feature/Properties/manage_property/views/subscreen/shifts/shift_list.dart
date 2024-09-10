import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgt_owner/shared/widgets/custom_bottomsheet.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';

class ShiftList extends StatefulWidget {
  const ShiftList({super.key});

  @override
  State<ShiftList> createState() => _ShiftListState();
}

class _ShiftListState extends State<ShiftList> {
  final List<String> items = [
    'Hallway shift',
    'Hallway shift',
    'Hallway shift',
    'Hallway shift',
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
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
              margin: EdgeInsets.all(2),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed("/shift_detail");
                  },
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Property Name",
                                style: AppFontStyle.regularTextStyle(
                                    AppColors.textColor, 12.sp),
                              ),
                              Text(
                                "Radission Blu Hotel",
                                style: AppFontStyle.semiboldTextStyle(
                                    AppColors.primaryColor, 14.sp),
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
                                                Get.toNamed('/edit_shift');
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
                                                        'Edit Shift details',
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
                                                                    "Are you sure you want to delete this shift?",
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
                                                        'Delete Shift',
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
                                                        'Download Shift QR',
                                                        style: AppFontStyle
                                                            .regularTextStyle(
                                                                AppColors
                                                                    .textColor,
                                                                14.sp),
                                                      ),
                                                      Icon(
                                                        Icons.qr_code,
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
                      Container(
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(5.r, 5.r)),
                          color: AppColors.primaryBackColor,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Shift Name",
                                      style: AppFontStyle.regularTextStyle(
                                          AppColors.textColor, 12.sp),
                                    ),
                                    Text(
                                      items[index].toString(),
                                      style: AppFontStyle.semiboldTextStyle(
                                          AppColors.primaryColor, 14.sp),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Clock In: ",
                                      style: AppFontStyle.mediumTextStyle(
                                          AppColors.textColor, 14.sp),
                                    ),
                                    Text(
                                      "08:00 AM",
                                      style: AppFontStyle.mediumTextStyle(
                                          AppColors.secondaryColor, 14.sp),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Clock Out: ",
                                      style: AppFontStyle.mediumTextStyle(
                                          AppColors.textColor, 14.sp),
                                    ),
                                    Text(
                                      "08:00 PM",
                                      style: AppFontStyle.mediumTextStyle(
                                          AppColors.secondaryColor, 14.sp),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
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
