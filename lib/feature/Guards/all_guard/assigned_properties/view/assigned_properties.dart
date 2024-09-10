import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgt_owner/style/colors.dart';

class AssignedProperties extends StatefulWidget {
  const AssignedProperties({super.key});

  @override
  State<AssignedProperties> createState() => _AssignedPropertiesState();
}

class _AssignedPropertiesState extends State<AssignedProperties> {
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
          child: Column(
            children: [propertiesCard()],
          ),
        ),
    );
  }

  Widget propertiesCard() {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 7,
        itemBuilder: (context, index) {
          return card();
        });
  }

  Widget card() {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
        elevation: 2.h,
        margin: EdgeInsets.only(bottom: 8.h),
        surfaceTintColor: AppColors.white,
        shadowColor: AppColors.grayColor,
        child: Row(
          children: [
            Image.asset(
              'assets/properties-12.png',
              width: 80.w,
              height: 84.h,
              fit: BoxFit.fill,
            ),
            SizedBox(
              width: 12.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'All Guard',
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  '1901 Thornridge Circle lane street ...',
                  style:
                      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 4.h,
                ),
                RichText(
                    text: TextSpan(
                        text: "Position:",
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryColor,
                            overflow: TextOverflow.ellipsis),
                        children: [
                      TextSpan(
                          text: " Supervisor",
                          style: TextStyle(
                              color: AppColors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              overflow: TextOverflow.ellipsis))
                    ])),
              ],
            )
          ],
        ));
  }
}
