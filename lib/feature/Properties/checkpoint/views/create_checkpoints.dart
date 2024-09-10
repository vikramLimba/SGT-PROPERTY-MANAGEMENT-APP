// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sgt_owner/feature/Properties/checkpoint/controller/checkpoint_imagepicker_controller.dart';
import 'package:sgt_owner/feature/Properties/checkpoint/controller/create_checkpoint_controller.dart';
import 'package:sgt_owner/feature/Properties/property_view_carousal.dart';
import 'package:sgt_owner/shared/widgets/custom_appbar.dart';
import 'package:sgt_owner/shared/widgets/custom_bottomsheet.dart';
import 'package:sgt_owner/shared/widgets/custom_buttons.dart';
import 'package:sgt_owner/shared/widgets/custom_progressbar.dart';
import 'package:sgt_owner/shared/widgets/custom_textfield.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';

class CreateCheckPointPage extends StatefulWidget {
  const CreateCheckPointPage({super.key});

  @override
  State<CreateCheckPointPage> createState() => _CreateCheckPointPageState();
}

class _CreateCheckPointPageState extends State<CreateCheckPointPage> {
  List<Widget> checkpointList = [];
  List<Widget> taskList = [];
  bool hide = false;
  bool commentQrImageGenerated = false;

  final createCheckpointController = Get.put(CreateCheckpointController());
  CheckpointImagePickerController imgController =
      Get.put(CheckpointImagePickerController());
  // late TabController _tabController;
  @override
  void dispose() {
    super.dispose();
    // _tabController.dispose();
  }

  final _checkpointNameFocus = FocusNode();
  final _checkpointDescriptionFocus = FocusNode();
  final _latitudeFocus = FocusNode();
  final _longitudeFocus = FocusNode();
  final _taskFocus = FocusNode();
  final _commentFocus = FocusNode();
  final _generateQrCodeFocus = FocusNode();

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // executes after build
    });
  }

  @override
  Widget build(BuildContext context) {
    int pageIndex = 1;
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: CustomAppBar(
          titleText: 'Create Checkpoint',
          isLeading: true,
        ),
        body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(children: [
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
              Divider(
                color: AppColors.secondaryColor,
                indent: 16.w,
                endIndent: 16.w,
              ),
              SizedBox(
                height: 12.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: checkpointList.length,
                        itemBuilder: (context, index) {
                          if (checkpointList.isEmpty) {
                            return null;
                          } else {
                            return checkpointList[index];
                          }
                        }),
                  ],
                ),
              ),
              Align(
                  alignment: FractionalOffset.centerLeft,
                  child: Text(
                    'Checkpoint 1',
                    style: AppFontStyle.mediumTextStyle(
                        AppColors.secondaryColor, 16.sp),
                  ).paddingOnly(left: 16.w)),
              SizedBox(
                height: 16.h,
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
                          height: 8.h,
                        ),
                        Text(
                          'Checkpoint Details',
                          style: AppFontStyle.semiboldTextStyle(
                              AppColors.textColor, 16.sp),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Form(
                          key: createCheckpointController.checkpointNameFormKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: SignUpTextField(
                            controller: createCheckpointController
                                .checkpointNameController,
                            label: RichText(
                                text: TextSpan(
                                    text: 'Checkpoint Name',
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
                            hintText: "Enter Checkpoint Name",
                            keyboardType: TextInputType.text,
                            focusNode: _checkpointNameFocus,
                            onSaved: (value) {
                              createCheckpointController.checkpointName =
                                  value!;
                            },
                            validator: (value) {
                              return createCheckpointController
                                  .validateCheckpointName(value!);
                            },
                            onTapOutside: (event) {
                              FocusScope.of(context).unfocus();
                            },
                            onFieldSubmitted: (value) {
                              FocusScope.of(context)
                                  .requestFocus(_checkpointDescriptionFocus);
                            },
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Form(
                          key: createCheckpointController
                              .checkpointDescriptionFormKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: SignUpTextField(
                            controller: createCheckpointController
                                .checkpointDescriptionController,
                            label: RichText(
                                text: TextSpan(
                                    text: 'Checkpoint Description',
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
                            maxLines: 5,
                            hintText: "Write Description here...",
                            keyboardType: TextInputType.text,
                            focusNode: _checkpointDescriptionFocus,
                            onSaved: (value) {
                              createCheckpointController.checkpointDescription =
                                  value!;
                            },
                            validator: (value) {
                              return createCheckpointController
                                  .validateCheckpointDescription(value!);
                            },
                            onTapOutside: (event) {
                              FocusScope.of(context).unfocus();
                            },
                            onFieldSubmitted: (value) {
                              FocusScope.of(context)
                                  .requestFocus(_latitudeFocus);
                            },
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        AddCheckpointImage(imgController: imgController),
                        SizedBox(
                          height: 12.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                                text: TextSpan(
                                    text: 'Add Checkpoint\n Lat & Long',
                                    style: AppFontStyle.semiboldTextStyle(
                                        AppColors.black, 16.sp),
                                    children: const [
                                  TextSpan(
                                      text: ' *',
                                      style: TextStyle(
                                        color: Colors.red,
                                      ))
                                ])),
                            GestureDetector(
                              onTap: () => {},
                              child: Row(
                                children: [
                                  Text(
                                    'Auto Detect',
                                    style: AppFontStyle.mediumTextStyle(
                                        AppColors.primaryColor, 12.sp),
                                  ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  Icon(
                                    Icons.my_location,
                                    color: AppColors.primaryColor,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Form(
                          key: createCheckpointController.latitudeFormKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: AppTextField(
                            controller:
                                createCheckpointController.latitudeController,
                            label: RichText(
                                text: TextSpan(
                                    text: 'Latitude',
                                    style: AppFontStyle.lightTextStyle(
                                        AppColors.black, 14.sp),
                                    children: [
                                  TextSpan(
                                      text: ' *',
                                      style: TextStyle(
                                        color: Colors.red,
                                      ))
                                ])),
                            hintText: "Enter Latitude",
                            keyboardType: TextInputType.number,
                            focusNode: _latitudeFocus,
                            onSaved: (value) {
                              createCheckpointController.latitude = value!;
                            },
                            validator: (value) {
                              return createCheckpointController
                                  .validateLatitude(value!);
                            },
                            onFieldSubmitted: (value) {
                              FocusScope.of(context)
                                  .requestFocus(_longitudeFocus);
                            },
                            onTapOutside: (event) {
                              FocusScope.of(context).unfocus();
                            },
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Form(
                          key: createCheckpointController.longitudeFormKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: AppTextField(
                            controller:
                                createCheckpointController.longitudeController,
                            label: RichText(
                                text: TextSpan(
                                    text: 'Longitude',
                                    style: AppFontStyle.lightTextStyle(
                                        AppColors.black, 14.sp),
                                    children: [
                                  TextSpan(
                                      text: ' *',
                                      style: TextStyle(
                                        color: Colors.red,
                                      ))
                                ])),
                            hintText: "Enter Longitude",
                            keyboardType: TextInputType.number,
                            focusNode: _longitudeFocus,
                            onSaved: (value) {
                              createCheckpointController.longitude = value!;
                            },
                            validator: (value) {
                              return createCheckpointController
                                  .validateLongitude(value!);
                            },
                            onFieldSubmitted: (value) {
                              FocusScope.of(context)
                                  .requestFocus(_longitudeFocus);
                            },
                            onTapOutside: (event) {
                              FocusScope.of(context).unfocus();
                            },
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Text(
                          'Tasks for this checkpoint',
                          style: AppFontStyle.semiboldTextStyle(
                              AppColors.textColor, 16.sp),
                        ),
                        Text(
                          'Minimum 1 and Maximum 15 Task can be added in a single checkpoint.',
                          maxLines: 2,
                          style: AppFontStyle.lightTextStyle(
                              AppColors.secondaryColor, 12.sp),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Form(
                          key: createCheckpointController.taskFormKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: AppTextField(
                            controller:
                                createCheckpointController.taskController,
                            label: RichText(
                                text: TextSpan(
                              text: 'Task 1',
                              style: AppFontStyle.lightTextStyle(
                                  AppColors.black, 14.sp),
                            )),
                            hintText: "Add task",
                            keyboardType: TextInputType.text,
                            focusNode: _taskFocus,
                            onSaved: (value) {
                              createCheckpointController.task = value!;
                            },
                            validator: (value) {
                              return createCheckpointController
                                  .validateTask(value!);
                            },
                            onFieldSubmitted: (value) {
                              FocusScope.of(context).unfocus();
                            },
                            onTapOutside: (event) {
                              FocusScope.of(context).unfocus();
                            },
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Column(
                          children: [
                            ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: taskList.length,
                                itemBuilder: (context, index) {
                                  if (taskList.isEmpty) {
                                    return null;
                                  } else {
                                    return taskList[index];
                                  }
                                }),
                          ],
                        ),
                        AppButton(
                            onTaps: taskList.length == 14
                                ? null
                                : () {
                                    setState(() {
                                      taskList.add(tasks(taskList.length));
                                    });
                                  },
                            backgoundColor: AppColors.black,
                            textColor: AppColors.white,
                            titleText: "+ Add More Task"),
                        SizedBox(
                          height: 16.h,
                        ),
                        Text(
                          'Generate QR code',
                          style: AppFontStyle.semiboldTextStyle(
                              AppColors.textColor, 16.sp),
                        ),
                        Text(
                          'Note: A QR Code will only be generated after filling the mandatory fields & this Description will show below QR code.',
                          maxLines: 2,
                          style: AppFontStyle.lightTextStyle(
                              AppColors.secondaryColor, 12.sp),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Container(
                          width: Get.width - 32.w,
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.disableColor),
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(10.r, 10.r))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                child: commentQrImageGenerated
                                    ? Container()
                                    : Form(
                                        key: createCheckpointController
                                            .commentFormKey,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        child: TextFormField(
                                          controller: createCheckpointController
                                              .commentController,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor:
                                                AppColors.backgroundColor,
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color:
                                                        AppColors.disableColor),
                                                borderRadius:
                                                    BorderRadius.circular(6.r)),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color:
                                                        AppColors.disableColor),
                                                borderRadius:
                                                    BorderRadius.circular(6.r)),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color:
                                                        AppColors.disableColor),
                                                borderRadius:
                                                    BorderRadius.circular(6.r)),
                                            label: RichText(
                                                text: TextSpan(
                                              text: 'Comment',
                                              style:
                                                  AppFontStyle.lightTextStyle(
                                                      AppColors.black, 14.sp),
                                            )),
                                            hintText: "Add your comment...",
                                          ),
                                          maxLines: 3,
                                          maxLength: 65,
                                          keyboardType: TextInputType.text,
                                          focusNode: _commentFocus,
                                          onSaved: (value) {
                                            createCheckpointController.comment =
                                                value!;
                                          },
                                          validator: (value) {
                                            return createCheckpointController
                                                .validateComment(value!);
                                          },
                                          onTapOutside: (event) {
                                            FocusScope.of(context).unfocus();
                                          },
                                          onFieldSubmitted: (value) {
                                            FocusScope.of(context).requestFocus(
                                                _generateQrCodeFocus);
                                          },
                                          onChanged: (value) {
                                            setState(() {
                                              if (createCheckpointController
                                                  .commentController
                                                  .text
                                                  .isEmpty) {
                                                createCheckpointController
                                                    .qrBtn.value = false;
                                              } else if (createCheckpointController
                                                  .commentController
                                                  .text
                                                  .isNotEmpty) {
                                                createCheckpointController
                                                    .qrBtn.value = true;
                                              }
                                            });
                                          },
                                        ),
                                      ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              commentQrImageGenerated
                                  ? Column(
                                      children: [
                                        Center(
                                          child: QrImageView(
                                            data: createCheckpointController
                                                .comment,
                                            size: 150.w,
                                            embeddedImageStyle:
                                                QrEmbeddedImageStyle(
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
                                  :
                                  // Obx(
                                  //     () =>
                                  Container(
                                      child: !createCheckpointController
                                              .qrBtn.value
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
                                                  commentQrImageGenerated =
                                                      !commentQrImageGenerated;
                                                });
                                                // // Get.toNamed("/generate_qr");
                                                // createShiftController.checkLogin();
                                              },
                                              backgoundColor:
                                                  AppColors.primaryColor,
                                              textColor: AppColors.white,
                                              titleText: "Generate QR code"),
                                    ),
                              // ),
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                child: SizedBox(
                  width: double.infinity,
                  child: SizedBox(
                    height: 46.h,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: commentQrImageGenerated
                                ? AppColors.primaryColor
                                : AppColors.disableColor,
                            foregroundColor: AppColors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.r))),
                        onPressed: () {
                          setState(() {
                            checkpointList
                                .add(checkpoint(checkpointList.length));
                          });
                        },
                        child: Text(
                          "+ Save & Create Another Checkpoint",
                          style: AppFontStyle.semiboldTextStyle(
                              AppColors.white, 16.sp),
                        )),
                  ),
                  // AppButton(
                  //     onTaps: () {
                  //       createCheckpointController.checkLogin();
                  //     },
                  //     backgoundColor:
                  //         // createCheckpointController.btnEnabled.value
                  //         //     ? AppColors.primaryColor
                  //         //     :
                  //         AppColors.disableColor,
                  //     textColor: AppColors.white,
                  //     titleText: "+ Save & Create Another Checkpoint"),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                child: SizedBox(
                  width: double.infinity,
                  height: 46.h,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          foregroundColor: AppColors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.r))),
                      onPressed: () {},
                      child: Text(
                        "Save & Next",
                        style: AppFontStyle.semiboldTextStyle(
                            AppColors.white, 16.sp),
                      )),
                ),
              ),
              // SizedBox(
              //   height: 46.h,
              //   child: AppButton(
              //       onTaps: () {
              //         // createCheckpointController.checkLogin();
              //         Get.toNamed("/create_route");
              //       },
              //       backgoundColor:
              //           // createCheckpointController.btnEnabled.value
              //           //     ?
              //           AppColors.primaryColor,
              //       //     :
              //       // AppColors.disableColor,
              //       textColor: AppColors.white,
              //       titleText: "Save & Next"),
              // ),
              SizedBox(
                height: 45.h,
              ),
            ])));
  }

  Widget tasks(index) {
    return Row(
      children: [
        Expanded(
          child: Form(
            // key: createCheckpointController.taskFormKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: AppTextField(
              controller: createCheckpointController.taskController,
              label: RichText(
                  text: TextSpan(
                text: 'Task ${index + 2}',
                style: AppFontStyle.lightTextStyle(AppColors.black, 14.sp),
              )),
              hintText: "Add task",
              keyboardType: TextInputType.text,
              focusNode: _taskFocus,
              onSaved: (value) {
                createCheckpointController.task = value!;
              },
              validator: (value) {
                return createCheckpointController.validateTask(value!);
              },
              onFieldSubmitted: (value) {
                FocusScope.of(context).unfocus();
              },
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.w, right: 8.w),
          child: SizedBox(
            width: 25.w,
            child: IconButton(
                style: IconButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                padding: EdgeInsets.zero,
                alignment: Alignment.centerRight,
                onPressed: () {
                  setState(() {
                    if (index > 0 && index <= taskList.length) {
                      taskList.removeWhere((task) => task == taskList[index]);
                    }

                    // .indexWhere((element) => element == taskList[index]);
                  });
                  // _showDialogDeleteShift(index);
                  // Navigator.pop(context);
                },
                icon: Icon(
                  Icons.delete_outline_rounded,
                  size: 20.h,
                  color: AppColors.redColor,
                )),
          ),
        ),
      ],
    ).paddingOnly(bottom: 16.h);
  }

  Widget checkpoint(index) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Container(
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
        child: Column(
          children: [
            Stack(
              children: [
                Row(
                  children: [
                    Stack(
                      alignment: FractionalOffset.center,
                      clipBehavior: Clip.none,
                      children: [
                        Image.asset(
                          "assets/QR_Sample.png",
                          height: 75.h,
                          width: 75.w,
                        ),
                        Container(
                          width: 35.w,
                          height: 23.h,
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.black.withOpacity(0.15),
                                    offset: Offset(0.w, 2.h),
                                    blurRadius: 6.r,
                                    spreadRadius: 0)
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.r))),
                          child: Center(
                            child: Text(
                              'CP ${index + 1}',
                              style: AppFontStyle.mediumTextStyle(
                                  AppColors.primaryColor, 12.sp),
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Checkpoint 1',
                          style: AppFontStyle.mediumTextStyle(
                              AppColors.primaryColor, 14.sp),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        RichText(
                            text: TextSpan(
                                text: 'Property:',
                                style: AppFontStyle.regularTextStyle(
                                    AppColors.black, 12.sp),
                                children: [
                              TextSpan(
                                text: ' Biverly Hills',
                                style: AppFontStyle.regularTextStyle(
                                    AppColors.primaryColor, 12.sp),
                              )
                            ])),
                        SizedBox(
                          height: 6.h,
                        ),
                        RichText(
                            text: TextSpan(
                                text: 'Checkpoint Tasks:',
                                style: AppFontStyle.regularTextStyle(
                                    AppColors.black, 12.sp),
                                children: [
                              TextSpan(
                                text: ' 07',
                                style: AppFontStyle.regularTextStyle(
                                    AppColors.primaryColor, 12.sp),
                              )
                            ])),
                      ],
                    )
                  ],
                ),
                Positioned(
                  top: 10.h,
                  right: 10.w,
                  child: SizedBox(
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
                        Icons.more_vert,
                        size: 16.h,
                      ),
                      color: AppColors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

 
}

class AddCheckpointImage extends StatelessWidget {
  const AddCheckpointImage({
    super.key,
    required this.imgController,
  });

  final CheckpointImagePickerController imgController;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Obx(() => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'CheckPoint Image',
                        style: AppFontStyle.semiboldTextStyle(
                            AppColors.textColor, 16.sp),
                      ),
                      Text(
                        ' (Optional) ',
                        style: AppFontStyle.lightTextStyle(
                            AppColors.grayColor, 10.sp),
                      ),
                    ],
                  ),
                  SizedBox(
                    child: imgController.selectedImagePath.value != ""
                        ? GestureDetector(
                            onTap: () {
                              showImagePicker(context);
                            },
                            child: Icon(
                              Icons.file_upload_outlined,
                              color: AppColors.primaryColor,
                            ),
                          )
                        : null,
                  ),
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
              Center(
                child: Container(
                  width: Get.width - 32.w,
                  height: 113.h,
                  child: imgController.selectedImagePath.value == ""
                      ? GestureDetector(
                          onTap: () {
                            showImagePicker(context);
                          },
                          child: DottedBorder(
                            radius: Radius.circular(10.r),
                            color: AppColors.secondaryColor,
                            strokeWidth: 1.w,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.file_upload_outlined,
                                    color: AppColors.primaryColor,
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Text(
                                    'Browse Image',
                                    style: AppFontStyle.regularTextStyle(
                                        AppColors.primaryColor, 12.sp),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : Image.file(
                          File(imgController.selectedImagePath.value),
                          fit: BoxFit.fill,
                          width: 343.w,
                          height: 178.h,
                        ),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                'Maximum 10 images of property can be uploaded, maximum size of image should be 2 MB and in JPG or PNG format.',
                maxLines: 2,
                style: AppFontStyle.lightTextStyle(
                    AppColors.secondaryColor, 12.sp),
              ),
            ],
          )),
    ]);
  }

  void showImagePicker(BuildContext context) {
    showModalBottomSheet<int>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return AppBottomSheet(
          child: Container(
            color: AppColors.white,
            child: Column(children: [
              SizedBox(
                height: 20.h,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  imgController.getImage(ImageSource.camera);
                },
                child: Center(
                  child: Container(
                    padding: EdgeInsets.only(top: 15.h, bottom: 16.h),
                    height: 48.h,
                    width: Get.width - 80,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppColors.grayColor,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Take Photo',
                          style: AppFontStyle.regularTextStyle(
                              AppColors.textColor, 14.sp),
                        ),
                        Icon(
                          Entypo.camera,
                          color: AppColors.primaryColor,
                          size: 22,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  imgController.getImage(ImageSource.gallery);
                },
                child: Center(
                  child: Container(
                    padding: EdgeInsets.only(top: 15.h, bottom: 16.h),
                    height: 48.h,
                    width: Get.width - 80,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppColors.grayColor,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Choose Photo',
                          style: AppFontStyle.regularTextStyle(
                              AppColors.textColor, 14.sp),
                        ),
                        Icon(
                          FontAwesome5.images,
                          color: AppColors.primaryColor,
                          size: 22,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (imgController.selectedImagePath.value != "")
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    Get.dialog(
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 32),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5.r),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Material(
                                  child: Column(
                                    children: [
                                      Text(
                                        "Are you sure you want to delete this profile picture ?",
                                        textAlign: TextAlign.center,
                                        style: AppFontStyle.mediumTextStyle(
                                            AppColors.textColor, 14.sp),
                                      ),
                                      SizedBox(height: 20.h),
                                      //Buttons
                                      Row(
                                        children: [
                                          Expanded(
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  minimumSize: Size(0, 35.h),
                                                  backgroundColor:
                                                      AppColors.white,
                                                  foregroundColor:
                                                      AppColors.primaryColor,
                                                  textStyle: AppFontStyle
                                                      .semiboldTextStyle(
                                                          AppColors
                                                              .primaryColor,
                                                          16.sp),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6.r),
                                                    side: BorderSide(
                                                      color: AppColors
                                                          .primaryColor,
                                                      width: 1.0,
                                                    ),
                                                  )),
                                              onPressed: () {
                                                imgController.selectedImagePath
                                                    .value = "";
                                                Get.back();
                                              },
                                              child: Text(
                                                'Delete',
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 10.w),
                                          Expanded(
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                minimumSize: Size(0, 35.h),
                                                backgroundColor:
                                                    AppColors.primaryColor,
                                                textStyle: AppFontStyle
                                                    .semiboldTextStyle(
                                                        AppColors.white, 16.sp),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6.r),
                                                ),
                                              ),
                                              onPressed: () {
                                                Get.back();
                                              },
                                              child: const Text(
                                                'Cancel',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.only(top: 15.h, bottom: 16.h),
                      height: 48.h,
                      width: Get.width - 80,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: AppColors.grayColor,
                            width: 1,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Delete Photo',
                            style: AppFontStyle.regularTextStyle(
                                AppColors.textColor, 14.sp),
                          ),
                          Icon(
                            Icons.delete_outline,
                            color: AppColors.primaryColor,
                            size: 26,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              Center(
                child: Container(
                  padding: EdgeInsets.only(top: 15.h, bottom: 16.h),
                  height: 48.h,
                  width: Get.width - 80,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: AppColors.grayColor,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        );
      },
    );
  }
}
