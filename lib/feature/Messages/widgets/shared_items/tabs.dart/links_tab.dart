import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';
import 'package:flutter_svg/svg.dart';

class LinksTab extends StatefulWidget {
  const LinksTab({super.key});

  @override
  State<LinksTab> createState() => _LinksTabState();
}

class _LinksTabState extends State<LinksTab> {
  final List<String> linksList = [
    'https://www.freepik.com/free-vector/falling-golden-stars-dust-shooting-star-with-rounded-isolated_10817230.htm#query=star&position=19&from_view=keyword&track=sph',
    'https://www.freepik.com/free-vector/falling-golden-stars-dust-shooting-star-with-rounded-isolated_10817230.htm#query=star&position=19&from_view=keyword&track=sph',
    'https://www.freepik.com/free-vector/falling-golden-stars-dust-shooting-star-with-rounded-isolated_10817230.htm#query=star&position=19&from_view=keyword&track=sph',
    'https://www.freepik.com/free-vector/falling-golden-stars-dust-shooting-star-with-rounded-isolated_10817230.htm#query=star&position=19&from_view=keyword&track=sph',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: linksList.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.black.withOpacity(0.15),
                          offset: Offset(0.w, 2.h),
                          blurRadius: 6.r,
                          spreadRadius: 0)
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(6.r))),
                child: Row(
                  children: [
                    Container(
                      height: 82.h,
                      width: 69.w,
                      decoration: BoxDecoration(
                          color: AppColors.disableColor,
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.black.withOpacity(0.15),
                                offset: Offset(0.w, 2.h),
                                blurRadius: 6.r,
                                spreadRadius: 0)
                          ],
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(6.r),
                              bottomLeft: Radius.circular(6.r))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: 35.w,
                            height: 35.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.black.withOpacity(0.15),
                                    offset: Offset(0.w, 2.h),
                                    blurRadius: 6.r,
                                    spreadRadius: 0)
                              ],
                            ),
                            child: SvgPicture.asset(
                              "assets/links.svg",
                              width: 24.w,
                              height: 21.h,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.h),
                        child: Text(
                          "https://www.freepik.com/free-vector/falling-golden-stars-dust-shooting-star-with-rounded-isolated_10817230.htm#query=star&position=19&from_view=keyword&track=sph ",
                          softWrap: true,
                          style: AppFontStyle.regularTextStyle(
                              AppColors.textColor, 12.sp),
                        ),
                      ),
                    ),
                  ],
                ),
              ).marginOnly(bottom: 8.h);
            }),
      ),
    );
  }
}
