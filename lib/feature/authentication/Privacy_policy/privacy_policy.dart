import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgt_owner/shared/widgets/custom_appbar.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  List<Map<dynamic, dynamic>> visbilityList = [
    {"visible": false, "title": "Introduction"},
    {"visible": false, "title": "Security Precautions"},
    {"visible": false, "title": "Data Retention"},
    {"visible": false, "title": "Your Rights"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        titleText: "Privacy Policy",
        isLeading: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16.h,
            ),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: visbilityList.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            visbilityList[index]["visible"] =
                                !visbilityList[index]["visible"];
                          });
                        },
                        child: Text(
                          visbilityList[index]["title"],
                          style: AppFontStyle.semiboldTextStyle(
                              AppColors.textColor, 16.sp),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Visibility(
                          visible: visbilityList[index]["visible"],
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 12.h),
                            child: Text(
                              "Lorem ipsum dolor sit amet consectetur. Porttitor interdum id porta sapien duis aenean. A magna erat ultricies tortor nulla in eget nunc. Dui consequat quis eu gravida egestas. Ut sed egestas pretium leo. Arcu volutpat gravida tincidunt faucibus ut enim ullamcorper odio magna. Dictumst nisi sed nec id. Elementum dui facilisi magna massa pharetra morbi nibh. Malesuada purus sagittis netus consectetur accumsan tempus vulputate. Consequat molestie magnis sed ullamcorper sodales ut sit sed fringilla. Fringilla tortor semper sagittis odio. Tempus aliquam scelerisque lectus facilisi maecenas cursus platea phasellus purus",
                              style: AppFontStyle.regularTextStyle(
                                  AppColors.secondaryColor, 12.sp),
                            ),
                          )),
                      SizedBox(
                        height: 16.h,
                      ),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
}
