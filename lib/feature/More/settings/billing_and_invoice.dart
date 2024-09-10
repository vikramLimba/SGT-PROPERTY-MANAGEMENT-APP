import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgt_owner/shared/widgets/custom_appbar.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';
import 'package:flutter_svg/svg.dart';

class BillingAndInvoice extends StatefulWidget {
  const BillingAndInvoice({super.key});

  @override
  State<BillingAndInvoice> createState() => _BillingAndInvoiceState();
}

class _BillingAndInvoiceState extends State<BillingAndInvoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        titleText: "Billing & Invoice",
        isLeading: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Current Membership Details",
              style: AppFontStyle.semiboldTextStyle(AppColors.textColor, 16.sp),
            ),
            SizedBox(
              height: 16.h,
            ),
            Container(
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(6.r)),
              child: Column(
                children: [
                  SizedBox(
                    height: 12.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Plan ",
                          style: AppFontStyle.semiboldTextStyle(
                              AppColors.textColor, 26.sp),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              "assets/piggyBank.png",
                              height: 24.h,
                              width: 24.w,
                            ),
                            SizedBox(
                              width: 6.w,
                            ),
                            Text(
                              "Silver",
                              style: AppFontStyle.mediumTextStyle(
                                  AppColors.textColor, 24.sp),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Text(
                              "\$35/month",
                              style: AppFontStyle.regularTextStyle(
                                  AppColors.primaryColor, 16.sp),
                            ),
                          ],
                        ).paddingOnly(bottom: 15.h)
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(6.r),
                        bottomLeft: Radius.circular(6.r))),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Next Billing Date",
                              style: AppFontStyle.mediumTextStyle(
                                  AppColors.white, 16.sp),
                            ),
                            Text(
                              "Payment Method",
                              style: AppFontStyle.mediumTextStyle(
                                  AppColors.white, 16.sp),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 150.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.r))),
                            child: Center(
                              child: Text(
                                "10 AUG 2023",
                                style: AppFontStyle.mediumTextStyle(
                                    AppColors.primaryColor, 14.sp),
                              ),
                            ),
                          ),
                          Container(
                            width: 150.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.r))),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset("assets/master-card.svg"),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  Text(
                                    "XXX6697",
                                    style: AppFontStyle.mediumTextStyle(
                                        AppColors.primaryColor, 14.sp),
                                  ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: AppColors.grayColor,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
            SizedBox(
              height: 16.h,
            ),
            Text(
              "Invoices",
              style: AppFontStyle.semiboldTextStyle(AppColors.black, 16.sp),
            ),
            SizedBox(
              height: 16.h,
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 8,
                itemBuilder: (context, IndexError) {
                  return Container(
                    width: double.infinity,
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
                    child: Padding(
                      padding: EdgeInsets.all(8.h),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                    text: "Subscription Plan:",
                                    style: AppFontStyle.mediumTextStyle(
                                        AppColors.textColor, 14.sp),
                                    children: [
                                      TextSpan(
                                        text: " Silver",
                                        style: AppFontStyle.mediumTextStyle(
                                            AppColors.primaryColor, 14.sp),
                                      )
                                    ]),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              RichText(
                                text: TextSpan(
                                    text: "Subscription Period:",
                                    style: AppFontStyle.mediumTextStyle(
                                        AppColors.textColor, 14.sp),
                                    children: [
                                      TextSpan(
                                        text: " Monthly",
                                        style: AppFontStyle.mediumTextStyle(
                                            AppColors.primaryColor, 14.sp),
                                      )
                                    ]),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              RichText(
                                text: TextSpan(
                                    text: "Payment Method:",
                                    style: AppFontStyle.mediumTextStyle(
                                        AppColors.textColor, 14.sp),
                                    children: [
                                      TextSpan(
                                        text: " XXX6669",
                                        style: AppFontStyle.mediumTextStyle(
                                            AppColors.primaryColor, 14.sp),
                                      )
                                    ]),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              RichText(
                                text: TextSpan(
                                    text: "Amount:",
                                    style: AppFontStyle.mediumTextStyle(
                                        AppColors.textColor, 14.sp),
                                    children: [
                                      TextSpan(
                                        text: " \$35",
                                        style: AppFontStyle.mediumTextStyle(
                                            AppColors.primaryColor, 14.sp),
                                      )
                                    ]),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              RichText(
                                text: TextSpan(
                                    text: "Date:",
                                    style: AppFontStyle.mediumTextStyle(
                                        AppColors.textColor, 14.sp),
                                    children: [
                                      TextSpan(
                                        text: " 10/08/2023",
                                        style: AppFontStyle.mediumTextStyle(
                                            AppColors.primaryColor, 14.sp),
                                      )
                                    ]),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                            ],
                          ),
                          Positioned(
                              right: 0,
                              child: Icon(
                                Icons.file_download_outlined,
                                color: AppColors.primaryColor,
                                size: 22.h,
                              ))
                        ],
                      ),
                    ),
                  ).paddingOnly(bottom: 5.h);
                }),
          ],
        ),
      ),
    );
  }
}
