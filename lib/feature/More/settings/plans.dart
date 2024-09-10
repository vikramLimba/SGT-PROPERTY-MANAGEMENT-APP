// import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgt_owner/feature/More/settings/cancel_subscriptions.dart';
// import 'package:sgt_owner/feature/authentication/payment/views/select_plan_screen.dart';
import 'package:sgt_owner/shared/widgets/custom_appbar.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';
import 'package:flutter_svg/svg.dart';

class PlansPage extends StatefulWidget {
  const PlansPage({super.key});

  @override
  State<PlansPage> createState() => _PlansPageState();
}

class _PlansPageState extends State<PlansPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        titleText: "Plans",
        isLeading: true,
      ),
      body: SingleChildScrollView(
          // padding: EdgeInsets.all(16.h),
          child: Column(
        children: [
          plans(),
        ],
      )),
    );
  }

  Widget plans() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 16.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            "Your Current Membership Details",
            style: AppFontStyle.semiboldTextStyle(AppColors.textColor, 16.sp),
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Container(
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
                        "Plan",
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
                      ).paddingOnly(bottom: 10.h),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Container(
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(6.r),
                      bottomLeft: Radius.circular(6.r))),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.w),
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
                                const Icon(
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
        ),
        SizedBox(
          height: 16.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50.h),
                  shadowColor: Colors.transparent,
                  surfaceTintColor: Colors.transparent,
                  backgroundColor: AppColors.redColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.r))),
              onPressed: () {
                Get.to(() => CancelSubscription());
              },
              child: Text(
                "Cancel Subscription",
                style: AppFontStyle.semiboldTextStyle(AppColors.white, 16.sp),
              )),
        ),
        SizedBox(
          height: 24.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Divider(
            height: 1.h,
            color: AppColors.hintColor,
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        const SelectedPlan()
      ],
    );
  }
}

class SelectedPlan extends StatefulWidget {
  const SelectedPlan({super.key});

  @override
  State<SelectedPlan> createState() => _SelectedPlanState();
}

class _SelectedPlanState extends State<SelectedPlan> {
  bool isChecked = true;

  bool isSelected = true;
  int? valueTab = 0;

  List<dynamic> checkboxSilverMonthly = [
    {'title': '5 Properties', 'value': false},
    {'title': '10 Shifts', 'value': false},
    {'title': '10 Checkpoints', 'value': false},
    {'title': '10 Guards', 'value': false},
    {'title': 'Messanger', 'value': false}
  ];
  List<dynamic> checkboxGoldMonthly = [
    {'title': '5 Properties', 'value': false},
    {'title': '10 Shifts', 'value': false},
    {'title': '10 Checkpoints', 'value': false},
    {'title': '10 Guards', 'value': false},
    {'title': 'Messanger', 'value': false}
  ];
  List<dynamic> checkboxPlatinumMonthly = [
    {'title': '5 Properties', 'value': false},
    {'title': '10 Shifts', 'value': false},
    {'title': '10 Checkpoints', 'value': false},
    {'title': '10 Guards', 'value': false},
    {'title': 'Messanger', 'value': false}
  ];
  List<dynamic> checkboxSilverYearly = [
    {'title': '5 Properties', 'value': false},
    {'title': '10 Shifts', 'value': false},
    {'title': '10 Checkpoints', 'value': false},
    {'title': '10 Guards', 'value': false},
    {'title': 'Messanger', 'value': false}
  ];
  List<dynamic> checkboxGoldYearly = [
    {'title': '5 Properties', 'value': false},
    {'title': '10 Shifts', 'value': false},
    {'title': '10 Checkpoints', 'value': false},
    {'title': '10 Guards', 'value': false},
    {'title': 'Messanger', 'value': false}
  ];
  List<dynamic> checkboxPlatinumYearly = [
    {'title': '5 Properties', 'value': false},
    {'title': '10 Shifts', 'value': false},
    {'title': '10 Checkpoints', 'value': false},
    {'title': '10 Guards', 'value': false},
    {'title': 'Messanger', 'value': false}
  ];

  TabBar get _tabBar => TabBar(
          onTap: (value) {
            setState(() {
              valueTab = value;
            });
          },
          labelPadding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
          tabAlignment: TabAlignment.center,
          labelStyle: AppFontStyle.mediumTextStyle(AppColors.textColor, 16.sp),
          unselectedLabelStyle:
              AppFontStyle.mediumTextStyle(AppColors.textColor, 16.sp),
          labelColor: Colors.white,
          indicator: const UnderlineTabIndicator(borderSide: BorderSide.none),
          dividerHeight: 0,
          padding: EdgeInsets.all(2.h),
          tabs: [
            Padding(
              padding: EdgeInsets.zero,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.r),
                  color:
                      valueTab == 0 ? Colors.indigo[900] : Colors.transparent,
                ),
                alignment: Alignment.center,
                width: 169.w,
                height: 28.h,
                child: const Text(
                  "Monthly  ",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(0.h),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.r),
                  color:
                      valueTab == 1 ? Colors.indigo[900] : Colors.transparent,
                ),
                alignment: Alignment.center,
                width: 169.w,
                height: 28.h,
                child: const Text(
                  "Yearly  ",
                ),
              ),
            ),
          ]);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, child: planList());
  }

  Widget planList() {
    return Column(
      children: [
        SizedBox(
          height: 32.h,
          child: PreferredSize(
              preferredSize: _tabBar.preferredSize,
              child: Material(
                borderRadius: BorderRadius.circular(8),
                color: const Color.fromARGB(255, 204, 204, 204),
                child: _tabBar,
              )),
        ),
        SizedBox(
          height: 16.h,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              "Change Plan",
              style: AppFontStyle.semiboldTextStyle(AppColors.textColor, 16.sp),
            ),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              "This account’s Silver Plan is set to \$339 per month and will renew on July 19, 2022.",
              style: AppFontStyle.regularTextStyle(AppColors.grayColor, 14.sp),
            ),
          ),
        ),
        SizedBox(
          height: 24.h,
        ),
        AspectRatio(
          aspectRatio: 0.4.h,
          child: TabBarView(children: [
            SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.only(top: 16.h),
                child: CarouselSlider(
                    items: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(7.r)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.w, vertical: 8.h),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 24.w,
                                      decoration: BoxDecoration(
                                          color: Colors.indigo[900],
                                          borderRadius:
                                              BorderRadius.circular(40)),
                                      child: const Image(
                                          image: AssetImage(
                                              'assets/silver_plan.png')),
                                    ),
                                    SizedBox(
                                      width: 6.w,
                                    ),
                                    Text(
                                      "Silver",
                                      style: TextStyle(
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Text(
                                    "Optimal  For 10+ team size and new startup",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                RichText(
                                    text: TextSpan(
                                        text: '\$100',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 24.h,
                                            fontWeight: FontWeight.w600),
                                        children: [
                                      TextSpan(
                                        text: "/mo",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.h,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ])),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Flexible(
                                  child: ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: checkboxSilverMonthly.length,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            CheckboxListTile(
                                              title: Text(
                                                checkboxSilverMonthly[index]
                                                    ['title'],
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14.h,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              checkboxShape:
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50.r)),
                                              value:
                                                  checkboxSilverMonthly[index]
                                                      ['value'],
                                              onChanged: (value) {
                                                setState(() {
                                                  checkboxSilverMonthly[index]
                                                      ['value'] = value!;
                                                });
                                              },
                                            ),
                                            SizedBox(
                                              height: 16.h,
                                            ),
                                          ],
                                        );
                                      }),
                                ),
                                SizedBox(
                                  height: 24.h,
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shadowColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(7.r)),
                                      minimumSize: Size(130.w, 35.h),
                                      foregroundColor: AppColors.white,
                                      backgroundColor: AppColors.disableColor,
                                    ),
                                    onPressed: () {
                                      Get.toNamed("/billing_address");
                                    },
                                    child: Text(
                                      "Current Plan",
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(7.r)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.w, vertical: 8.h),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 24.w,
                                      // height: 24.h,
                                      decoration: BoxDecoration(
                                          color: Colors.yellow[800],
                                          borderRadius:
                                              BorderRadius.circular(40.r)),
                                      child: const Image(
                                          image: AssetImage(
                                              'assets/silver_plan.png')),
                                    ),
                                    SizedBox(
                                      width: 6.w,
                                    ),
                                    Text(
                                      "Gold",
                                      style: TextStyle(
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Text(
                                    "Optimal  For 10+ team size and new startup",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                RichText(
                                    text: TextSpan(
                                        text: '\$100',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 24.h,
                                            fontWeight: FontWeight.w600),
                                        children: [
                                      TextSpan(
                                        text: "/mo",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.h,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ])),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Flexible(
                                  child: ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: checkboxGoldMonthly.length,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            CheckboxListTile(
                                              title: Text(
                                                checkboxGoldMonthly[index]
                                                    ['title'],
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14.h,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              checkboxShape:
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50.r)),
                                              value: checkboxGoldMonthly[index]
                                                  ['value'],
                                              onChanged: (value) {
                                                setState(() {
                                                  checkboxGoldMonthly[index]
                                                      ['value'] = value!;
                                                });
                                              },
                                            ),
                                            SizedBox(
                                              height: 16.h,
                                            ),
                                          ],
                                        );
                                      }),
                                ),
                                SizedBox(
                                  height: 24.h,
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shadowColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(7.r)),
                                      minimumSize: Size(130.w, 35.h),
                                      foregroundColor: AppColors.white,
                                      backgroundColor: AppColors.primaryColor,
                                    ),
                                    onPressed: () {
                                      Get.toNamed("/billing_address");
                                    },
                                    child: Text(
                                      "Upgrade",
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(7.r)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.w, vertical: 8.h),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 24.w,
                                      // height: 24.h,
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(40)),
                                      child: const Image(
                                          image: AssetImage(
                                              'assets/silver_plan.png')),
                                    ),
                                    SizedBox(
                                      width: 6.w,
                                    ),
                                    Text(
                                      "Plantinum",
                                      style: TextStyle(
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Text(
                                    "Optimal  For 10+ team size and new startup",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                RichText(
                                    text: TextSpan(
                                        text: '\$100',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 24.h,
                                            fontWeight: FontWeight.w600),
                                        children: [
                                      TextSpan(
                                        text: "/mo",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.h,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ])),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Flexible(
                                  child: ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: checkboxPlatinumMonthly.length,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            CheckboxListTile(
                                              title: Text(
                                                checkboxPlatinumMonthly[index]
                                                    ['title'],
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14.h,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              checkboxShape:
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50.r)),
                                              value:
                                                  checkboxPlatinumMonthly[index]
                                                      ['value'],
                                              onChanged: (value) {
                                                setState(() {
                                                  checkboxPlatinumMonthly[index]
                                                      ['value'] = value!;
                                                });
                                              },
                                            ),
                                            SizedBox(
                                              height: 16.h,
                                            ),
                                          ],
                                        );
                                      }),
                                ),
                                SizedBox(
                                  height: 24.h,
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shadowColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(7.r)),
                                      minimumSize: Size(130.w, 35.h),
                                      foregroundColor: AppColors.white,
                                      backgroundColor: AppColors.primaryColor,
                                    ),
                                    onPressed: () {
                                      Get.toNamed("/billing_address");
                                    },
                                    child: Text(
                                      "Upgrade",
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                    options: CarouselOptions(
                        height: 600.h,
                        enableInfiniteScroll: false,
                        viewportFraction: 0.8)),
              ),
            ),
            SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.only(top: 16.h),
                child: CarouselSlider(
                    items: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(7.r)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.w, vertical: 8.h),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 24.w,
                                      decoration: BoxDecoration(
                                          color: Colors.indigo[900],
                                          borderRadius:
                                              BorderRadius.circular(40)),
                                      child: const Image(
                                          image: AssetImage(
                                              'assets/silver_plan.png')),
                                    ),
                                    SizedBox(
                                      width: 6.w,
                                    ),
                                    Text(
                                      "Silver",
                                      style: TextStyle(
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Text(
                                    "Optimal  For 10+ team size and new startup",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                RichText(
                                    text: TextSpan(
                                        text: '\$100',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 24.h,
                                            fontWeight: FontWeight.w600),
                                        children: [
                                      TextSpan(
                                        text: "/yr",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.h,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ])),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Flexible(
                                  child: ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: checkboxSilverYearly.length,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            CheckboxListTile(
                                              title: Text(
                                                checkboxSilverYearly[index]
                                                    ['title'],
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14.h,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              checkboxShape:
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50)),
                                              value: checkboxSilverYearly[index]
                                                  ['value'],
                                              onChanged: (value) {
                                                setState(() {
                                                  checkboxSilverYearly[index]
                                                      ['value'] = value!;
                                                });
                                              },
                                            ),
                                            SizedBox(
                                              height: 16.h,
                                            ),
                                          ],
                                        );
                                      }),
                                ),
                                SizedBox(
                                  height: 24.h,
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shadowColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(7.r)),
                                      minimumSize: Size(130.w, 35.h),
                                      foregroundColor: AppColors.white,
                                      backgroundColor: AppColors.primaryColor,
                                    ),
                                    onPressed: () {
                                      Get.toNamed("/billing_address");
                                    },
                                    child: Text(
                                      "Upgrade",
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(7.r)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.w, vertical: 8.h),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 24.w,
                                      // height: 24.h,
                                      decoration: BoxDecoration(
                                          color: Colors.yellow[800],
                                          borderRadius:
                                              BorderRadius.circular(40)),
                                      child: const Image(
                                          image: AssetImage(
                                              'assets/silver_plan.png')),
                                    ),
                                    SizedBox(
                                      width: 6.w,
                                    ),
                                    Text(
                                      "Gold",
                                      style: TextStyle(
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Text(
                                    "Optimal  For 10+ team size and new startup",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                RichText(
                                    text: TextSpan(
                                        text: '\$100',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 24.h,
                                            fontWeight: FontWeight.w600),
                                        children: [
                                      TextSpan(
                                        text: "/yr",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.h,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ])),
                                SizedBox(
                                  height: 16.h,
                                ),
                                Flexible(
                                  child: ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: checkboxGoldYearly.length,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            CheckboxListTile(
                                              title: Text(
                                                checkboxGoldYearly[index]
                                                    ['title'],
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14.h,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              checkboxShape:
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50)),
                                              value: checkboxGoldYearly[index]
                                                  ['value'],
                                              onChanged: (value) {
                                                setState(() {
                                                  checkboxGoldYearly[index]
                                                      ['value'] = value!;
                                                });
                                              },
                                            ),
                                            SizedBox(
                                              height: 16.h,
                                            ),
                                          ],
                                        );
                                      }),
                                ),
                                SizedBox(
                                  height: 24.h,
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shadowColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(7.r)),
                                      minimumSize: Size(130.w, 35.h),
                                      foregroundColor: AppColors.white,
                                      backgroundColor: AppColors.primaryColor,
                                    ),
                                    onPressed: () {
                                      Get.toNamed("/billing_address");
                                    },
                                    child: Text(
                                      "Upgrade",
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.h),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(7.r)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.w, vertical: 8.h),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 24.w,
                                      // height: 24.h,
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(40)),
                                      child: const Image(
                                          image: AssetImage(
                                              'assets/silver_plan.png')),
                                    ),
                                    SizedBox(
                                      width: 6.w,
                                    ),
                                    Text(
                                      "Plantinum",
                                      style: TextStyle(
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Text(
                                    "Optimal  For 10+ team size and new startup",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                RichText(
                                    text: TextSpan(
                                        text: '\$100',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 24.h,
                                            fontWeight: FontWeight.w600),
                                        children: [
                                      TextSpan(
                                        text: "/yr",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.h,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ])),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Flexible(
                                  child: ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: checkboxPlatinumYearly.length,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            CheckboxListTile(
                                              title: Text(
                                                checkboxPlatinumYearly[index]
                                                    ['title'],
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14.h,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              checkboxShape:
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50)),
                                              value:
                                                  checkboxPlatinumYearly[index]
                                                      ['value'],
                                              onChanged: (value) {
                                                setState(() {
                                                  checkboxPlatinumYearly[index]
                                                      ['value'] = value!;
                                                });
                                              },
                                            ),
                                            SizedBox(
                                              height: 16.h,
                                            ),
                                          ],
                                        );
                                      }),
                                ),
                                SizedBox(
                                  height: 24.h,
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shadowColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(7.r)),
                                      minimumSize: Size(130.w, 35.h),
                                      foregroundColor: AppColors.white,
                                      backgroundColor: AppColors.primaryColor,
                                    ),
                                    onPressed: () {
                                      Get.toNamed("/billing_address");
                                    },
                                    child: Text(
                                      "Upgrade",
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                    options: CarouselOptions(
                        height: 600.h,
                        enableInfiniteScroll: false,
                        viewportFraction: 0.8)),
              ),
            ),
          ]),
        ),
        // Row(
        //   children: [
        //     Expanded(
        //       child: Padding(
        //         padding: EdgeInsets.symmetric(horizontal: 16.w),
        //         child: ElevatedButton(
        //             style: ElevatedButton.styleFrom(
        //               shadowColor: Colors.transparent,
        //               shape: RoundedRectangleBorder(
        //                   borderRadius: BorderRadius.circular(7.r)),
        //               fixedSize: Size.fromHeight(47.h),
        //               foregroundColor: AppColors.white,
        //               backgroundColor: AppColors.primaryColor,
        //             ),
        //             onPressed: () {
        //               Get.toNamed("/billing_address");
        //             },
        //             child: Text(
        //               "Next",
        //               style: TextStyle(
        //                   fontSize: 16.sp, fontWeight: FontWeight.w600),
        //             )),
        //       ),
        //     ),
        //   ],
        // ),
        SizedBox(
          height: 46.h,
        )
      ],
    );
  }
}
