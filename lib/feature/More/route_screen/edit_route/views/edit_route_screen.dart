// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgt_owner/feature/More/route_screen/edit_route/controller/edit_route_controller.dart';
import 'package:sgt_owner/feature/Properties/property_view_carousal.dart';
import 'package:sgt_owner/shared/widgets/custom_appbar.dart';
import 'package:sgt_owner/shared/widgets/custom_buttons.dart';
import 'package:sgt_owner/shared/widgets/custom_progressbar.dart';
import 'package:sgt_owner/shared/widgets/custom_textfield.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';

class EditRouteScreen extends StatefulWidget {
  const EditRouteScreen({super.key});

  @override
  State<EditRouteScreen> createState() => _EditRouteScreenState();
}

class _EditRouteScreenState extends State<EditRouteScreen> {
  bool hide = false;
  final editRouteController = Get.put(EditRouteController());
  String? selectedShift;
  String? selectedCheckpoint;

  // late TabController _tabController;
  @override
  void dispose() {
    super.dispose();
    // _tabController.dispose();
  }

  final _routeNameFocus = FocusNode();
  final _shiftListFocus = FocusNode();
  // final _checkpointDescriptionFocus = FocusNode();
  // final _latitudeFocus = FocusNode();
  // final _longitudeFocus = FocusNode();
  // final _taskFocus = FocusNode();
  // final _commentFocus = FocusNode();
  // final _generateQrCodeFocus = FocusNode();

  List<String> shiftList = [
    "Morning Shift (08:00AM-12:00PM)",
    "Mid-day Shift (12:00PM-03:00PM)",
    "Early Evening Shift (03:00PM-05:00PM)",
    "Evening Shift (05:00PM-08:00PM)",
    "Night Shift (08:00PM-11:00PM)",
  ];

  List<String> checkPointList = [
    "Checkpoint 1",
    "Checkpoint 2",
    "Checkpoint 3",
    "Checkpoint 4",
    "Checkpoint 5",
    "Checkpoint 6",
    "Checkpoint 7",
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        titleText: 'Edit Route',
        isLeading: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(
                height: 16.h,
              ),
              PropertyCarousal(),
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
                        SizedBox(
                          height: 12.h,
                        ),
                        Form(
                          key: editRouteController.routeNameFormKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: SignUpTextField(
                            controller: editRouteController.routeNameController,
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
                              editRouteController.routeName = value!;
                            },
                            validator: (value) {
                              return editRouteController
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
                        Form(
                          key: editRouteController.shiftListFormKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: buildDropdown('Shift', shiftList, (value) {
                            setState(() {
                              selectedShift = value;
                            });
                          }, _shiftListFocus, 'Select Shift'),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Text(
                          'Add Checkpoint on the Route',
                          style: AppFontStyle.semiboldTextStyle(
                              AppColors.textColor, 16.sp),
                        ),
                        Text(
                          'Route clock-in & clock-out time will auto fill.',
                          style: AppFontStyle.lightTextStyle(
                              AppColors.secondaryColor, 12.sp),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.w, vertical: 16.h),
                              child: routeLine(),
                            ),
                            Expanded(
                                child:
                                    AddCheckPointBetweenRoute(checkPointList))
                          ],
                        ),
                      ]),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Container(
                width: Get.width - 32.w,
                child: Column(
                  children: [
                    Container(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: AppButton(
                            onTaps: () {
                              // Get.toNamed('/edit_route');
                            },
                            backgoundColor: AppColors.primaryColor,
                            textColor: AppColors.white,
                            titleText: "Save "),
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: AppButton(
                          onTaps: () {},
                          backgoundColor: AppColors.white,
                          textColor: AppColors.primaryColor,
                          titleText: 'Delete Route',
                          borderColor: AppColors.primaryColor,
                          isIcon: false,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 38.h,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget AddCheckPointBetweenRoute(List<String> checkpointList) {
    return Column(
      children: [
        SizedBox(
          height: 16.h,
        ),
        Form(
          // key: createCheckpointController.taskFormKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: AppTextField(
            controller: editRouteController.selectedShiftController,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            label: RichText(
                text: TextSpan(
              text: 'Shift Clock-In',
              style: AppFontStyle.lightTextStyle(AppColors.greenColor, 12.sp),
            )),
            hintText: "Night shift (09:00 AM -12:00PM)",
            keyboardType: TextInputType.text,
            readOnly: true,
            // focusNode: _taskFocus,
            onSaved: (value) {
              // createCheckpointController.task = value!;
            },
            // validator: (value) {
            //   return createCheckpointController
            //       .validateTask(value!);
            // },
            // onFieldSubmitted: (value) {
            //   FocusScope.of(context).unfocus();
            // },
            // onTapOutside: (event) {
            //   FocusScope.of(context).unfocus();
            // },
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        Form(
          key: editRouteController.checkPointListFormKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: buildDropdown('Checkpoint', checkpointList, (value) {
            setState(() {
              selectedCheckpoint = value;
            });
          }, _shiftListFocus, 'Select Checkpoint'),
        ),
        SizedBox(
          height: 4.h,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Text(
            //   'CheckPoint Time',
            //   style: AppFontStyle.lightTextStyle(AppColors.black, 12.sp),
            // ),
            TextFormField(
              controller: editRouteController.checkPointTimeController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Select Checkpoint time",
                hintStyle:
                    AppFontStyle.regularTextStyle(AppColors.textColor, 14.sp),
                suffixIcon: Padding(
                  padding: const EdgeInsetsDirectional.only(end: 12.0),
                  child: Icon(
                    Icons.more_time_outlined,
                    color: AppColors.secondaryColor,
                  ), // myIcon is a 48px-wide widget.
                ),
                // errorText:
                //     errorText != '' ? errorText : '\u24D8 $errorText',
                // errorStyle: AppFontStyle.regularTextStyle(
                //   AppColors.redColor,
                //   10.sp,
                // ),
                contentPadding: EdgeInsets.symmetric(horizontal: 19.w),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide:
                      const BorderSide(width: 1, color: AppColors.disableColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide:
                      const BorderSide(width: 1, color: AppColors.disableColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: const BorderSide(
                    color: AppColors.primaryColor,
                    width: 1.0,
                  ),
                ),
              ),
              readOnly:
                  true, //set it true, so that user will not able to edit text
              onTap: () async {
                TimeOfDay? pickedTime = await showTimePicker(
                  initialTime: TimeOfDay.now(),
                  context: context,
                  builder: (context, child) {
                    return MediaQuery(
                      data: MediaQuery.of(context)
                          .copyWith(alwaysUse24HourFormat: false),
                      child: child ?? Container(),
                    );
                  },
                );
              },
            ),
          ],
        ),
        SizedBox(
          height: 16.h,
        ),
        AppButton(
            onTaps: () {
              // createCheckpointController.checkLogin();
            },
            backgoundColor:
                // createCheckpointController.btnEnabled.value
                //     ? AppColors.primaryColor
                //     :
                AppColors.black,
            textColor: AppColors.white,
            titleText: "+ Add More Checkpoints"),
        SizedBox(
          height: 16.h,
        ),
        Form(
          // key: createCheckpointController.taskFormKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: AppTextField(
            controller: editRouteController.selectedShiftController,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            label: RichText(
                text: TextSpan(
              text: 'Shift Clock-Out Point',
              style: AppFontStyle.lightTextStyle(Colors.orangeAccent, 12.sp),
            )),
            hintText: "Night shift Clock-out- 12:00 AM",
            keyboardType: TextInputType.text,
            readOnly: true,
            // focusNode: _taskFocus,
            onSaved: (value) {
              // createCheckpointController.task = value!;
            },
            // validator: (value) {
            //   return createCheckpointController
            //       .validateTask(value!);
            // },
            // onFieldSubmitted: (value) {
            //   FocusScope.of(context).unfocus();
            // },
            // onTapOutside: (event) {
            //   FocusScope.of(context).unfocus();
            // },
          ),
        ),
      ],
    );
  }

  Widget buildDropdown(
      String label, List<String> items, onChanged, focusNode, hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField(
          value: items.contains(selectedShift) ? selectedShift : null,
          onChanged: onChanged,
          focusNode: focusNode,
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style:
                    AppFontStyle.regularTextStyle(AppColors.textColor, 14.sp),
              ),
            );
          }).toList(),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: hintText,
            hintStyle:
                AppFontStyle.regularTextStyle(AppColors.hintColor, 12.sp),
            errorStyle: AppFontStyle.regularTextStyle(
              AppColors.redColor,
              10.sp,
            ),
            label: RichText(
                text: TextSpan(
                    text: label,
                    style: AppFontStyle.lightTextStyle(AppColors.black, 14.sp),
                    children: [
                  TextSpan(
                      text: ' *',
                      style: TextStyle(
                        color: Colors.red,
                      ))
                ])),
            labelStyle: AppFontStyle.regularTextStyle(AppColors.black, 12.sp),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 19.w, vertical: 5.h),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide:
                  const BorderSide(width: 1, color: AppColors.disableColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide:
                  const BorderSide(width: 1, color: AppColors.disableColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
                width: 1.0,
              ),
            ),
          ),
          validator: (value) {
            return editRouteController.validateShift(value!);
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
}

class routeLine extends StatelessWidget {
  const routeLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h * 3.h,
      width: 30.w,
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Column(
              children: [
                (index == 0)
                    ? Container(
                        child: Column(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: AppColors.greenColor,
                            ),
                            Text(
                              'Start',
                              style: AppFontStyle.regularTextStyle(
                                  AppColors.greenColor, 12.sp),
                            ),
                            SizedBox(
                              height: 4.h,
                            )
                          ],
                        ),
                      )
                    : (index == 2)
                        ? Container(
                            child: Column(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: AppColors.redColor,
                                ),
                                Text(
                                  'End',
                                  style: AppFontStyle.regularTextStyle(
                                      AppColors.redColor, 12.sp),
                                ),
                                SizedBox(
                                  height: 4.h,
                                )
                              ],
                            ),
                          )
                        : Container(
                            height: 30.h,
                            width: 30.w,
                            margin: EdgeInsets.all(7),
                            child: Text(
                              'CP1',
                              style: AppFontStyle.regularTextStyle(
                                  AppColors.textColor, 12.sp),
                            ),
                          ),
                index == 2
                    ? Container()
                    : Container(
                        height: 90.h,
                        child: VerticalDivider(
                          color: AppColors.secondaryColor,
                        ))
              ],
            );
          }),
    );
  }
}
