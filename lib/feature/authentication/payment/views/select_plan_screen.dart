// // ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:sgt_owner/shared/widgets/custom_appbar.dart';
// import 'package:sgt_owner/shared/widgets/custom_buttons.dart';
// import 'package:sgt_owner/style/colors.dart';
// import 'package:sgt_owner/style/font_style.dart';
// import 'package:carousel_slider/carousel_slider.dart';

// class SelectedPlanPage extends StatefulWidget {
//   const SelectedPlanPage({super.key});

//   @override
//   State<SelectedPlanPage> createState() => _SelectedPlanPageState();
// }

// class _SelectedPlanPageState extends State<SelectedPlanPage>
//     with TickerProviderStateMixin {
//   bool mProperties = true;
//   bool mShifts = true;
//   bool mCheckpoints = true;
//   bool mGuards = true;
//   bool mMessenger = false;
//   bool yProperties = true;
//   bool yShifts = true;
//   bool yCheckpoints = true;
//   bool yGuards = true;
//   bool yMessenger = true;
//   late TabController _tabController;

//   @override
//   void dispose() {
//     super.dispose();
//     _tabController.dispose();
//   }

//   @override
//   void initState() {
//     super.initState();

//     _tabController = TabController(
//       initialIndex: 0,
//       length: 2,
//       vsync: this,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: CustomAppBar(
//           titleText: 'Select a plan',
//           isLeading: true,
//         ),
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Material(
//               color: AppColors.disableColor,
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(left: 10.w, right: 10.w),
//                     child: TabBar(
//                       tabAlignment: TabAlignment.fill,
//                       padding: EdgeInsets.zero,
//                       controller: _tabController,
//                       // indicatorWeight: 2,
//                       tabs: [
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 40.w),
//                           child: Tab(
//                             child: Text(
//                               'Monthly',
//                               style: AppFontStyle.regularTextStyle(
//                                   AppColors.white, 16.sp),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 48.w),
//                           child: Tab(
//                             child: Text(
//                               'Yearly',
//                               style: AppFontStyle.regularTextStyle(
//                                   AppColors.white, 16.sp),
//                             ),
//                           ),
//                         ),
//                       ],
//                       indicatorColor: Colors.transparent,
//                       labelColor: Colors.white,
//                       unselectedLabelColor: Colors.black,
//                       indicator: BoxDecoration(
//                           borderRadius: BorderRadius.circular(5),
//                           color: AppColors.primaryColor),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 15,
//             ),
//             Flexible(
//               child: TabBarView(
//                 controller: _tabController,
//                 children: [
//                   CarouselSlider(
//                     options: CarouselOptions(height: 600.h),
//                     items: [1, 2, 3].map((i) {
//                       return Builder(
//                         builder: (BuildContext context) {
//                           return Container(
//                             width: MediaQuery.of(context).size.width,
//                             margin: EdgeInsets.symmetric(horizontal: 5.0),
//                             decoration: BoxDecoration(
//                               color: AppColors.white,
//                             ),
//                             child: Container(
//                               height: 307.h,
//                               width: 259.w,
//                               child: Column(
//                                 children: [
//                                   SizedBox(
//                                     height: 12.h,
//                                   ),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       const Padding(
//                                         padding: EdgeInsets.all(8.0),
//                                         child: Icon(
//                                           Icons.change_circle,
//                                           color: AppColors.primaryColor,
//                                         ),
//                                       ),
//                                       Text(
//                                         'Silver',
//                                         style: AppFontStyle.mediumTextStyle(
//                                             AppColors.primaryColor, 22.sp),
//                                       ),
//                                     ],
//                                   ),
//                                   Text(
//                                     'Optimal  For 10+ team size and new startup',
//                                     style: AppFontStyle.regularTextStyle(
//                                         AppColors.black, 12.sp),
//                                   ),
//                                   SizedBox(
//                                     height: 19.h,
//                                   ),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text(
//                                         '\$100',
//                                         style: AppFontStyle.semiboldTextStyle(
//                                             AppColors.black, 24.sp),
//                                       ),
//                                       Text(
//                                         '/mo',
//                                         style: AppFontStyle.semiboldTextStyle(
//                                             AppColors.black, 18.sp),
//                                       ),
//                                     ],
//                                   ),
//                                   CheckboxListTile(
//                                     title: Text(
//                                       '5 Properties',
//                                       style: AppFontStyle.regularTextStyle(
//                                           AppColors.black, 14.sp),
//                                     ),
//                                     value: mProperties,
//                                     checkboxShape: const CircleBorder(),
//                                     checkColor: AppColors.white,
//                                     activeColor: AppColors.primaryColor,
//                                     onChanged: (value) {
//                                       setState(() {
//                                         mProperties = value!;
//                                       });
//                                     },
//                                   ),
//                                   CheckboxListTile(
//                                     title: Text(
//                                       '10 Shifts',
//                                       style: AppFontStyle.regularTextStyle(
//                                           AppColors.black, 14.sp),
//                                     ),
//                                     value: mShifts,
//                                     checkboxShape: const CircleBorder(),
//                                     activeColor: AppColors.primaryColor,
//                                     onChanged: (value) {
//                                       setState(() {
//                                         mShifts = value!;
//                                       });
//                                     },
//                                   ),
//                                   CheckboxListTile(
//                                     title: Text(
//                                       '10 Checkpoints',
//                                       style: AppFontStyle.regularTextStyle(
//                                           AppColors.black, 14.sp),
//                                     ),
//                                     value: mCheckpoints,
//                                     checkboxShape: const CircleBorder(),
//                                     activeColor: AppColors.primaryColor,
//                                     onChanged: (value) {
//                                       setState(() {
//                                         mCheckpoints = value!;
//                                       });
//                                     },
//                                   ),
//                                   CheckboxListTile(
//                                     title: Text(
//                                       '10 Guards',
//                                       style: AppFontStyle.regularTextStyle(
//                                           AppColors.black, 14.sp),
//                                     ),
//                                     value: mGuards,
//                                     checkboxShape: const CircleBorder(),
//                                     activeColor: AppColors.primaryColor,
//                                     onChanged: (value) {
//                                       setState(() {
//                                         mGuards = value!;
//                                       });
//                                     },
//                                   ),
//                                   CheckboxListTile(
//                                     title: Text(
//                                       'Messenger',
//                                       style: AppFontStyle.regularTextStyle(
//                                           AppColors.black, 14.sp),
//                                     ),
//                                     value: mMessenger,
//                                     checkboxShape: const CircleBorder(),
//                                     activeColor: AppColors.primaryColor,
//                                     onChanged: (value) {
//                                       setState(() {
//                                         mMessenger = value!;
//                                       });
//                                     },
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                       );
//                     }).toList(),
//                   ),
//                   CarouselSlider(
//                     options: CarouselOptions(height: 600.h),
//                     items: [1, 2, 3].map((i) {
//                       return Builder(
//                         builder: (BuildContext context) {
//                           return Container(
//                               width: MediaQuery.of(context).size.width,
//                               margin: EdgeInsets.symmetric(horizontal: 5.0),
//                               decoration: BoxDecoration(
//                                 color: AppColors.white,
//                               ),
//                               child: Container(
//                                 height: 307.h,
//                                 width: 259.w,
//                                 child: Column(
//                                   children: [
//                                     SizedBox(
//                                       height: 12.h,
//                                     ),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         const Padding(
//                                           padding: EdgeInsets.all(8.0),
//                                           child: Icon(
//                                             Icons.change_circle,
//                                             color: AppColors.greenColor,
//                                           ),
//                                         ),
//                                         Text(
//                                           'Platinum',
//                                           style: AppFontStyle.mediumTextStyle(
//                                               AppColors.primaryColor, 22.sp),
//                                         ),
//                                       ],
//                                     ),
//                                     Text(
//                                       'Optimal  For 10+ team size and new startup',
//                                       style: AppFontStyle.regularTextStyle(
//                                           AppColors.black, 12.sp),
//                                     ),
//                                     SizedBox(
//                                       height: 19.h,
//                                     ),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         Text(
//                                           '\$200',
//                                           style: AppFontStyle.semiboldTextStyle(
//                                               AppColors.black, 24.sp),
//                                         ),
//                                         Text(
//                                           '/yr',
//                                           style: AppFontStyle.semiboldTextStyle(
//                                               AppColors.black, 18.sp),
//                                         ),
//                                       ],
//                                     ),
//                                     CheckboxListTile(
//                                       title: Text(
//                                         '5 Properties',
//                                         style: AppFontStyle.regularTextStyle(
//                                             AppColors.black, 14.sp),
//                                       ),
//                                       value: yProperties,
//                                       checkboxShape: const CircleBorder(),
//                                       activeColor: AppColors.primaryColor,
//                                       onChanged: (value) {
//                                         setState(() {
//                                           yProperties = value!;
//                                         });
//                                       },
//                                     ),
//                                     CheckboxListTile(
//                                       title: Text(
//                                         '10 Shifts',
//                                         style: AppFontStyle.regularTextStyle(
//                                             AppColors.black, 14.sp),
//                                       ),
//                                       value: yShifts,
//                                       checkboxShape: const CircleBorder(),
//                                       activeColor: AppColors.primaryColor,
//                                       onChanged: (value) {
//                                         setState(() {
//                                           yShifts = value!;
//                                         });
//                                       },
//                                     ),
//                                     CheckboxListTile(
//                                       title: Text(
//                                         '10 Checkpoints',
//                                         style: AppFontStyle.regularTextStyle(
//                                             AppColors.black, 14.sp),
//                                       ),
//                                       activeColor: AppColors.primaryColor,
//                                       value: yCheckpoints,
//                                       checkboxShape: const CircleBorder(),
//                                       onChanged: (value) {
//                                         setState(() {
//                                           yCheckpoints = value!;
//                                         });
//                                       },
//                                     ),
//                                     CheckboxListTile(
//                                       title: Text(
//                                         '10 Guards',
//                                         style: AppFontStyle.regularTextStyle(
//                                             AppColors.black, 14.sp),
//                                       ),
//                                       value: yGuards,
//                                       checkboxShape: const CircleBorder(),
//                                       activeColor: AppColors.primaryColor,
//                                       onChanged: (value) {
//                                         setState(() {
//                                           yGuards = value!;
//                                         });
//                                       },
//                                     ),
//                                     CheckboxListTile(
//                                       title: Text(
//                                         'Messenger',
//                                         style: AppFontStyle.regularTextStyle(
//                                             AppColors.black, 14.sp),
//                                       ),
//                                       activeColor: AppColors.primaryColor,
//                                       value: yMessenger,
//                                       checkboxShape: const CircleBorder(),
//                                       onChanged: (value) {
//                                         setState(() {
//                                           yMessenger = value!;
//                                         });
//                                       },
//                                     ),
//                                   ],
//                                 ),
//                               ));
//                         },
//                       );
//                     }).toList(),
//                   ),
//                 ],
//               ),
//             ),
//             Center(
//               child: AppButton(
//                   onTaps: () {
//                     // billingAddressController.checkValidFormField();
//                     Get.toNamed("/billing_address");
//                   },
//                   backgoundColor:
//                       // billingAddressController.btnEnabled.value
//                       //         ?
//                       AppColors.primaryColor,
//                   // : AppColors.disableColor,
//                   textColor: AppColors.white,
//                   titleText: "Next"
//                   // )
//                   ),
//             ),
//             SizedBox(
//               height: 38.h,
//             ),
//           ],
//         ));
//   }
// }

import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgt_owner/style/colors.dart';

class SelectedPlanPage extends StatefulWidget {
  const SelectedPlanPage({super.key});

  @override
  State<SelectedPlanPage> createState() => _SelectedPlanPageState();
}

class _SelectedPlanPageState extends State<SelectedPlanPage> {
  // List<Map<dynamic, dynamic>> selectPlanData = [
  //   {
  //     'icon-color': 'grey',
  //     'plan-name': 'Silver',
  //     'plan-detail': 'Optimal  For 10+ team size and new startup',
  //     'plan-price': '100',
  //     'plan-duration': 'month',
  //   }
  // ];
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
          labelStyle: TextStyle(
            fontSize: 16.0.sp,
            fontWeight: FontWeight.w500,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 16.0.sp,
            fontWeight: FontWeight.w500,
          ),
          labelColor: Colors.white,
          indicatorColor: Colors.transparent,
          dividerColor: Colors.transparent,
          padding: EdgeInsets.all(2.h),
          tabs: [
            Padding(
              padding: const EdgeInsets.all(2),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color:
                      valueTab == 0 ? Colors.indigo[900] : Colors.transparent,
                ),
                alignment: Alignment.center,
                width: 160.w,
                height: 28.h,
                child: const Text(
                  "Monthly  ",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color:
                      valueTab == 1 ? Colors.indigo[900] : Colors.transparent,
                ),
                alignment: Alignment.center,
                width: 160.w,
                height: 28.h,
                child: const Text(
                  "Yearly  ",
                ),
              ),
            ),
          ]);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Color.fromRGBO(245, 246, 249, 1),
          appBar: AppBar(
            elevation: 5,
            backgroundColor: Colors.white,
            shadowColor: Color.fromRGBO(0, 0, 0, 0.466),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back)),
            centerTitle: false,
            titleSpacing: 0,
            title: Text(
              "SelectPlan",
              style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w700),
            ),
          ),
          body: planList()),
    );
  }

  Widget planList() {
    return Column(
      children: [
        SizedBox(
          height: 16.h,
        ),
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
        Expanded(
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
                                )
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
                                )
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
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                    options: CarouselOptions(
                        height: 417.h,
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
                                )
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
                                )
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
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                    options: CarouselOptions(
                        height: 417.h,
                        enableInfiniteScroll: false,
                        viewportFraction: 0.8)),
              ),
            ),
          ]),
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.r)),
                      fixedSize: Size.fromHeight(47.h),
                      foregroundColor: AppColors.white,
                      backgroundColor: AppColors.primaryColor,
                    ),
                    onPressed: () {
                      Get.toNamed("/billing_address");
                    },
                    child: Text(
                      "Next",
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w600),
                    )),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 46.h,
        )
      ],
    );
  }
}
