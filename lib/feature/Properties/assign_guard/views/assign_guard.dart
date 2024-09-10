// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:sgt_owner/feature/More/route_screen/route_listings_screen.dart';
import 'package:sgt_owner/feature/Properties/assign_guard/controller/assign_guard_controller.dart';
import 'package:sgt_owner/feature/Properties/assign_guard/views/guard_list.dart';
import 'package:sgt_owner/feature/Properties/property_view_carousal.dart';
import 'package:sgt_owner/feature/Properties/route/controller/create_route_controller.dart';
import 'package:sgt_owner/shared/widgets/custom_appbar.dart';
import 'package:sgt_owner/shared/widgets/custom_buttons.dart';
import 'package:sgt_owner/feature/Properties/assign_guard/views/custom_calender.dart';
import 'package:sgt_owner/shared/widgets/custom_progressbar.dart';
import 'package:sgt_owner/shared/widgets/custom_textfield.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';

class AssignGuardPage extends StatefulWidget {
  const AssignGuardPage({super.key});

  static _AssignGuardPageState? of(BuildContext context) =>
      context.findAncestorStateOfType<_AssignGuardPageState>();

  @override
  State<AssignGuardPage> createState() => _AssignGuardPageState();
}

bool? selectedGuardList = false;

class _AssignGuardPageState extends State<AssignGuardPage> {
  bool hide = false;
  bool leaveFromclicked = false;
  final assignGuardController = Get.put(AssignGuardController());
  String? route;
  String? selectedCheckpoint;
  String? selectedDate;
  DateTime dt1 = DateTime.now();

  List<String> routeList = [
    "Route 1",
    "Route 2",
    "Route 3",
    "Route 4",
    "Route 5",
    "Route 6",
  ];

  // late TabController _tabController;
  @override
  void dispose() {
    super.dispose();
    // _tabController.dispose();
  }

  final _routeListFocus = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int pageIndex = 3;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        titleText: 'Assign Guard',
        isLeading: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 16.h,
            ),
            MyProgressPage(currentIndex: pageIndex),
            SizedBox(
              height: 16.h,
            ),
            PropertyCarousal(),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 12.h,
                  ),
                  Divider(
                    color: AppColors.secondaryColor,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Container(
                    width: Get.width - 32.w,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(10.r, 10.r))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'select Route to Assign Guard',
                              style: AppFontStyle.semiboldTextStyle(
                                  AppColors.primaryColor, 16.sp),
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Form(
                              key: assignGuardController.routeListFormKey,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              child: buildDropdown('Select Route', routeList,
                                  (value) {
                                setState(() {
                                  route = value;
                                });
                              }, _routeListFocus),
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'choose date for Assigning Guard',
                                  style: AppFontStyle.semiboldTextStyle(
                                      AppColors.primaryColor, 16.sp),
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                Form(
                                  key: assignGuardController.inputDateFormKey,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: AppColors.backgroundColor),
                                    child: TextField(
                                      controller: assignGuardController
                                          .dateInputController,
                                      readOnly: true,
                                      obscureText: false,
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: AppColors.secondaryColor,
                                          fontWeight: FontWeight.w500),
                                      decoration: InputDecoration(
                                          hintText: "Select Date",
                                          contentPadding: EdgeInsets.only(
                                              left: 10, top: 14),
                                          hintStyle: TextStyle(
                                              fontSize: 12.0,
                                              color: AppColors.primaryColor),
                                          border: InputBorder.none,
                                          suffixIcon: Icon(
                                            Icons.arrow_drop_down,
                                            color: AppColors.primaryColor,
                                          )),
                                      onTap: () {
                                        setState(() {
                                          leaveFromclicked = !leaveFromclicked;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                leaveFromclicked
                                    ? CustomCalenderWidget(
                                        onCallback: () {
                                          assignGuardController
                                              .dateInputController
                                              .text = selectedDate.toString();
                                          dt1 = DateTime.parse(
                                              selectedDate.toString());
                                          setState(() {
                                            leaveFromclicked =
                                                !leaveFromclicked;
                                          });
                                          Get.dialog(GuardList());
                                        },
                                      )
                                    : Container(),
                                SizedBox(
                                  height: 12.h,
                                ),
                                AppButton(
                                    onTaps: () {
                                      // createCheckpointController.checkLogin();
                                      selectedGuardList = true;
                                    },
                                    backgoundColor:
                                        // createCheckpointController.btnEnabled.value
                                        //     ?
                                        AppColors.black,
                                    //     :
                                    // AppColors.disableColor,
                                    textColor: AppColors.white,
                                    titleText: "Assign Guard"),
                              ],
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            selectedGuardList == true
                                ? SelectedGuardList()
                                : Container()
                          ]),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                          text: TextSpan(
                              text: 'Assigned Guards:',
                              style: AppFontStyle.semiboldTextStyle(
                                  AppColors.primaryColor, 16.sp),
                              children: [
                            TextSpan(
                                text: ' (02)',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 99, 101, 120),
                                ))
                          ])),
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Container(
                    color: AppColors.white,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColors.lightPrimaryColor,
                            radius: 30.r,
                            child: CircleAvatar(
                              radius: 35.r,
                              backgroundColor: AppColors.lightPrimaryColor,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(35.r),
                                  child: Image.asset(
                                    "assets/guard_5.png",
                                    fit: BoxFit.fill,
                                    width: 70.w,
                                    height: 70.h,
                                  )),
                            ),
                          ),
                          SizedBox(
                            width: 16.h,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "items[index]",
                                    style: AppFontStyle.mediumTextStyle(
                                        AppColors.primaryColor, 16.sp),
                                  ),
                                  // Text(
                                  //   "Remove",
                                  //   style: AppFontStyle.mediumTextStyle(
                                  //       AppColors.greenColor, 12.sp),
                                  // ),
                                ],
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              RichText(
                                  text: TextSpan(
                                      text: 'Email:',
                                      style: AppFontStyle.mediumTextStyle(
                                          AppColors.textColor, 12.sp),
                                      children: [
                                    TextSpan(
                                        text: ' Lorri201@gmail.com',
                                        style: TextStyle(
                                          color: AppColors.primaryColor,
                                        ))
                                  ])),
                              SizedBox(
                                height: 2,
                              ),
                              RichText(
                                  text: TextSpan(
                                      text: 'Phone Number:',
                                      style: AppFontStyle.mediumTextStyle(
                                          AppColors.textColor, 12.sp),
                                      children: [
                                    TextSpan(
                                        text: ' (920) 948-1722',
                                        style: TextStyle(
                                          color: AppColors.primaryColor,
                                        ))
                                  ])),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  AppButton(
                      onTaps: () {
                        // createCheckpointController.checkLogin();
                        Get.toNamed('/job_assigned_popup');
                      },
                      backgoundColor:
                          // createCheckpointController.btnEnabled.value
                          //     ?
                          AppColors.primaryColor,
                      //     :
                      // AppColors.disableColor,
                      textColor: AppColors.white,
                      titleText: "Submit"),
                  SizedBox(
                    height: 38.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDropdown(String label, List<String> items, onChanged, focusNode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField(
          value: items.contains(route) ? route : null,
          onChanged: onChanged,
          focusNode: focusNode,
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: routes(value),
            );
          }).toList(),
          selectedItemBuilder: (context) {
            return items.map((e) {
              return Text(e);
            }).toList();
          },
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            return assignGuardController.validateRouteList(value!);
          },
        )
        // onTapOutside: (event) {
        //                     FocusScope.of(context).unfocus();
        //                   },
        // onFieldSubmitted: (value) {
        //                     FocusScope.of(context)
        //                         .requestFocus(_uploadImageFocus);
        //                   },,
      ],
    );
  }

  Widget routes(index) {
    return Container(
      color: AppColors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Route Name $index',
                style:
                    AppFontStyle.mediumTextStyle(AppColors.primaryColor, 14.sp),
              ),
              Text(
                '10:00AM - 06:00 PM',
                style: AppFontStyle.mediumTextStyle(
                    AppColors.secondaryColor, 12.sp),
              ),
            ],
          ),
          RichText(
              text: TextSpan(
                  text: 'Total checkpoint:',
                  style:
                      AppFontStyle.mediumTextStyle(AppColors.textColor, 12.sp),
                  children: [
                TextSpan(
                    text: ' 07',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                    ))
              ])),
        ],
      ).marginOnly(bottom: 1.h),
    );
  }
}

class GuardList extends StatelessWidget {
  GuardList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 150.h, horizontal: 10.w),
      child: Column(children: [
        Container(
          color: AppColors.primaryColor,
          padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Available Guards',
                style: AppFontStyle.mediumTextStyle(AppColors.white, 16.sp),
              ),
              Text(
                '9',
                style: AppFontStyle.mediumTextStyle(AppColors.white, 16.sp),
              ),
            ],
          ),
        ),
        Container(color: AppColors.white, height: 330.h, child: MyListView()),
        Container(
          color: AppColors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 9.h),
            child: AppButton(
                onTaps: () {
                  selectedGuardList != selectedGuardList;
                  Navigator.of(context).pop();
                },
                backgoundColor:
                    // createCheckpointController.btnEnabled.value0
                    //     ?
                    AppColors.primaryColor,
                //     :
                // AppColors.disableColor,
                textColor: AppColors.white,
                titleText: "Done"),
          ),
        )
      ]),
    );
  }
}

class MyListView extends StatefulWidget {
  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  // Sample data for the list
  final List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8',
    'Item 9',
  ];

  List<bool> checkbox = [
    false,
    false,
    false,
    true,
    true,
    false,
    false,
    true,
    true
  ];

  @override
  Widget build(BuildContext context) {
    return GlowingOverscrollIndicator(
      color: AppColors.primaryColor,
      axisDirection: AxisDirection.down,
      child: RawScrollbar(
        minThumbLength: 40.h,
        thumbColor: AppColors.primaryColor,
        radius: Radius.circular(20),
        thickness: 5,
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.all(2),
              color: AppColors.white,
              child: Row(children: [
                Container(
                    width: 15.w,
                    height: 100.h,
                    color: AppColors.greenColor,
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: Center(
                        child: Text('Available',
                            style: AppFontStyle.semiboldTextStyle(
                                AppColors.white, 12.sp),
                            softWrap: false),
                      ),
                    )),
                Expanded(
                  child: CheckboxListTile(
                    side: const BorderSide(color: AppColors.primaryColor),
                    activeColor: AppColors.primaryColor,
                    checkColor: AppColors.white,
                    title: Row(
                      children: [
                        Container(
                            child: CircleAvatar(
                          backgroundColor: AppColors.lightPrimaryColor,
                          radius: 36.r,
                          child: CircleAvatar(
                            radius: 35.r,
                            backgroundColor: AppColors.lightPrimaryColor,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(35.r),
                                child: Image.asset(
                                  "assets/splash_1.png",
                                  fit: BoxFit.fill,
                                  width: 70.w,
                                  height: 70.h,
                                )),
                          ),
                        )),
                        SizedBox(
                          width: 8.w,
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                items[index].toString(),
                                style: AppFontStyle.mediumTextStyle(
                                    AppColors.primaryColor, 16.sp),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Email: ",
                                    style: AppFontStyle.mediumTextStyle(
                                        AppColors.black, 12.sp),
                                  ),
                                  Text(
                                    items[index].toString(),
                                    style: AppFontStyle.mediumTextStyle(
                                        AppColors.primaryColor, 12.sp),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Phone Number: ",
                                    style: AppFontStyle.mediumTextStyle(
                                        AppColors.black, 12.sp),
                                  ),
                                  Text(
                                    items[index].toString(),
                                    style: AppFontStyle.mediumTextStyle(
                                        AppColors.primaryColor, 12.sp),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    value: checkbox[index],
                    onChanged: (value) {
                      setState(
                        () {
                          checkbox[index] = value!;
                        },
                      );
                    },
                    controlAffinity: ListTileControlAffinity.platform,
                  ),
                ),
              ]),
            );
          },
        ),
      ),
    );
  }
}

class SelectedGuardList extends StatelessWidget {
  final List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8',
    'Item 9',
  ];
  SelectedGuardList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.all(Radius.elliptical(10.r, 10.r))),
        child: Column(
          children: [
            Text(
              "Assigned Guards (02)",
              style:
                  AppFontStyle.semiboldTextStyle(AppColors.primaryColor, 16.sp),
            ),
            ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.all(2),
                    color: AppColors.white,
                    child: Row(children: [
                      Expanded(
                        child: Container(
                          child: Row(
                            children: [
                              Container(
                                  child: CircleAvatar(
                                backgroundColor: AppColors.lightPrimaryColor,
                                radius: 36.r,
                                child: CircleAvatar(
                                  radius: 35.r,
                                  backgroundColor: AppColors.lightPrimaryColor,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(35.r),
                                      child: Image.asset(
                                        "assets/splash_1.png",
                                        fit: BoxFit.fill,
                                        width: 70.w,
                                        height: 70.h,
                                      )),
                                ),
                              )),
                              SizedBox(
                                width: 8.w,
                              ),
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      items[index].toString(),
                                      style: AppFontStyle.mediumTextStyle(
                                          AppColors.primaryColor, 16.sp),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Email: ",
                                          style: AppFontStyle.mediumTextStyle(
                                              AppColors.black, 12.sp),
                                        ),
                                        Text(
                                          items[index].toString(),
                                          style: AppFontStyle.mediumTextStyle(
                                              AppColors.primaryColor, 12.sp),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Phone Number: ",
                                          style: AppFontStyle.mediumTextStyle(
                                              AppColors.black, 12.sp),
                                        ),
                                        Text(
                                          items[index].toString(),
                                          style: AppFontStyle.mediumTextStyle(
                                              AppColors.primaryColor, 12.sp),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  );
                })
          ],
        ));
  }
}
