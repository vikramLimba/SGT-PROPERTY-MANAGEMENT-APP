import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';
import 'package:flutter_svg/svg.dart';

class DocsTab extends StatefulWidget {
  const DocsTab({super.key});

  @override
  State<DocsTab> createState() => _DocsTabState();
}

class _DocsTabState extends State<DocsTab> {
  final List<String> docsList = [
    'National ID.pdf',
    'Driving Licence.pdf',
    'Passport.pdf',
    'Gun License.pdf',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: docsList.length,
            itemBuilder: (context, index) {
              return Container(
                  margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                  width: Get.width - 32.w,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(Radius.elliptical(5.r, 5.r)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: ListTile(
                    minVerticalPadding:5.h,
                    horizontalTitleGap: 15.w,
                    contentPadding: EdgeInsets.only(left: 2.w),
                    leading: SvgPicture.asset(
                      "assets/docs.svg",
                      width: 56.w,
                      height: 61.h,
                    ),
                    title: Text(
                      docsList[index],
                      style: AppFontStyle.regularTextStyle(AppColors.textColor,12.sp)
                    ),
                    subtitle: Text(
                      '1 Page-90 KB-pdf',
                      style: AppFontStyle.regularTextStyle(AppColors.grayColor,12.sp)
                    ),
                    onTap: () {
                      // Get.toNamed("/GuardProfile");
                    },
                  ));
            }),
      ),
    );
  }
}
