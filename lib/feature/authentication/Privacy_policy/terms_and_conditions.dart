import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgt_owner/shared/widgets/custom_appbar.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key});

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  bool _isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        titleText: "Terms & Conditions",
        isLeading: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            SizedBox(
              height: 16.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      _isVisible = !_isVisible;
                    });
                  },
                  child: Text(
                    "SGT Terms & Conditions",
                    style: AppFontStyle.semiboldTextStyle(
                        AppColors.textColor, 16.sp),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Visibility(
                    visible: _isVisible,
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
                Text(
                  "User Account, Password, and Security:",
                  style: AppFontStyle.semiboldTextStyle(
                      AppColors.textColor, 16.sp),
                ),
                SizedBox(
                  height: 14.h,
                ),
                Text(
                  "Services Offered:",
                  style: AppFontStyle.semiboldTextStyle(
                      AppColors.textColor, 16.sp),
                ),
                SizedBox(
                  height: 14.h,
                ),
                Text(
                  "Payments:",
                  style: AppFontStyle.semiboldTextStyle(
                      AppColors.textColor, 16.sp),
                ),
                SizedBox(
                  height: 14.h,
                ),
                Text(
                  "Disclaimer:",
                  style: AppFontStyle.semiboldTextStyle(
                      AppColors.textColor, 16.sp),
                ),
                SizedBox(
                  height: 14.h,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
