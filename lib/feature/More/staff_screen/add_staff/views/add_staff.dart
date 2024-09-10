// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sgt_owner/feature/More/staff_screen/add_staff/controller/add_staff_controller.dart';
import 'package:sgt_owner/feature/More/staff_screen/add_staff/controller/add_staff_image_picker_controller.dart';
import 'package:sgt_owner/shared/widgets/custom_appbar.dart';
import 'package:sgt_owner/shared/widgets/custom_bottomsheet.dart';
import 'package:sgt_owner/shared/widgets/custom_buttons.dart';
import 'package:sgt_owner/shared/widgets/custom_textfield.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../authentication/new_password/controller/newpassword_controller.dart';

class AddStaffPage extends StatefulWidget {
  const AddStaffPage({super.key});

  @override
  State<AddStaffPage> createState() => _AddStaffPageState();
}

class _AddStaffPageState extends State<AddStaffPage> {
  final addStaffController = Get.put(AddStaffController());
  NewConfirmController pCTRL = Get.put(NewConfirmController());

  AddStaffImagePickerController addStaffImgController =
      Get.put(AddStaffImagePickerController());

  final _fNameFocus = FocusNode();
  final _lNameFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _phoneFocus = FocusNode();
  final _passFocus1 = FocusNode();
  final _passFocus2 = FocusNode();

  List gender = ["Male", "Female"];
  List assignRole = ["Guard", "Manager", "Supervisor"];

  @override
  void dispose() {
    super.dispose();
    _fNameFocus.dispose();
    _lNameFocus.dispose();
    _emailFocus.dispose();
    _phoneFocus.dispose();
    _passFocus1.dispose();
    _passFocus2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        titleText: 'Add Staff',
        isLeading: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 16.h,
                ),
                Center(
                  child: Container(
                    width: Get.width - 32.w,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.all(Radius.circular(6.r)),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.disableColor.withAlpha(50),
                            blurRadius: 1.0,
                          )
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 12.h,
                        ),
                        AddProfileImage(imgController: addStaffImgController),
                        SizedBox(
                          height: 12.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8, vertical: 12.h),
                          child: Form(
                            key: addStaffController.fNameFormKey,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: SignUpTextField(
                              controller: addStaffController.fNameController,
                              label: RichText(
                                  text: TextSpan(
                                      text: 'First Name',
                                      style: AppFontStyle.lightTextStyle(
                                          AppColors.black, 14.sp),
                                      children: [
                                    TextSpan(
                                        text: ' *',
                                        style: TextStyle(
                                          color: Colors.red,
                                        ))
                                  ])),
                              maxWords: 24,
                              hintText: "Enter First Name",
                              keyboardType: TextInputType.text,
                              focusNode: _fNameFocus,
                              onSaved: (value) {
                                addStaffController.fName = value!;
                              },
                              validator: (value) {
                                return addStaffController.validateFName(value!);
                              },
                              onTapOutside: (event) {
                                FocusScope.of(context).unfocus();
                              },
                              onFieldSubmitted: (value) {
                                FocusScope.of(context)
                                    .requestFocus(_lNameFocus);
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8, vertical: 2.h),
                          child: Form(
                            key: addStaffController.lNameFormKey,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: SignUpTextField(
                              controller: addStaffController.lNameController,
                              label: RichText(
                                  text: TextSpan(
                                      text: 'Last Name',
                                      style: AppFontStyle.lightTextStyle(
                                          AppColors.black, 14.sp),
                                      children: [
                                    TextSpan(
                                        text: ' *',
                                        style: TextStyle(
                                          color: Colors.red,
                                        ))
                                  ])),
                              maxWords: 24,
                              hintText: "Enter Last Name",
                              keyboardType: TextInputType.text,
                              focusNode: _lNameFocus,
                              onSaved: (value) {
                                addStaffController.lName = value!;
                              },
                              validator: (value) {
                                return addStaffController.validateLName(value!);
                              },
                              onTapOutside: (event) {
                                FocusScope.of(context).unfocus();
                              },
                              onFieldSubmitted: (value) {
                                FocusScope.of(context)
                                    .requestFocus(_emailFocus);
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 12.h),
                          child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Select a Gender',
                                hintStyle: AppFontStyle.regularTextStyle(
                                    AppColors.hintColor, 12.sp),
                                errorStyle: AppFontStyle.regularTextStyle(
                                  AppColors.redColor,
                                  10.sp,
                                ),
                                label: RichText(
                                  text: TextSpan(
                                      text: 'Gender',
                                      style: AppFontStyle.lightTextStyle(
                                          AppColors.black, 14.sp),
                                      children: [
                                    TextSpan(
                                        text: ' *',
                                        style: TextStyle(
                                          color: Colors.red,
                                        ))
                                  ])),
                                labelStyle: AppFontStyle.regularTextStyle(
                                    AppColors.black, 12.sp),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 19.w, vertical: 5.h),
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
                              items: gender.map((e) {
                                return DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                );
                              }).toList(),
                              onChanged: (v) {}),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 12.h),
                          child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Select a Role',
                                hintStyle: AppFontStyle.regularTextStyle(
                                    AppColors.hintColor, 12.sp),
                                errorStyle: AppFontStyle.regularTextStyle(
                                  AppColors.redColor,
                                  10.sp,
                                ),
                                label: RichText(
                                  text: TextSpan(
                                      text: 'Assign Role',
                                      style: AppFontStyle.lightTextStyle(
                                          AppColors.black, 14.sp),
                                      children: [
                                    TextSpan(
                                        text: ' *',
                                        style: TextStyle(
                                          color: Colors.red,
                                        ))
                                  ])),
                                labelStyle: AppFontStyle.regularTextStyle(
                                    AppColors.black, 12.sp),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 19.w, vertical: 5.h),
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
                              items: assignRole.map((e) {
                                return DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                );
                              }).toList(),
                              onChanged: (v) {}),
                        ),
                       
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8, vertical: 12.h),
                          child: Form(
                            key: addStaffController.emailFormKey,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: AppTextField(
                              controller: addStaffController.emailController,
                              label: RichText(
                                  text: TextSpan(
                                      text: 'Email',
                                      style: AppFontStyle.lightTextStyle(
                                          AppColors.black, 14.sp),
                                      children: [
                                    TextSpan(
                                        text: ' *',
                                        style: TextStyle(
                                          color: Colors.red,
                                        ))
                                  ])),
                              hintText: "Enter Email",
                              keyboardType: TextInputType.emailAddress,
                              focusNode: _emailFocus,
                              onSaved: (value) {
                                addStaffController.email = value!;
                              },
                              validator: (value) {
                                return addStaffController.validateEmail(value!);
                              },
                              onTapOutside: (event) {
                                FocusScope.of(context).unfocus();
                              },
                              onFieldSubmitted: (value) {
                                FocusScope.of(context)
                                    .requestFocus(_phoneFocus);
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8, vertical: 12.h),
                          child: Form(
                            key: addStaffController.phoneFormKey,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: AppTextField(
                              controller: addStaffController.phoneController,
                              label: RichText(
                                  text: TextSpan(
                                      text: 'Mobile Number',
                                      style: AppFontStyle.lightTextStyle(
                                          AppColors.black, 14.sp),
                                      children: [
                                    TextSpan(
                                        text: ' *',
                                        style: TextStyle(
                                          color: Colors.red,
                                        ))
                                  ])),
                              hintText: "Enter Mobile Number",
                              keyboardType: TextInputType.phone,
                              focusNode: _phoneFocus,
                              onSaved: (value) {
                                addStaffController.phone = value!;
                              },
                              validator: (value) {
                                return addStaffController
                                    .validateNumber(value!);
                              },
                              onTapOutside: (event) {
                                FocusScope.of(context).unfocus();
                              },
                              onFieldSubmitted: (value) {
                                FocusScope.of(context)
                                    .requestFocus(_passFocus1);
                              },
                            ),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 12.h),
                            child: Obx(
                              () => Form(
                                key: addStaffController.passFormKey1,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                child: AppTextField(
                                  controller:
                                      addStaffController.passwordController1,
                                  label: RichText(
                                      text: TextSpan(
                                          text: 'Password',
                                          style: AppFontStyle.lightTextStyle(
                                              AppColors.black, 14.sp),
                                          children: [
                                        TextSpan(
                                            text: ' *',
                                            style: TextStyle(
                                              color: Colors.red,
                                            ))
                                      ])),
                                  hintText: "Create Password",
                                  obsecure: pCTRL.isHidden1.value,
                                  suffix: IconButton(
                                    icon: Icon(pCTRL.isHidden1.value
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                    color: AppColors.grayColor,
                                    iconSize: 24,
                                    onPressed: () {
                                      pCTRL.isHidden1.value =
                                          !pCTRL.isHidden1.value;
                                    },
                                  ),
                                  keyboardType: TextInputType.visiblePassword,
                                  focusNode: _passFocus1,
                                  onSaved: (value) {
                                    addStaffController.password1 = value!;
                                  },
                                  validator: (value) {
                                    return addStaffController
                                        .validatePassword(value!);
                                  },
                                  onFieldSubmitted: (value) {
                                    FocusScope.of(context)
                                        .requestFocus(_passFocus2);
                                  },
                                  onTapOutside: (event) {
                                    FocusScope.of(context).unfocus();
                                  },
                                ),
                              ),
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 8, right: 8, bottom: 16.h),
                            child: Obx(
                              () => Form(
                                key: addStaffController.passFormKey2,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                child: AppTextField(
                                  controller:
                                      addStaffController.passwordController2,
                                  label: RichText(
                                      text: TextSpan(
                                          text: 'Confirm Password',
                                          style: AppFontStyle.lightTextStyle(
                                              AppColors.black, 14.sp),
                                          children: [
                                        TextSpan(
                                            text: ' *',
                                            style: TextStyle(
                                              color: Colors.red,
                                            ))
                                      ])),
                                  hintText: "Confirm Password",
                                  obsecure: pCTRL.isHidden2.value,
                                  suffix: IconButton(
                                    icon: Icon(pCTRL.isHidden2.value
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                    color: AppColors.grayColor,
                                    iconSize: 24,
                                    onPressed: () {
                                      pCTRL.isHidden2.value =
                                          !pCTRL.isHidden2.value;
                                    },
                                  ),
                                  keyboardType: TextInputType.visiblePassword,
                                  focusNode: _passFocus2,
                                  onSaved: (value) {
                                    addStaffController.password2 = value!;
                                  },
                                  validator: (value) {
                                    return addStaffController
                                        .validatePassword(value!);
                                  },
                                ),
                              ),
                            )),
                        Padding(
                          padding: EdgeInsets.only(left: 18, bottom: 16.h),
                          child: Text(
                            'Minimum 8 character, must be one uppercase letter, number & symbol.',
                            maxLines: 2,
                            style: AppFontStyle.regularTextStyle(
                                AppColors.secondaryColor, 12.sp),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            Column(
              children: [
                Obx(() => AppButton(
                    onTaps: () {
                      addStaffController.checkLogin();
                    },
                    backgoundColor: addStaffController.btnEnabled.value &&
                            (addStaffController.passwordController1.text ==
                                addStaffController.passwordController2.text)
                        ? AppColors.primaryColor
                        : AppColors.disableColor,
                    textColor: AppColors.white,
                    titleText: "Submit")),
                SizedBox(
                  height: 16.h,
                ),
                SizedBox(
                  height: 38.h,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class AddProfileImage extends StatelessWidget {
  const AddProfileImage({
    super.key,
    required this.imgController,
  });

  final AddStaffImagePickerController imgController;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Obx(() => CircleAvatar(
            backgroundColor: AppColors.lightPrimaryColor,
            radius: 36.r,
            child: CircleAvatar(
              radius: 35.r,
              backgroundColor: AppColors.white,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(35.r),
                child: imgController.selectedImagePath.value == ""
                    ? 
                    SvgPicture.asset(
                        "assets/user.svg",
                        width: 70.w,
                        height: 70.h,
                      )
                    
                    // Image.asset(
                    //     "assets/temp_profile.png",
                    //     fit: BoxFit.fill,
                    //     width: 70.w,
                    //     height: 70.h,
                    //   )
                    : Image.file(
                        File(imgController.selectedImagePath.value),
                        fit: BoxFit.fill,
                        width: 70.w,
                        height: 70.h,
                      ),
              ),
            ),
          )),
      Positioned(
          bottom: 0,
          right: 0,
          child: InkWell(
            onTap: () {
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 32),
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
                                                  style: AppFontStyle
                                                      .mediumTextStyle(
                                                          AppColors.textColor,
                                                          14.sp),
                                                ),
                                                SizedBox(height: 20.h),
                                                //Buttons
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                minimumSize:
                                                                    Size(0,
                                                                        35.h),
                                                                backgroundColor:
                                                                    AppColors
                                                                        .white,
                                                                foregroundColor:
                                                                    AppColors
                                                                        .primaryColor,
                                                                textStyle: AppFontStyle
                                                                    .semiboldTextStyle(
                                                                        AppColors
                                                                            .primaryColor,
                                                                        16.sp),
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              6.r),
                                                                  side:
                                                                      BorderSide(
                                                                    color: AppColors
                                                                        .primaryColor,
                                                                    width: 1.0,
                                                                  ),
                                                                )),
                                                        onPressed: () {
                                                          imgController
                                                              .selectedImagePath
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
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          minimumSize:
                                                              Size(0, 35.h),
                                                          backgroundColor:
                                                              AppColors
                                                                  .primaryColor,
                                                          textStyle: AppFontStyle
                                                              .semiboldTextStyle(
                                                                  AppColors
                                                                      .white,
                                                                  16.sp),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6.r),
                                                          ),
                                                        ),
                                                        onPressed: () {
                                                          Get.back();
                                                        },
                                                        child: Text(
                                                          'Cancel',
                                                          style: AppFontStyle
                                                              .semiboldTextStyle(
                                                                  AppColors
                                                                      .white,
                                                                  16.sp),
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
                                padding:
                                    EdgeInsets.only(top: 15.h, bottom: 16.h),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
            },
            child: Container(
              height: 24.h,
              width: 24.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(
                  color: Color(0xFFCBCBCB),
                  width: 1.0,
                ),
              ),
              alignment: Alignment.center,
              child: Icon(
                Typicons.camera_outline,
                color: AppColors.primaryColor,
                size: 14,
              ),
            ),
          )),
    ]);
  }
}
