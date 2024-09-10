// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:sgt_owner/feature/Properties/property_view_carousal.dart';
import 'package:sgt_owner/feature/Properties/shift/controller/shift_controller.dart';
import 'package:sgt_owner/shared/widgets/custom_appbar.dart';
import 'package:sgt_owner/shared/widgets/custom_bottomsheet.dart';
import 'package:sgt_owner/shared/widgets/custom_buttons.dart';
import 'package:sgt_owner/shared/widgets/custom_progressbar.dart';
import 'package:sgt_owner/shared/widgets/custom_textfield.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CreateShiftPage extends StatefulWidget {
  const CreateShiftPage({super.key});

  @override
  State<CreateShiftPage> createState() => _CreateShiftPageState();
}

class _CreateShiftPageState extends State<CreateShiftPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool hide = false;
  bool clockInQrImageGenerated = false;
  bool clockOutQrImageGenerated = false;
  bool multipleShiftCreated = false;
  final createShiftController = Get.put(CreateShiftController());

  List<Widget> createdShiftsList = [];

  // late TabController _tabController;
  @override
  void dispose() {
    super.dispose();
    // _tabController.dispose();
  }

  final _shiftNameFocus = FocusNode();
  final _clockInTimeFocus = FocusNode();
  final _clockInDescriptionFocus = FocusNode();
  final _clockOutTimeFocus = FocusNode();
  final _clockOutDescriptionFocus = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int pageIndex = 0;
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: AppColors.backgroundColor,
        appBar: CustomAppBar(
          titleText: 'Create Shift',
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
              SizedBox(
                height: 12.h,
              ),
              //=======>All Created Shifts
              Column(
                  children: createdShiftsList.length != 0
                      ? [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Divider(
                                        height: 3.h,
                                        thickness: 1.h,
                                        color: AppColors.primaryBackColor,
                                      ),
                                    ),
                                    Text(
                                      'All Created Shifts',
                                      style: AppFontStyle.semiboldTextStyle(
                                          AppColors.primaryColor, 16.sp),
                                    ),
                                    Expanded(
                                      child: Divider(
                                        height: 3.h,
                                        thickness: 1.h,
                                        color: AppColors.primaryBackColor,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                ListView.builder(
                                    padding: EdgeInsets.zero,
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: createdShiftsList.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [createdShiftsList[index]],
                                      );
                                    }),
                                SizedBox(
                                  height: 12.h,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Divider(
                                        height: 3.h,
                                        thickness: 1.h,
                                        color: AppColors.primaryBackColor,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                              ],
                            ),
                          ),
                        ]
                      : []),

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
                          'Shift for Radission Blu Hotel',
                          style: AppFontStyle.semiboldTextStyle(
                              AppColors.textColor, 16.sp),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Form(
                          key: createShiftController.shiftNameFormKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: SignUpTextField(
                            controller:
                                createShiftController.shiftNameController,
                            label: RichText(
                                text: TextSpan(
                                    text: 'Shift Name',
                                    style: AppFontStyle.lightTextStyle(
                                        AppColors.black, 14.sp),
                                    children: const [
                                  TextSpan(
                                      text: ' *',
                                      style: TextStyle(
                                        color: Colors.red,
                                      ))
                                ])),
                            maxWords: 64,
                            hintText: "Enter Shift Name",
                            keyboardType: TextInputType.text,
                            focusNode: _shiftNameFocus,
                            onSaved: (value) {
                              createShiftController.shiftName = value!;
                            },
                            validator: (value) {
                              return createShiftController
                                  .validateShiftName(value!);
                            },
                            onTapOutside: (event) {
                              FocusScope.of(context).unfocus();
                            },
                            onFieldSubmitted: (value) {
                              FocusScope.of(context)
                                  .requestFocus(_clockInTimeFocus);
                            },
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Clock-In Time',
                              style: AppFontStyle.lightTextStyle(
                                  AppColors.black, 12.sp),
                            ),
                            TextFormField(
                              focusNode: _clockInTimeFocus,
                              controller:
                                  createShiftController.clockInTimeController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "Select Clock-In Time",
                                hintStyle: AppFontStyle.regularTextStyle(
                                    AppColors.hintColor, 14.sp),
                                suffixIcon: Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      end: 12.0),
                                  child: Icon(
                                    Icons.access_time,
                                    size: 18.h,
                                    color: AppColors.secondaryColor,
                                  ), // myIcon is a 48px-wide widget.
                                ),
                                // errorText:
                                //     errorText != '' ? errorText : '\u24D8 $errorText',
                                // errorStyle: AppFontStyle.regularTextStyle(
                                //   AppColors.redColor,
                                //   10.sp,
                                // ),
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 19.w),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: const BorderSide(
                                      width: 1, color: AppColors.disableColor),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: const BorderSide(
                                      width: 1, color: AppColors.disableColor),
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
                                      data: MediaQuery.of(context).copyWith(
                                          alwaysUse24HourFormat: false),
                                      child: child ?? Container(),
                                    );
                                  },
                                );
                                if (pickedTime != null) {
                                  setState(() {
                                    createShiftController
                                            .clockInTimeController.text =
                                        pickedTime.format(context).toString();
                                  });
                                }
                              },
                              validator: (value) {
                                return createShiftController
                                    .validateClockInTime(value!);
                              },
                              onFieldSubmitted: (value) {
                                FocusScope.of(context)
                                    .requestFocus(_clockInDescriptionFocus);
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Form(
                          key: createShiftController.clockInDescriptionFormKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: SignUpTextField(
                            controller: createShiftController
                                .clockInDescriptionController,
                            label: RichText(
                                text: TextSpan(
                                    text: 'Clock-In Description',
                                    style: AppFontStyle.lightTextStyle(
                                        AppColors.black, 14.sp),
                                    children: const [
                                  TextSpan(
                                      text: ' *',
                                      style: TextStyle(
                                        color: Colors.red,
                                      ))
                                ])),
                            maxWords: 150,
                            maxLines: 3,
                            hintText: "Enter Clock-In description here...",
                            keyboardType: TextInputType.text,
                            focusNode: _clockInDescriptionFocus,
                            onSaved: (value) {
                              createShiftController.clockInDescription = value!;
                            },
                            validator: (value) {
                              return createShiftController
                                  .validateClockInDescription(value!);
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
                          height: 14.h,
                        ),
                        clockInQrImageGenerated
                            ? Column(
                                children: [
                                  Center(
                                    child: QrImageView(
                                      data: createShiftController
                                          .clockInDescription,
                                      size: 150.w,
                                      // You can include embeddedImageStyle Property if you
                                      //wanna embed an image from your Asset folder
                                      embeddedImageStyle: QrEmbeddedImageStyle(
                                        size: Size(174.w, 161.h),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Scan QR Code to START the shift',
                                    style: AppFontStyle.mediumTextStyle(
                                        AppColors.textColor, 12.sp),
                                  ),
                                ],
                              )
                            : Obx(
                                () => Container(
                                  child:
                                      !createShiftController.btnEnabled1.value
                                          ? DottedBorder(
                                              color: AppColors.disableColor,
                                              child: SizedBox(
                                                width: Get.width - 32.w,
                                                child: TextButton(
                                                  child: Text(
                                                    'Generate QR code',
                                                    style: AppFontStyle
                                                        .semiboldTextStyle(
                                                            AppColors
                                                                .secondaryColor,
                                                            14.sp),
                                                  ),
                                                  onPressed: () => {},
                                                ),
                                              ))
                                          : AppButton(
                                              onTaps: () {
                                                setState(() {
                                                  clockInQrImageGenerated =
                                                      !clockInQrImageGenerated;
                                                });
                                                // Get.toNamed("/generate_qr");
                                                // createShiftController.checkLogin();
                                              },
                                              backgoundColor:
                                                  AppColors.primaryColor,
                                              textColor: AppColors.white,
                                              titleText: "Generate QR code"),
                                ),
                              ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Divider(
                          color: AppColors.secondaryColor,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Clock-Out Time',
                              style: AppFontStyle.lightTextStyle(
                                  AppColors.black, 12.sp),
                            ),
                            TextFormField(
                              focusNode: _clockOutTimeFocus,
                              controller:
                                  createShiftController.clockOutTimeController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "Select Clock-Out Time",
                                hintStyle: AppFontStyle.regularTextStyle(
                                    AppColors.hintColor, 14.sp),
                                suffixIcon: Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      end: 12.0),
                                  child: Icon(
                                    Icons.access_time,
                                    size: 18.h,
                                    color: AppColors.secondaryColor,
                                  ), // myIcon is a 48px-wide widget.
                                ),
                                // errorText:
                                //     errorText != '' ? errorText : '\u24D8 $errorText',
                                // errorStyle: AppFontStyle.regularTextStyle(
                                //   AppColors.redColor,
                                //   10.sp,
                                // ),
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 19.w),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: const BorderSide(
                                      width: 1, color: AppColors.disableColor),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: const BorderSide(
                                      width: 1, color: AppColors.disableColor),
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
                                TimeOfDay? pickedTime1 = await showTimePicker(
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
                                  setState(() {
                                    createShiftController
                                            .clockOutTimeController.text =
                                        pickedTime1.format(context).toString();
                                  });
                                }
                              },
                              validator: (value) {
                                return createShiftController
                                    .validateClockOutTime(value!);
                              },
                              onFieldSubmitted: (value) {
                                FocusScope.of(context)
                                    .requestFocus(_clockOutDescriptionFocus);
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Form(
                          key: createShiftController.clockOutDescriptionFormKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: SignUpTextField(
                            controller: createShiftController
                                .clockOutDescriptionController,
                            label: RichText(
                                text: TextSpan(
                                    text: 'Clock-Out Description',
                                    style: AppFontStyle.lightTextStyle(
                                        AppColors.black, 14.sp),
                                    children: const [
                                  TextSpan(
                                      text: ' *',
                                      style: TextStyle(
                                        color: Colors.red,
                                      ))
                                ])),
                            maxWords: 150,
                            maxLines: 3,
                            hintText: "Enter Property description here...",
                            keyboardType: TextInputType.text,
                            focusNode: _clockOutDescriptionFocus,
                            onSaved: (value) {
                              createShiftController.clockOutDescription =
                                  value!;
                            },
                            validator: (value) {
                              return createShiftController
                                  .validateClockOutDescription(value!);
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
                          height: 9.h,
                        ),
                        clockOutQrImageGenerated
                            ? Column(
                                children: [
                                  Center(
                                    child: QrImageView(
                                      data: createShiftController
                                          .clockOutDescription,
                                      size: 150.w,
                                      // You can include embeddedImageStyle Property if you
                                      //wanna embed an image from your Asset folder
                                      embeddedImageStyle: QrEmbeddedImageStyle(
                                        size: Size(174.w, 161.h),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Scan QR Code to end the shift',
                                    style: AppFontStyle.mediumTextStyle(
                                        AppColors.textColor, 12.sp),
                                  ),
                                ],
                              )
                            : Obx(
                                () => Container(
                                  child:
                                      !createShiftController.btnEnabled2.value
                                          ? DottedBorder(
                                              color: AppColors.disableColor,
                                              child: Container(
                                                width: Get.width - 32.w,
                                                child: TextButton(
                                                  // focusNode: _generateQrCodeFocus,
                                                  child: Text(
                                                    'Generate QR code',
                                                    style: AppFontStyle
                                                        .semiboldTextStyle(
                                                            AppColors
                                                                .secondaryColor,
                                                            14.sp),
                                                  ),
                                                  onPressed: () => {},
                                                ),
                                              ))
                                          : AppButton(
                                              onTaps: () {
                                                setState(() {
                                                  clockOutQrImageGenerated =
                                                      !clockOutQrImageGenerated;
                                                });
                                                // Get.toNamed("/generate_qr");
                                                // createShiftController.checkLogin();
                                              },
                                              backgoundColor:
                                                  AppColors.primaryColor,
                                              textColor: AppColors.white,
                                              titleText: "Generate QR code"),
                                ),
                              ),
                        SizedBox(
                          height: 12.h,
                        ),
                      ]),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Obx(
                () => AppButton(
                    onTaps: createShiftController.saveBtnEnabled.value
                        ? () {
                            setState(() {
                              createdShiftsList
                                  .add(createdShifts(createdShiftsList.length));
                            });
                          }
                        : null,
                    backgoundColor: createShiftController.saveBtnEnabled.value
                        ? AppColors.black
                        : AppColors.disableColor,
                    textColor: AppColors.white,
                    titleText: "+ Save & Create Another Shift"),
              ),
              SizedBox(
                height: 16.h,
              ),
              Obx(
                () => AppButton(
                    onTaps: createShiftController.saveBtnEnabled.value
                        ? () {
                            Get.toNamed("/create_checkpoint");
                            // createShiftController.checkLogin();
                          }
                        : null,
                    backgoundColor: createShiftController.saveBtnEnabled.value
                        ? AppColors.primaryColor
                        : AppColors.disableColor,
                    textColor: AppColors.white,
                    titleText: "Save & Next"),
              ),
              SizedBox(
                height: 60.h,
              ),
            ],
          ),
        ));
  }

  Widget createdShifts(index) {
    return Container(
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
        padding: EdgeInsets.fromLTRB(8.w, 14.h, 12.w, 10.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hallway Shift ${index + 1}',
                  style: AppFontStyle.semiboldTextStyle(
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
                      showModalEditShift(index);
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
            SizedBox(
              height: 10.h,
            ),
            Container(
              // height: 50,
              decoration: BoxDecoration(
                  color: AppColors.primaryBackColor,
                  borderRadius: BorderRadius.all(Radius.circular(6.r))),
              child: Padding(
                padding: EdgeInsets.all(8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/QR_Sample.png",
                          height: 50.h,
                          width: 50.w,
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Clock In:',
                              style: AppFontStyle.mediumTextStyle(
                                  AppColors.black, 14.sp),
                            ),
                            Text(
                              '08:00 AM',
                              style: AppFontStyle.mediumTextStyle(
                                  AppColors.grayColor, 14.sp),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/QR_Sample.png",
                          height: 50.h,
                          width: 50.w,
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Clock In:',
                              style: AppFontStyle.mediumTextStyle(
                                  AppColors.black, 14.sp),
                            ),
                            Text(
                              '08:00 AM',
                              style: AppFontStyle.mediumTextStyle(
                                  AppColors.grayColor, 14.sp),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ).paddingOnly(bottom: 8.h);
  }

  Future showModalEditShift(int index) {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: _scaffoldKey.currentContext!,
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
                              text: "Edit Shift",
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
                            // showModalEditShift(index);
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
                            _showDialogDeleteShift(index);
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

  Future _showDialogDeleteShift(int index) async {
    return showDialog(
        context: _scaffoldKey.currentContext!,
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
                      child: Text("Are you sure you want to delete this shift?",
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
                              Future.delayed(Duration(milliseconds: 500), () {
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

class ShiftList extends StatelessWidget {
  ShiftList({super.key});

  final List<String> items = [
    'Item 1',
    'Item 2',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'All Created Shifts',
          style:
              AppFontStyle.semiboldTextStyle(AppColors.secondaryColor, 14.sp),
        ),
        ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Container(
                color: AppColors.white,
                width: Get.width - 32.w,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    margin: EdgeInsets.all(2),
                    color: AppColors.white,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              items[index].toString(),
                              style: AppFontStyle.semiboldTextStyle(
                                  AppColors.secondaryColor, 14.sp),
                            ),
                            Icon(
                              Icons.more_vert,
                              color: AppColors.secondaryColor,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: Get.width - 32.w,
                            color: AppColors.primaryBackColor,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  items[index].toString(),
                                  style: AppFontStyle.semiboldTextStyle(
                                      AppColors.secondaryColor, 14.sp),
                                ),
                                Text(
                                  items[index].toString(),
                                  style: AppFontStyle.semiboldTextStyle(
                                      AppColors.secondaryColor, 14.sp),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
      ],
    );
  }
}
