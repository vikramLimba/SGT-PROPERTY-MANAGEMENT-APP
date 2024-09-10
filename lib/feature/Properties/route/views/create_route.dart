import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgt_owner/feature/Properties/property_view_carousal.dart';
import 'package:sgt_owner/feature/Properties/route/controller/create_route_controller.dart';
import 'package:sgt_owner/shared/widgets/custom_appbar.dart';
import 'package:sgt_owner/shared/widgets/custom_bottomsheet.dart';
import 'package:sgt_owner/shared/widgets/custom_buttons.dart';
import 'package:sgt_owner/shared/widgets/custom_progressbar.dart';
import 'package:sgt_owner/shared/widgets/custom_textfield.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';

class CreateRoutePage extends StatefulWidget {
  const CreateRoutePage({super.key});

  @override
  State<CreateRoutePage> createState() => _CreateRoutePageState();
}

class _CreateRoutePageState extends State<CreateRoutePage> {
  String choice = 'item1';
  List<String> selectShiftList = [
    'Night Shift 1',
    'Night Shift 2',
    'Night Shift 3',
    'Night Shift 4',
    'Night Shift 5',
    'Night Shift 6'
  ];
  List<String> selectCheckpointList = [
    "Checkpoint Name: 1",
    "Checkpoint Name: 2",
    "Checkpoint Name: 3",
    "Checkpoint Name: 4",
    "Checkpoint Name: 5",
    "Checkpoint Name: 6",
    "Checkpoint Name: 7",
    "Checkpoint Name: 8",
  ];

  bool hide = false;
  final createRouteController = Get.put(CreateRouteController());
  String? selectedShift;
  String? selectedCheckpoint;
  List<Widget> checkpoint = [];
  List<Widget> createdRoutesList = [];

  final _routeNameFocus = FocusNode();
  // final _shiftListFocus = FocusNode();

  List<String> shiftList = [
    "Morning Shift",
    "Mid-day Shift",
    "Early Evening Shift",
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int pageIndex = 2;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        titleText: 'Create Route',
        isLeading: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children: [
              SizedBox(
                height: 16.h,
              ),
              MyProgressPage(currentIndex: pageIndex),
              SizedBox(
                height: 16.h,
              ),
              const PropertyCarousal(),
              SizedBox(
                height: 12.h,
              ),
              //==================> All Created Routes
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1.h,
                        color: AppColors.primaryBackColor,
                      ),
                    ),
                    SizedBox(
                      child: createdRoutesList.isEmpty
                          ? null
                          : Text(
                              '  All Created Routes  ',
                              style: AppFontStyle.semiboldTextStyle(
                                  AppColors.secondaryColor, 16.sp),
                            ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1.h,
                        color: AppColors.primaryBackColor,
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                child: Column(
                  children: createdRoutesList.isEmpty
                      ? []
                      : [
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount: createdRoutesList.length,
                              itemBuilder: (context, index) {
                                return createdRoutesList[index];
                              }),
                          SizedBox(
                            height: 8.h,
                          ),
                          Divider(
                            thickness: 1.h,
                            color: AppColors.primaryBackColor,
                          ),
                        ],
                ),
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
                        SizedBox(
                          height: 12.h,
                        ),
                        Form(
                          key: createRouteController.routeNameFormKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: SignUpTextField(
                            controller:
                                createRouteController.routeNameController,
                            label: RichText(
                                text: TextSpan(
                                    text: 'Route Name',
                                    style: AppFontStyle.lightTextStyle(
                                        AppColors.black, 14.sp),
                                    children: const [
                                  TextSpan(
                                      text: ' *',
                                      style: TextStyle(
                                        color: Colors.red,
                                      ))
                                ])),
                            maxWords: 25,
                            hintText: "Enter Route Name",
                            keyboardType: TextInputType.text,
                            focusNode: _routeNameFocus,
                            onSaved: (value) {
                              createRouteController.routeName = value!;
                            },
                            validator: (value) {
                              return createRouteController
                                  .validateRouteName(value!);
                            },
                            onTapOutside: (event) {
                              FocusScope.of(context).unfocus();
                            },
                            onFieldSubmitted: (value) {
                              FocusScope.of(context).unfocus();
                            },
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),

                        // ListView(
                        //     shrinkWrap: true,
                        //     physics: NeverScrollableScrollPhysics(),
                        //     children: checkpointNamesList),

                        SizedBox(
                          height: 12.h,
                        ),
                        SizedBox(
                          height: 46.h,
                          child: DropdownButtonFormField(
                            style: AppFontStyle.regularTextStyle(
                                AppColors.textColor, 14.sp),
                            icon: const Icon(Icons.keyboard_arrow_down_rounded),
                            isExpanded: true,
                            alignment: Alignment.center,
                            decoration: InputDecoration(
                                label: RichText(
                                    text: TextSpan(
                                        text: "Select Shift",
                                        style: AppFontStyle.regularTextStyle(
                                            AppColors.textColor, 12.sp),
                                        children: [
                                      TextSpan(
                                        text: "*",
                                        style: AppFontStyle.regularTextStyle(
                                            AppColors.redColor, 12.sp),
                                      )
                                    ])),
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 15.w),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.disableColor,
                                        width: 1.w)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.disableColor,
                                        width: 1.w))),
                            borderRadius: BorderRadius.circular(5.r),
                            items: selectShiftList.map((e) {
                              return DropdownMenuItem(
                                  // alignment: Alignment.topLeft,
                                  value: e,
                                  child: selectShiftTile(e));
                            }).toList(),
                            selectedItemBuilder: (context) {
                              return selectShiftList
                                  .map((e) => selectShiftText(e))
                                  .toList();
                            },
                            onChanged: (v) {},
                          ),
                        ),

                        SizedBox(
                          height: 16.h,
                        ),
                        RichText(
                            text: TextSpan(
                                text: 'Add Checkpoint on the Route',
                                style: AppFontStyle.semiboldTextStyle(
                                    AppColors.black, 16.sp),
                                children: const [
                              TextSpan(
                                  text: ' *',
                                  style: TextStyle(
                                    color: Colors.red,
                                  ))
                            ])),
                        Text(
                          'Route clock-in & clock-out time will auto fill.',
                          style: AppFontStyle.lightTextStyle(
                              AppColors.secondaryColor, 12.sp),
                        ),
                        // Row(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   children: [
                        //     Padding(
                        //       padding: EdgeInsets.symmetric(
                        //           horizontal: 16.w, vertical: 16.h),
                        //       child: routeLine(),
                        //     ),
                        //     Expanded(
                        //         child:
                        //             AddCheckPointBetweenRoute(checkPointList))
                        //   ],
                        // ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 6.w),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 30.w,
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.pin_drop_outlined,
                                          color: Colors.green,
                                          size: 12.h,
                                        ),
                                        Text(
                                          "Start",
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 11.w,
                                  ),
                                  Flexible(
                                    child: SizedBox(
                                      height: 46.h,
                                      child: TextField(
                                        style: AppFontStyle.regularTextStyle(
                                            AppColors.textColor, 14.sp),
                                        decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 15.w),
                                            enabledBorder:
                                                const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: AppColors
                                                            .disableColor)),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: AppColors
                                                            .disableColor)),
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(4.r))),
                                            label: Text(
                                              "Shift Clock-In",
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 12.sp),
                                            )),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 16.h,
                                width: 292.w,
                              ),

                              //=============> first checkpoint
                              Padding(
                                padding: EdgeInsets.only(left: 25.w),
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 14.w),
                                      child: SizedBox(
                                        width: 278.w,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    // width: 300.w,
                                                    height: 41.h,
                                                    child:
                                                        DropdownButtonFormField(
                                                            style: AppFontStyle
                                                                .regularTextStyle(
                                                                    AppColors
                                                                        .textColor,
                                                                    14.sp),
                                                            icon: const Icon(Icons
                                                                .keyboard_arrow_down_rounded),
                                                            isExpanded: true,
                                                            decoration: InputDecoration(
                                                                contentPadding:
                                                                    EdgeInsets.symmetric(
                                                                        horizontal: 15
                                                                            .w),
                                                                enabledBorder: OutlineInputBorder(
                                                                    borderSide: const BorderSide(
                                                                        color: AppColors
                                                                            .disableColor),
                                                                    borderRadius: BorderRadius.vertical(
                                                                        bottom:
                                                                            Radius.circular(0.h),
                                                                        top: Radius.circular(4.r))),
                                                                focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: AppColors.disableColor), borderRadius: BorderRadius.vertical(bottom: Radius.circular(0.h), top: Radius.circular(4.r))),
                                                                border: OutlineInputBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(0.h), top: Radius.circular(4.r))),
                                                                hintText: "Select Checkpoint",
                                                                hintStyle: AppFontStyle.regularTextStyle(AppColors.secondaryColor, 14.sp)),
                                                            items: selectCheckpointList.map((e) {
                                                              return DropdownMenuItem(
                                                                  value: e,
                                                                  child:
                                                                      selectCheckpointTile(
                                                                          e));
                                                            }).toList(),
                                                            selectedItemBuilder: (context) {
                                                              return selectCheckpointList
                                                                  .map((e) {
                                                                return Text(e);
                                                              }).toList();
                                                            },
                                                            onChanged: (e) {}),
                                                  ),
                                                  SizedBox(
                                                    height: 46.h,
                                                    width: 286.w,
                                                    child: TextFormField(
                                                        readOnly: true,
                                                        style: AppFontStyle
                                                            .regularTextStyle(
                                                                AppColors
                                                                    .textColor,
                                                                14.sp),
                                                        decoration:
                                                            InputDecoration(
                                                          suffixIcon: Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right:
                                                                        10.w),
                                                            child: Icon(
                                                              Icons.access_time,
                                                              size: 15.h,
                                                            ),
                                                          ),
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          15.w),
                                                          enabledBorder: OutlineInputBorder(
                                                              borderSide: const BorderSide(
                                                                  color: AppColors
                                                                      .disableColor),
                                                              borderRadius: BorderRadius.vertical(
                                                                  bottom: Radius
                                                                      .circular(
                                                                          5.r),
                                                                  top: Radius
                                                                      .circular(
                                                                          0.r))),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: AppColors
                                                                        .disableColor,
                                                                  ),
                                                                  borderRadius: BorderRadius.vertical(
                                                                      bottom: Radius
                                                                          .circular(5
                                                                              .r),
                                                                      top: Radius
                                                                          .circular(
                                                                              0.r))),
                                                          border: OutlineInputBorder(
                                                              borderRadius: BorderRadius.vertical(
                                                                  bottom: Radius
                                                                      .circular(
                                                                          4.r))),
                                                          hintText:
                                                              "Select Checkpoint time",
                                                          hintStyle: AppFontStyle
                                                              .regularTextStyle(
                                                                  AppColors
                                                                      .secondaryColor,
                                                                  14.sp),
                                                        ),
                                                        // items: null,
                                                        onTap: () async {
                                                          TimeOfDay?
                                                              pickedTime1 =
                                                              await showTimePicker(
                                                            initialTime:
                                                                TimeOfDay.now(),
                                                            context: context,
                                                            builder: (context,
                                                                child) {
                                                              return MediaQuery(
                                                                data: MediaQuery.of(
                                                                        context)
                                                                    .copyWith(
                                                                        alwaysUse24HourFormat:
                                                                            false),
                                                                child: child ??
                                                                    Container(),
                                                              );
                                                            },
                                                          );
                                                          if (pickedTime1 !=
                                                              null) {
                                                            // setState(() {
                                                            //   createShiftController
                                                            //           .clockOutTimeController
                                                            //           .text =
                                                            //       pickedTime1
                                                            //           .format(
                                                            //               context)
                                                            //           .toString();
                                                            // });
                                                          }
                                                        },
                                                        onChanged: (e) {}),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: -20.h,
                                      left: -24.w,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            width: 20.w,
                                            height: 52.h,
                                            child: VerticalDivider(
                                              thickness: 1.w,
                                              color: AppColors.disableColor,
                                            ),
                                          ),
                                          Text("CP1",
                                              style:
                                                  AppFontStyle.regularTextStyle(
                                                      AppColors.textColor,
                                                      12.sp)),
                                          SizedBox(
                                            width: 20.w,
                                            height: checkpoint.isEmpty
                                                ? 116.h
                                                : 92.h,
                                            child: const VerticalDivider(
                                              endIndent: 2,
                                              thickness: 1,
                                              color: AppColors.disableColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),

                              //=============> checkpoint list

                              // ListView(
                              //   padding: EdgeInsets.zero,
                              //   shrinkWrap: true,
                              //   physics: const NeverScrollableScrollPhysics(),
                              //   children:
                              //       List.generate(checkpoint.length, (index) {
                              //     return buildCheckpoint(index);
                              //   }),
                              // ),

                              ListView.builder(
                                  padding: EdgeInsets.zero,
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: checkpoint.length,
                                  itemBuilder: (context, index) {
                                    return buildCheckpoint(index);
                                    // checkpoint[index];
                                  }),

                              SizedBox(
                                height: 16.w,
                                width: 292.h,
                              ),

                              //=============> add more button
                              Padding(
                                padding: checkpoint.isEmpty
                                    ? EdgeInsets.only(left: 38.w)
                                    : EdgeInsets.only(left: 7.w),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.r)),
                                        foregroundColor: Colors.white,
                                        fixedSize: checkpoint.isEmpty
                                            ? Size(278.w, 46.h)
                                            : Size(244.w, 46.h)),
                                    onPressed: () {
                                      setState(() {
                                        checkpoint.add(
                                            buildCheckpoint(checkpoint.length));
                                      });
                                    },
                                    child: Text(
                                      "+ Add More Checkpoints",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14.sp),
                                    )),
                              ),
                              SizedBox(
                                height: 16.h,
                                width: 292.w,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 30.w,
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.pin_drop_outlined,
                                          color: Colors.red,
                                          size: 12.h,
                                        ),
                                        Text(
                                          "End",
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 13.w,
                                  ),
                                  Flexible(
                                    child: SizedBox(
                                      height: 46.h,
                                      child: TextField(
                                        readOnly: true,
                                        decoration: InputDecoration(
                                            hintText:
                                                "Night Shift Clock-out - 12:00 AM",
                                            hintStyle: TextStyle(
                                                fontSize: 14.sp,
                                                color: Colors.grey),
                                            enabledBorder:
                                                const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: AppColors
                                                            .disableColor)),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: AppColors
                                                            .disableColor)),
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(4.r))),
                                            label: Text(
                                              "Shift Clock-Out Point",
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 12.sp),
                                            )),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                            ],
                          ),
                        )
                      ]),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              AppButton(
                  onTaps: checkpoint.isEmpty
                      ? null
                      : () {
                          setState(() {
                            createdRoutesList
                                .add(createdRoutes(createdRoutesList.length));
                          });
                        },
                  backgoundColor:
                      // createCheckpointController.btnEnabled.value
                      //     ?
                      AppColors.black,
                  //     :
                  // AppColors.disableColor,
                  textColor: AppColors.white,
                  titleText: "+ Save & Create Another Route"),
              SizedBox(
                height: 12.h,
              ),
              AppButton(
                  onTaps: () {
                    // createCheckpointController.checkLogin();
                    Get.toNamed("/assign_guard");
                  },
                  backgoundColor:
                      // createCheckpointController.btnEnabled.value
                      //     ?
                      AppColors.primaryColor,
                  //     :
                  // AppColors.disableColor,
                  textColor: AppColors.white,
                  titleText: "Save & Next"),
              SizedBox(
                height: 12.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget selectShiftText(value) {
    return Center(
      child: SizedBox(
        height: 20.h,
        child: Row(
          children: [
            Text(
              "$value (09:00 AM -12:00PM)",
              style: AppFontStyle.mediumTextStyle(AppColors.textColor, 14.sp),
            ),
          ],
        ),
      ),
    );
  }

  Widget selectShiftTile(value) {
    return SizedBox(
      height: 44.h,
      width: 280.w,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: AppFontStyle.mediumTextStyle(AppColors.textColor, 14.sp),
          ),
          SizedBox(
            height: 0.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Clock-In: 10:00AM",
                style: AppFontStyle.mediumTextStyle(
                    AppColors.secondaryColor, 14.sp),
              ),
              Text(
                "Clock-Out: 10:00PM",
                style: AppFontStyle.mediumTextStyle(
                    AppColors.secondaryColor, 14.sp),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget selectCheckpointTile(value) {
    return Container(
      color: AppColors.white,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0.w),
            child: Image.asset(
              "assets/QR_Sample.png",
              height: 50.h,
              width: 50.w,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style:
                    AppFontStyle.mediumTextStyle(AppColors.primaryColor, 14.sp),
              ),
              SizedBox(
                height: 6.h,
              ),
              RichText(
                  text: TextSpan(
                      text: 'Total Number of Tasks:',
                      style:
                          AppFontStyle.mediumTextStyle(AppColors.black, 12.sp),
                      children: [
                    TextSpan(
                      text: ' 07',
                      style: AppFontStyle.mediumTextStyle(
                          AppColors.primaryColor, 12.sp),
                    )
                  ])),
              SizedBox(
                height: 5.h,
              ),
            ],
          )
        ],
      ),
    ).marginOnly(bottom: 1.h);
  }

////============> checkpoint build

  Widget buildCheckpoint(int index) {
    return Column(
      key: ObjectKey("index_$index"),
      children: [
        SizedBox(
          height: 20.h,
          width: 290.w,
        ),
        Padding(
          padding: EdgeInsets.only(left: 25.w),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 14.w),
                child: SizedBox(
                  width: 275.w,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 41.h,
                              child: DropdownButtonFormField(
                                  icon: const Icon(
                                      Icons.keyboard_arrow_down_rounded),
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 15.w),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: AppColors.disableColor),
                                          borderRadius: BorderRadius.vertical(
                                              bottom: Radius.circular(0.h),
                                              top: Radius.circular(4.r))),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: AppColors.disableColor),
                                          borderRadius: BorderRadius.vertical(
                                              bottom: Radius.circular(0.h),
                                              top: Radius.circular(4.r))),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.vertical(
                                              bottom: Radius.circular(0.h),
                                              top: Radius.circular(4.r))),
                                      label: Text(
                                        "Select Checkpoint",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 14.sp),
                                      )),
                                  items: null,
                                  onChanged: (e) {}),
                            ),
                            SizedBox(
                              height: 46.h,
                              child: TextFormField(
                                  // icon: const Icon(Icons.access_time),
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: AppColors.disableColor),
                                          borderRadius: BorderRadius.vertical(
                                              bottom: Radius.circular(5.r),
                                              top: Radius.circular(0.r))),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: AppColors.disableColor,
                                          ),
                                          borderRadius: BorderRadius.vertical(
                                              bottom: Radius.circular(5.r),
                                              top: Radius.circular(0.r))),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.vertical(
                                              bottom: Radius.circular(4.r))),
                                      label: const Text(
                                          "Select Checkpoint time",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  153, 153, 153, 1),
                                              fontSize: 14))),
                                  // items: null,
                                  onTap: () async {
                                    TimeOfDay? pickedTime1 =
                                        await showTimePicker(
                                      initialTime: TimeOfDay.now(),
                                      context: context,
                                      builder: (context, child) {
                                        return MediaQuery(
                                          data: MediaQuery.of(context).copyWith(
                                              alwaysUse24HourFormat: false),
                                          child: child ?? Container(),
                                        );
                                      },
                                    );
                                    if (pickedTime1 != null) {
                                      // setState(() {
                                      //   createShiftController
                                      //           .clockOutTimeController.text =
                                      //       pickedTime1
                                      //           .format(context)
                                      //           .toString();
                                      // });
                                    }
                                  },
                                  onChanged: (e) {}),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 12.w),
                        child: SizedBox(
                          width: 20.w,
                          child: InkWell(
                            child: const Icon(
                              Icons.delete_outline_outlined,
                              color: Colors.red,
                            ),
                            onTap: () => setState(
                              () {
                                if (index >= 0 && index < checkpoint.length) {
                                  checkpoint.removeAt(index);
                                } else {
                                  checkpoint.removeLast();
                                }
                              },
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: -14.h,
                left: -26.w,
                child: Column(
                  children: [
                    SizedBox(
                      width: 20.w,
                      height: 46.h,
                    ),
                    Container(
                        color: AppColors.white,
                        child: Text(
                          "CP${index + 1 + 1}",
                          style: AppFontStyle.regularTextStyle(
                              AppColors.textColor, 12.sp),
                        )),
                    SizedBox(
                      width: 20.w,
                      height: 120.h,
                      child: VerticalDivider(
                        endIndent: 2.h,
                        thickness: 1.h,
                        color: AppColors.disableColor,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget createdRoutes(index) {
    return Column(
      children: [
        SizedBox(
          height: 12.h,
        ),
        Container(
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
            padding: EdgeInsets.all(12.0.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'All Created Routes',
                      style: AppFontStyle.mediumTextStyle(
                          AppColors.primaryColor, 16.sp),
                    ),
                    SizedBox(
                      height: 16.h,
                      child: IconButton(
                        style: IconButton.styleFrom(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                        padding: EdgeInsets.zero,
                        alignment: Alignment.centerRight,
                        onPressed: () {
                          showModalEditRoute(index);
                        },
                        icon: Icon(
                          Icons.more_vert,
                          size: 16.h,
                        ),
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
                RichText(
                    text: TextSpan(
                        text: 'Route Name:',
                        style: AppFontStyle.mediumTextStyle(
                            AppColors.black, 12.sp),
                        children: [
                      TextSpan(
                        text: ' Beverly',
                        style: AppFontStyle.mediumTextStyle(
                            AppColors.primaryColor, 12.sp),
                      )
                    ])),
                RichText(
                    text: TextSpan(
                        text: 'Assign Guards:',
                        style: AppFontStyle.mediumTextStyle(
                            AppColors.black, 12.sp),
                        children: [
                      TextSpan(
                        text: ' 07',
                        style: AppFontStyle.mediumTextStyle(
                            AppColors.primaryColor, 12.sp),
                      )
                    ])),
                Row(
                  children: [
                    RichText(
                        text: TextSpan(
                            text: 'Shift Name:',
                            style: AppFontStyle.mediumTextStyle(
                                AppColors.black, 12.sp),
                            children: [
                          TextSpan(
                            text: ' Suhana shift',
                            style: AppFontStyle.mediumTextStyle(
                                AppColors.primaryColor, 12.sp),
                          )
                        ])),
                    SizedBox(
                      height: 10.h,
                      child: VerticalDivider(
                        color: AppColors.primaryBackColor,
                        width: 10.w,
                        thickness: 1.w,
                      ),
                    ),
                    RichText(
                        text: TextSpan(
                            text: 'Total Checkpoint:',
                            style: AppFontStyle.mediumTextStyle(
                                AppColors.black, 12.sp),
                            children: [
                          TextSpan(
                            text: ' 07',
                            style: AppFontStyle.mediumTextStyle(
                                AppColors.primaryColor, 12.sp),
                          )
                        ])),
                  ],
                ),
              ],
            ),
          ),
        ).paddingOnly(bottom: 4.h),
      ],
    );
  }

  Future showModalEditRoute(int index) {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        // context: _scaffoldKey.currentContext!,
        builder: (BuildContext context) {
          return AppBottomSheet(
              child: Container(
            color: AppColors.white,
            child: Column(children: [
              SizedBox(
                height: 12.h,
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.only(top: 15.h, bottom: 16.h),
                  height: 48.h,
                  width: Get.width - 80.w,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: AppColors.grayColor,
                        width: 1.w,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RichText(
                          text: TextSpan(
                              text: "Edit Route",
                              style: AppFontStyle.regularTextStyle(
                                  AppColors.primaryColor, 14.sp),
                              children: [
                            TextSpan(
                              text: "",
                              style: TextStyle(
                                  color: AppColors.secondaryColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600),
                            )
                          ])),
                      SizedBox(
                        height: 16.h,
                        child: IconButton(
                          style: IconButton.styleFrom(
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                          padding: EdgeInsets.zero,
                          alignment: Alignment.centerRight,
                          onPressed: () {
                            Navigator.pop(context);
                            // showModalEditRoute(index);
                          },
                          icon: Icon(
                            Icons.edit_square,
                            size: 22.h,
                          ),
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.only(top: 15.h, bottom: 16.h),
                  height: 48.h,
                  width: Get.width - 80.w,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: AppColors.grayColor,
                        width: 1.w,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RichText(
                          text: TextSpan(
                              text: "Delete Shift",
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400),
                              children: [
                            TextSpan(
                              text: "",
                              style: TextStyle(
                                  color: AppColors.secondaryColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600),
                            )
                          ])),
                      IconButton(
                          padding: EdgeInsets.zero,
                          alignment: Alignment.centerRight,
                          onPressed: () {
                            _showDialogDeleteRoute(index);
                            // Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.delete_outline_rounded,
                            size: 22.h,
                            color: AppColors.primaryColor,
                          )),
                    ],
                  ),
                ),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.only(top: 15.h, bottom: 16.h),
                  height: 48.h,
                  width: Get.width - 80.w,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: AppColors.grayColor,
                        width: 1.w,
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ));
        });
  }

  Future _showDialogDeleteRoute(int index) async {
    return showDialog(
        context: context,
        // context: _scaffoldKey.currentContext!,
        builder: (BuildContext context) {
          return Dialog(
            insetPadding: EdgeInsets.all(15.h),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(6.r)),
              height: 150.h,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22.w),
                      child: Text("Are you sure you want to delete this route?",
                          textAlign: TextAlign.center,
                          style: AppFontStyle.mediumTextStyle(
                              AppColors.textColor, 14.sp)),
                    ),
                    SizedBox(
                      height: 35.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                fixedSize: Size(127.w, 35.h),
                                side: const BorderSide(
                                    color: AppColors.primaryColor),
                                surfaceTintColor: AppColors.white,
                                backgroundColor: AppColors.white,
                                foregroundColor: AppColors.primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.r))),
                            onPressed: () {
                              // Navigator.pop(context);
                              Future.delayed(const Duration(milliseconds: 500),
                                  () {
                                // createdShiftsList.removeAt(index);
                                // createdShiftsList.removeWhere((element) =>
                                //     element == createdShiftsList[index]);
                                Navigator.pop(context);
                                // controller.roleStatus.removeAt(index);
                                // controller.roleStatus.removeWhere((element) =>
                                //     element == controller.roleStatus[index]);
                              });
                            },
                            child: Text(
                              "Delete",
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.w600),
                            )),
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                minimumSize: Size(130.w, 35.h),
                                side: const BorderSide(
                                    color: AppColors.primaryColor),
                                surfaceTintColor: AppColors.white,
                                backgroundColor: AppColors.primaryColor,
                                foregroundColor: AppColors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.r))),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.w600),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
