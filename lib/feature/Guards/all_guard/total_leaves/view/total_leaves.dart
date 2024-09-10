import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgt_owner/shared/widgets/custom_bottomsheet.dart';
import 'package:sgt_owner/style/colors.dart';

class TotalLeaves extends StatefulWidget {
  const TotalLeaves({super.key});

  @override
  State<TotalLeaves> createState() => _TotalLeavesState();
}

class _TotalLeavesState extends State<TotalLeaves> {
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
            child: buildLeavesCard()),
    );
  }

  Widget buildLeavesCard() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'All Guard',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
            Row(
              children: [
                Text(
                  'Filter',
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  alignment: Alignment.centerRight,
                  onPressed: () {
                    showModalFilter();
                  },
                  icon: const Icon(Icons.keyboard_arrow_down_rounded),
                  color: AppColors.primaryColor,
                )
              ],
            )
          ],
        ),
        buildCardlist(),
      ],
    );
  }

  Widget buildCardlist() {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 8,
        itemBuilder: (context, index) {
          return buildCard();
        });
  }

  Widget buildCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
      elevation: 2.h,
      margin: EdgeInsets.only(bottom: 8.h),
      surfaceTintColor: AppColors.white,
      shadowColor: AppColors.secondaryColor,
      child: Padding(
        padding: EdgeInsets.all(8.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 60.h,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Image.asset('assets/guard_5.png'),
            ),
            SizedBox(
              width: 8.w,
            ),
            SizedBox(
              width: 228.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Larko Makson',
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  RichText(
                      text: TextSpan(
                          text: "Subject:",
                          style: TextStyle(
                              color: AppColors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500),
                          children: [
                        TextSpan(
                          text: " Sick Leave",
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500),
                        )
                      ])),
                  SizedBox(
                    height: 4.h,
                  ),
                  RichText(
                      text: TextSpan(
                          text: "Requested Date:",
                          style: TextStyle(
                              color: AppColors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500),
                          children: [
                        TextSpan(
                          text: " 09/08/23 - 16/09/23",
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500),
                        )
                      ])),
                  SizedBox(
                    height: 4.h,
                  ),
                  RichText(
                      text: TextSpan(
                          text: "Status:",
                          style: TextStyle(
                              color: AppColors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500),
                          children: [
                        TextSpan(
                          text: " Pending",
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500),
                        )
                      ]))
                ],
              ),
            )
          ],
        ),
      ),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RichText(
                            text: TextSpan(
                                text: "Edit Profile",
                                style: TextStyle(
                                    color: AppColors.textColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400),
                                children: [
                              TextSpan(
                                text: " (20)",
                                style: TextStyle(
                                    color: AppColors.secondaryColor,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
                              )
                            ])),
                        IconButton(
                            style: IconButton.styleFrom(
                                padding: EdgeInsets.zero,
                                alignment: Alignment.centerRight),
                            onPressed: () {
                              Navigator.of(context).pop();
                              // Get.to(() => EditGuardProfile());
                            },
                            icon: const Icon(
                              Icons.format_list_numbered_sharp,
                              color: AppColors.primaryColor,
                            )
                            // Image.asset(
                            //   "assets/profile.png",
                            //   height: 20.h,
                            // )
                            )
                      ],
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RichText(
                            text: TextSpan(
                                text: "Approved Leaves",
                                style: TextStyle(
                                    color: AppColors.textColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400),
                                children: [
                              TextSpan(
                                text: " (08)",
                                style: TextStyle(
                                    color: AppColors.secondaryColor,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
                              )
                            ])),
                        IconButton(
                            padding: EdgeInsets.zero,
                            alignment: Alignment.centerRight,
                            onPressed: () {
                              Navigator.pop(context);
                              Get.toNamed("/PasswordPage");
                            },
                            icon: const Icon(
                              Icons.check_circle_outline,
                              color: AppColors.primaryColor,
                            ))
                      ],
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RichText(
                            text: TextSpan(
                                text: "Rejected Leaves",
                                style: TextStyle(
                                    color: AppColors.textColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400),
                                children: [
                              TextSpan(
                                text: " (06)",
                                style: TextStyle(
                                    color: AppColors.secondaryColor,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
                              )
                            ])),
                        IconButton(
                            padding: EdgeInsets.zero,
                            alignment: Alignment.centerRight,
                            onPressed: () {
                              Navigator.pop(context);
                              // _showDialogSendApp();
                            },
                            icon: const Icon(
                              Icons.block,
                              color: AppColors.primaryColor,
                            ))
                      ],
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RichText(
                            text: TextSpan(
                                text: "Pending Leaves",
                                style: TextStyle(
                                    color: AppColors.textColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400),
                                children: [
                              TextSpan(
                                text: " (06)",
                                style: TextStyle(
                                    color: AppColors.secondaryColor,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
                              )
                            ])),
                        IconButton(
                            style: IconButton.styleFrom(
                              padding: EdgeInsets.zero,
                              alignment: Alignment.centerRight,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              // _showDialogDeleteProfile();
                            },
                            icon: Icon(
                              Icons.schedule,
                              color: AppColors.primaryColor,
                              size: 20.h,
                            ))
                      ],
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
