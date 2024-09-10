import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgt_owner/feature/Guards/assign_duty/shared/view/assignDuty_progress_bar.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';

class RoutePage extends StatefulWidget {
  const RoutePage({super.key});

  @override
  State<RoutePage> createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  Widget selectedGuardsCard = Get.arguments["selectedGuardsCard"];
  Widget selectedPropertyCard = Get.arguments["selectedPropertyCard"];

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
        title: Text(
          'Assign Duty',
          style: AppFontStyle.semiboldTextStyle(AppColors.black, 17.sp),
        ),
        titleSpacing: 8,
        centerTitle: false,
        toolbarHeight: 63.h,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.h),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: AppColors.white,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 8.h),
                  child: const AssignDutyProgrssBar(currentIndex: 2),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Selected Guard',
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                      height: 19.h,
                      child: TextButton(
                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                          onPressed: () {
                            Get.toNamed(
                              '/GuardsPage',
                            );
                          },
                          child: Text(
                            "Change Guard",
                            style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500),
                          )))
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
              Container(
                child: selectedGuardsCard,
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Selected Property',
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                      height: 19.h,
                      child: TextButton(
                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                          onPressed: () {
                            Get.back();
                          },
                          child: Text(
                            "Change Property",
                            style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500),
                          ))),
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
              Container(
                child: selectedPropertyCard,
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Select Routes',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 12.h,
              ),
              routesCard()
            ],
          ),
        ),
      ),
    );
  }

  Widget routesCard() {
    bool? isSelected;
    return ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                Get.toNamed("/AssignGuard", arguments: {
                  "selectedGuardsCard": selectedGuardsCard,
                  "selectedPropertyCard": selectedPropertyCard,
                  "selectedRoutesCard": card(index, isSelected = true)
                });
              },
              child: card(index, isSelected));
        });
  }

  Widget card(index, isSelected) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3.h),
      child: SizedBox(
        height: 84.h,
        child: Card(
          margin: EdgeInsets.zero,
          surfaceTintColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          elevation: 4.h,
          color:
              isSelected == true ? AppColors.primaryBackColor : AppColors.white,
          shadowColor: AppColors.grayColor,
          child: Row(children: [
            SizedBox(
                child: isSelected == true
                    ? RotatedBox(
                        quarterTurns: (1),
                        child: Container(
                          height: 16.h,
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(5.r),
                                  bottomRight: Radius.circular(5.r))),
                          child: Center(
                            child: Text(
                              "Selected",
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 12.h,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      )
                    : null),
            Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Radission Blu Hotel ${index + 1}",
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  RichText(
                      text: TextSpan(
                          text: "Shifts Name:",
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                              overflow: TextOverflow.ellipsis),
                          children: [
                        TextSpan(
                            text: " Suhana Shift",
                            style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                overflow: TextOverflow.ellipsis))
                      ])),
                  SizedBox(
                    height: 4.h,
                  ),
                  RichText(
                      text: TextSpan(
                          text: "From Date:",
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                              overflow: TextOverflow.ellipsis),
                          children: [
                        TextSpan(
                            text: " 01 JAN 2023 - 31 DEC 2023",
                            style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                overflow: TextOverflow.ellipsis))
                      ])),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
