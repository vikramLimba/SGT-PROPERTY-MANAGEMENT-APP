import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgt_owner/feature/Guards/assign_duty/shared/view/assignDuty_progress_bar.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';

class PropertiesPage extends StatefulWidget {
  const PropertiesPage({super.key});

  @override
  State<PropertiesPage> createState() => _PropertiesPageState();
}

class _PropertiesPageState extends State<PropertiesPage> {
  Widget selectedGuardsCard = Get.arguments["selectedGuardsCard"];

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
      "address": "1901 Thornridge Circle lane street ...",
      "shifts": " 03"
    }
  ];

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
                  child: const AssignDutyProgrssBar(currentIndex: 1),
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
                            Get.back();
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
              Text(
                'Select Property',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              propertiesCard()
            ],
          ),
        ),
      ),
    );
  }

  Widget propertiesCard() {
    bool? isSelected;

    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: propertiesData.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                Get.toNamed('/RoutePage', arguments: {
                  "selectedGuardsCard": selectedGuardsCard,
                  "selectedPropertyCard": card(index, isSelected = true)
                });
              },
              child: card(index, isSelected));
        });
  }

  Widget card(index, isSelected) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: SizedBox(
        height: 88.h,
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
            Image.asset(
              propertiesData[index]["image"],
              width: 80.w,
              height: 84.h,
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
      ),
    );
  }
}
