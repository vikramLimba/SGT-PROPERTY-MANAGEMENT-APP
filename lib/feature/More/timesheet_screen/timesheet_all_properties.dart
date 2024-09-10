import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgt_owner/shared/widgets/custom_appbar.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';

class TimesheetAllProperties extends StatefulWidget {
  const TimesheetAllProperties({super.key});

  @override
  State<TimesheetAllProperties> createState() => _TimesheetAllPropertiesState();
}

class _TimesheetAllPropertiesState extends State<TimesheetAllProperties> {
  List<Map<dynamic, dynamic>> propertiesData = [
    {
      "image": "assets/propeties-1.png",
      "title": "The Chocolate Factory",
      "address": "1901 Thornridge Circle lane street ...",
      "shifts": " 03"
    },
    {
      "image": "assets/propeties-2.png",
      "title": "Garden Bay Society",
      "address": "1901 Thornridge Circle lane street ...",
      "shifts": " 03"
    },
    {
      "image": "assets/propeties-3.png",
      "title": "Ramada Plaza Hotel",
      "address": "1901 Thornridge Circle lane street ...",
      "shifts": " 03"
    },
    {
      "image": "assets/propeties-4.png",
      "title": "Novotel Resort",
      "address": "1901 Thornridge Circle lane street ...",
      "shifts ": "  03"
    },
    {
      "image": "assets/propeties-5.png",
      "title": "Hayatt Regency Hotel",
      "address":
          "1901 Thornridge Circle lane streetadsfadfadsfadsfadsfdssdfasfs ...",
      "shifts": " 03"
    },
    {
      "image": "assets/propeties-4.png",
      "title": "Novotel Resort",
      "address": "1901 Thornridge Circle lane street ...",
      "shifts ": "  03"
    },
    {
      "image": "assets/propeties-1.png",
      "title": "The Chocolate Factory",
      "address": "1901 Thornridge Circle lane street ...",
      "shifts": " 03"
    },
    {
      "image": "assets/propeties-5.png",
      "title": "Hayatt Regency Hotel",
      "address": "1901 Thornridge Circle lane street ...",
      "shifts": " 03"
    },
    {
      "image": "assets/propeties-4.png",
      "title": "Novotel Resort",
      "address": "1901 Thornridge Circle lane street ...",
      "shifts ": "  03"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        titleText: 'Timesheet',
        isLeading: true,
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0.h),
          physics: const BouncingScrollPhysics(),
          child: allProperties()),
    );
  }

  Widget allProperties() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "All Properties",
          style: AppFontStyle.semiboldTextStyle(AppColors.textColor, 16.sp),
        ),
        SizedBox(
          height: 16.h,
        ),
        propertiesCardList()
      ],
    );
  }

  Widget propertiesCardList() {
    return ListView.builder(
        clipBehavior: Clip.none,
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: propertiesData.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                // Get.toNamed('/DayTimesheet',
                //     arguments: {"selectedPropertyCard": card(index)});
              },
              child: card(index));
        });
  }

  Widget card(index) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/DayTimesheet',
            arguments: {"selectedPropertyCard": card(index)});
      },
      child: Card(
        margin: EdgeInsets.only(bottom: 12.h),
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        elevation: 2.h,
        color: AppColors.white,
        shadowColor: AppColors.secondaryColor.withOpacity(0.5),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Image.asset(
            propertiesData[index]["image"],
            width: 80.w,
            height: 80.h,
            fit: BoxFit.fill,
          ),
          SizedBox(
            width: 225.w,
            child: Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    propertiesData[index]['title'],
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.ellipsis),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    propertiesData[index]['address'],
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  RichText(
                      text: TextSpan(
                          text: "Shifts:",
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                              overflow: TextOverflow.ellipsis),
                          children: [
                        TextSpan(
                            text: propertiesData[index]['shifts'],
                            style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                overflow: TextOverflow.ellipsis))
                      ])),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
