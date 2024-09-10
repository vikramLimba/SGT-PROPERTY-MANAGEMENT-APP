import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgt_owner/feature/Guards/all_guard/edit_guard_profile/controller/edit_guard_profile_controller.dart';
import 'package:sgt_owner/feature/Guards/all_guard/missed_shifts/view/missed_shifts.dart';
import 'package:sgt_owner/feature/Guards/all_guard/shared/view/edit_profile_popup.dart';
import 'package:sgt_owner/feature/Guards/new_guard/shared/controller/location_picker_controller.dart';
import 'package:sgt_owner/shared/country_state_city_model.dart';
import 'package:sgt_owner/style/colors.dart';

class EditGuardProfile extends StatefulWidget {
  const EditGuardProfile({super.key});

  @override
  State<EditGuardProfile> createState() => _EditGuardProfileState();
}

class _EditGuardProfileState extends State<EditGuardProfile> {
  final editGuardProfileController = Get.put(EditGuardProfileController());

  final List<String> _gender = ["Male", "Female"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            },
          ),
          toolbarHeight: 63.h,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0.h),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Guard Profile",
                style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
              ),
              RichText(
                  text: TextSpan(
                      text: "Creation Date:",
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                          overflow: TextOverflow.ellipsis),
                      children: [
                    TextSpan(
                        text: " 23/05/2023",
                        style: TextStyle(
                            color: AppColors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w300,
                            overflow: TextOverflow.ellipsis))
                  ])),
              SizedBox(
                height: 8.h,
              ),
              Card(
                elevation: 2.h,
                margin: EdgeInsets.zero,
                surfaceTintColor: AppColors.white,
                shadowColor: AppColors.grayColor,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.h,
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/guard_1.png",
                              width: 110.w,
                              height: 110.h,
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Text(
                              "Robinson",
                              style: TextStyle(
                                  fontSize: 17.sp, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Text(
                              "Available status",
                              style: TextStyle(
                                  color: AppColors.greenColor,
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Text(
                              "Last Shift - 10:00AM - 08:00PM , 23/07/2023 ",
                              style: TextStyle(
                                  color: AppColors.grayColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      Positioned(right: 0.w, child: EditProfilePopUP())
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.435,
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed("/AssignedProperties");
                      },
                      child: Card(
                        elevation: 2.h,
                        margin: EdgeInsets.zero,
                        surfaceTintColor: AppColors.white,
                        shadowColor: AppColors.grayColor,
                        child: Padding(
                          padding: EdgeInsets.all(15.0.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "05",
                                style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "Assigned Properties",
                                style: TextStyle(
                                    color: AppColors.grayColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.435,
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed('/CompletedShifts');
                      },
                      child: Card(
                        elevation: 2.h,
                        margin: EdgeInsets.zero,
                        surfaceTintColor: AppColors.white,
                        shadowColor: AppColors.grayColor,
                        child: Padding(
                          padding: EdgeInsets.all(15.0.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "04",
                                style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "Completed Shifts",
                                style: TextStyle(
                                    color: AppColors.grayColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.435,
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed('/TotalLeaves');
                      },
                      child: Card(
                        elevation: 2.h,
                        margin: EdgeInsets.zero,
                        surfaceTintColor: AppColors.white,
                        shadowColor: AppColors.grayColor,
                        child: Padding(
                          padding: EdgeInsets.all(15.0.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "06",
                                style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "Total Leaves",
                                style: TextStyle(
                                    color: AppColors.grayColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.435,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => MissedShifts());
                      },
                      child: Card(
                        elevation: 2.h,
                        margin: EdgeInsets.zero,
                        surfaceTintColor: AppColors.white,
                        shadowColor: AppColors.grayColor,
                        child: Padding(
                          padding: EdgeInsets.all(15.0.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "08",
                                style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "Missed Shifts",
                                style: TextStyle(
                                    color: AppColors.grayColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                "Profile Details",
                style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 8.h,
              ),
              buildName(),
              SizedBox(
                height: 16.h,
              ),
              buildPosition(),
              SizedBox(
                height: 16.h,
              ),
              buildGender(),
              SizedBox(
                height: 16.h,
              ),
              const DateOfBirth(),
              SizedBox(
                height: 16.h,
              ),
              buildEmail(),
              SizedBox(
                height: 16.h,
              ),
              buildMobileNumber(),
              SizedBox(
                height: 16.h,
              ),
              Text(
                "Address",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 16.h,
              ),
              buildStreetAddress(),
              SizedBox(
                height: 16.h,
              ),
              LocationPicker(locationController: LocationPickerController()),
              SizedBox(
                height: 16.h,
              ),
              buildPostalCode(),
              SizedBox(
                height: 24.h,
              ),
              SizedBox(
                  height: 47.h,
                  width: MediaQuery.of(context).size.width,
                  child: Obx(
                    () => ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.r)),
                            backgroundColor:
                                !editGuardProfileController.btnEnable.value
                                    ? AppColors.disableColor
                                    : AppColors.primaryColor,
                            foregroundColor: AppColors.white),
                        onPressed: editGuardProfileController.btnEnable.value
                            ? () {
                                // print("======> click");
                                editGuardProfileController.checkValid();
                              }
                            : null
                        //  () {}
                        ,
                        child: Text(
                          "Save Profile",
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w600),
                        )),
                  )),
            ],
          ),
        ),
    );
  }

  Widget buildName() {
    return Form(
      key: editGuardProfileController.nameFormKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: TextFormField(
        style: TextStyle(
            color: AppColors.textColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500),
        controller: editGuardProfileController.nameController,
        decoration: InputDecoration(
            hintText: "Enter First Name",
            hintStyle: TextStyle(
                color: AppColors.textColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.disableColor)),
            focusedBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors.disableColor, width: 1)),
            label: RichText(
                text: TextSpan(
                    text: "First Name",
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w300,
                        color: Colors.black87),
                    children: const [
                  TextSpan(text: "*", style: TextStyle(color: Colors.red))
                ])),
            border: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 153, 131, 126)),
                borderRadius: BorderRadius.circular(5.r))),
        onChanged: (value) {
          editGuardProfileController.name = value;
        },
        validator: (value) {
          return editGuardProfileController.validateName(value!);
        },
        // focusNode: _fNameFocus,
        // onTapOutside: (event) {
        //   FocusScope.of(context).unfocus();
        // },
        onFieldSubmitted: (value) {
          // FocusScope.of(context).requestFocus(_lNameFocus);
        },
      ),
    );
  }

  Widget buildPosition() {
    return Form(
      key: editGuardProfileController.guardPositionFormKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: TextFormField(
        style: TextStyle(
            color: AppColors.textColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500),
        controller: editGuardProfileController.guardPositionController,
        decoration: InputDecoration(
            hintText: "Enter Position",
            hintStyle: TextStyle(
                color: AppColors.grayColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.disableColor)),
            focusedBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors.disableColor, width: 1)),
            label: RichText(
                text: TextSpan(
                    text: "Position",
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w300,
                        color: Colors.black87),
                    children: const [
                  TextSpan(text: "*", style: TextStyle(color: Colors.red))
                ])),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.grayColor),
                borderRadius: BorderRadius.circular(5.r))),
        onChanged: (value) {
          editGuardProfileController.guardPosition = value;
        },
        validator: (value) {
          return editGuardProfileController.validateGuardPosition(value!);
        },
        // focusNode: _fNameFocus,
        // onTapOutside: (event) {
        //   FocusScope.of(context).unfocus();
        // },
        onFieldSubmitted: (value) {
          // FocusScope.of(context).requestFocus(_lNameFocus);
        },
      ),
    );
  }

  Widget buildGender() {
    return Form(
        key: editGuardProfileController.genderFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: DropdownButtonFormField(
          style: TextStyle(
              color: AppColors.textColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500),
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
          isExpanded: true,
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 13.h, horizontal: 10.w),
              hintText: "Choose Gender",
              hintStyle: TextStyle(
                  color: AppColors.grayColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400),
              label: RichText(
                  text: TextSpan(
                      text: "Gender",
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w300,
                          color: Colors.black87),
                      children: const [
                    TextSpan(text: "*", style: TextStyle(color: Colors.red))
                  ])),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.disableColor)),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.grayColor)),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.grayColor),
                  borderRadius: BorderRadius.circular(5.r))),
          items: _gender.map((e) {
            return DropdownMenuItem(
                value: e,
                child: Text(
                  e,
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                ));
          }).toList(),
          onChanged: (value) {
            editGuardProfileController.gender = value!.toString();
          },
          validator: (value) {
            return editGuardProfileController.validateGender(value!.toString());
          },
        ));
  }

  Widget buildEmail() {
    return Form(
      key: editGuardProfileController.emailFormKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: TextFormField(
        style: TextStyle(
            color: AppColors.textColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500),
        controller: editGuardProfileController.emailController,
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 13.h, horizontal: 10.w),
            hintText: "Enter Email",
            hintStyle: TextStyle(
                color: AppColors.grayColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromRGBO(216, 216, 220, 1), width: 1)),
            label: RichText(
                text: TextSpan(
                    text: "Email",
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w300,
                        color: Colors.black87),
                    children: const [
                  TextSpan(text: "*", style: TextStyle(color: Colors.red))
                ])),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.disableColor)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.grayColor),
                borderRadius: BorderRadius.circular(5.r))),
        onChanged: (value) {
          editGuardProfileController.email = value;
        },
        validator: (value) {
          return editGuardProfileController.validEmail(value!);
        },
        // focusNode: _emailFocus,
        // onTapOutside: (event) {
        //   FocusScope.of(context).unfocus();
        // },
      ),
    );
  }

  Widget buildMobileNumber() {
    return Form(
      key: editGuardProfileController.mobileNumberFormKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: TextFormField(
        style: TextStyle(
            color: AppColors.textColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500),
        controller: editGuardProfileController.mobileNumberController,
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 13.h, horizontal: 10.w),
            hintText: "Enter Mobile Number",
            hintStyle: TextStyle(
                color: AppColors.grayColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromRGBO(216, 216, 220, 1), width: 1)),
            label: RichText(
                text: TextSpan(
                    text: "Mobile Number",
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w300,
                        color: Colors.black87),
                    children: const [
                  TextSpan(text: "*", style: TextStyle(color: Colors.red))
                ])),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.disableColor)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.grayColor),
                borderRadius: BorderRadius.circular(5.r))),
        onChanged: (value) {
          editGuardProfileController.mobileNumber = value;
        },
        validator: (value) {
          return editGuardProfileController.validateMobileNumber(value!);
        },
        // focusNode: _mobileNumberFocus,
        // onTapOutside: (event) {
        //   FocusScope.of(context).unfocus();
        // },
        // onFieldSubmitted: (value) {
        //   FocusScope.of(context).requestFocus(_emailFocus);
        // },
      ),
    );
  }

  Widget buildStreetAddress() {
    return Form(
      key: editGuardProfileController.streetAddressFormKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: TextFormField(
        style: TextStyle(
            color: AppColors.textColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500),
        maxLines: 3,
        controller: editGuardProfileController.streesAddressController,
        decoration: InputDecoration(
            // contentPadding:
            //     EdgeInsets.symmetric(vertical: 13.h, horizontal: 10.w),
            hintText: "Enter your Street Address...",
            hintStyle: TextStyle(
                color: AppColors.grayColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromRGBO(216, 216, 220, 1), width: 1)),
            label: RichText(
                text: TextSpan(
                    text: "Street Address",
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w300,
                        color: Colors.black87),
                    children: const [
                  TextSpan(text: "*", style: TextStyle(color: Colors.red))
                ])),
            // Text(
            //   "",
            //   style: TextStyle(
            //       fontSize: 15.sp,
            //       fontWeight: FontWeight.w300,
            //       color: Colors.black87),
            // ),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.disableColor)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.grayColor),
                borderRadius: BorderRadius.circular(5.r))),
        onChanged: (value) {
          editGuardProfileController.streetAddress = value;
        },
        validator: (value) {
          return editGuardProfileController.validataStreetAdrees(value!);
        },
        // focusNode: _fNameFocus,
        // onTapOutside: (event) {
        //   FocusScope.of(context).unfocus();
        // },
        // onFieldSubmitted: (value) {
        //   // FocusScope.of(context).requestFocus(_lNameFocus);
        // },
      ),
    );
  }

  Widget buildPostalCode() {
    return Form(
      key: editGuardProfileController.postalCodeFormKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: TextFormField(
        style: TextStyle(
            color: AppColors.textColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500),
        controller: editGuardProfileController.postalCodeController,
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 13.h, horizontal: 10.w),
            hintText: "Enter Postal Code",
            hintStyle: TextStyle(
                color: AppColors.grayColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromRGBO(216, 216, 220, 1), width: 1)),
            label: RichText(
                text: TextSpan(
                    text: "Postal Code",
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w300,
                        color: Colors.black87),
                    children: const [
                  TextSpan(text: "*", style: TextStyle(color: Colors.red))
                ])),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.disableColor)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.grayColor),
                borderRadius: BorderRadius.circular(5.r))),
        onChanged: (value) {
          editGuardProfileController.postalCode = value;
        },
        validator: (value) {
          return editGuardProfileController.validatePostalCode(value!);
        },
        // focusNode: _fNameFocus,
        // onTapOutside: (event) {
        //   // FocusScope.of(context).unfocus();
        // },
        // onFieldSubmitted: (value) {
        //   // FocusScope.of(context).requestFocus(_lNameFocus);
        // },
      ),
    );
  }
}

class DateOfBirth extends StatefulWidget {
  const DateOfBirth({super.key});

  @override
  State<DateOfBirth> createState() => _DateOfBirthState();
}

class _DateOfBirthState extends State<DateOfBirth> {
  DateTime? selectedDate;
  final EditGuardProfileController editGuardProfileController = Get.find();

  Future openDialog() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            backgroundColor: AppColors.white,
            content: SizedBox(
              height: 280.h,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: CalendarCarousel(
                  onDayPressed: (DateTime date, List events) {
                    setState(() {
                      selectedDate = date;
                    });
                    Navigator.of(context).pop();
                  },
                  selectedDayBorderColor: Colors.transparent,
                  selectedDayTextStyle: const TextStyle(
                      color: AppColors.white, fontWeight: FontWeight.w500),
                  selectedDayButtonColor: AppColors.black,
                  selectedDateTime: selectedDate,
                  weekdayTextStyle: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black),
                  nextDaysTextStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.disableColor),
                  inactiveWeekendTextStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.disableColor),
                  inactiveDaysTextStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.disableColor),
                  daysTextStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black),
                  firstDayOfWeek: 1,
                  iconColor: AppColors.black,
                  weekendTextStyle: TextStyle(
                    color: AppColors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  height: 380.h,
                  headerTextStyle: const TextStyle(
                      color: AppColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                  daysHaveCircularBorder: false,
                  todayTextStyle: selectedDate == null
                      ? const TextStyle(color: AppColors.white)
                      : TextStyle(
                          color: AppColors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                  todayButtonColor: selectedDate == null
                      ? AppColors.black
                      : Colors.transparent,
                  todayBorderColor: selectedDate == null
                      ? AppColors.black
                      : Colors.transparent,
                  minSelectedDate:
                      DateTime.now().subtract(const Duration(days: 1)),
                ),
              ),
            ),
          ));

  @override
  Widget build(BuildContext context) {
    String today = DateTime.now().toLocal().toString().split(" ")[0];
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: editGuardProfileController.dobFormKey,
      child: TextFormField(
        readOnly: true,
        style: TextStyle(
            color: AppColors.textColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500),
        keyboardType: TextInputType.none,
        controller: TextEditingController(
            text: selectedDate == null
                ? today
                : selectedDate?.toLocal().toString().split(" ")[0]),
        onTap: () {
          openDialog();
        },
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 13.h, horizontal: 10.w),
            suffixIcon: const Icon(Icons.calendar_today),
            hintText: "Choose Date of Birth",
            hintStyle: TextStyle(
                color: AppColors.grayColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: const Color.fromRGBO(216, 216, 220, 1), width: 1.w)),
            label: RichText(
                text: TextSpan(
                    text: "Date of Birth",
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w300,
                        color: Colors.black87),
                    children: const [
                  TextSpan(text: "*", style: TextStyle(color: Colors.red))
                ])),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.disableColor)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.grayColor),
                borderRadius: BorderRadius.circular(5.r))),
        onChanged: (value) {
          editGuardProfileController.dateOfBirth = value;
          value = selectedDate.toString();
        },
        validator: (value) {
          return editGuardProfileController.validateDOB(value!);
        },
      ),
    );
  }
}

class LocationPicker extends StatefulWidget {
  final LocationPickerController locationController;

  const LocationPicker({super.key, required this.locationController});

  @override
  State<LocationPicker> createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  LocationPickerController locationController =
      Get.put(LocationPickerController());

  String? selectedCountry;
  String? selectedState;
  String? selectedCity;

  List<States> selectedCountryStates = [];
  List<Cities> selectedStatesCities = [];

  @override
  void initState() {
    getCountries();

    super.initState();
  }

  Future getCountries() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("lib/shared/country_state_city.json");
    List mapData = jsonDecode(data);

    List<Country> countryList =
        mapData.map((e) => Country.fromJson(e)).toList();

    return countryList;
  }

  List<Country>? snapshotData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildCountry(),
        SizedBox(
          height: 16.h,
        ),
        buildState(),
        SizedBox(height: 16.h),
        buildCity(),
      ],
    );
  }

  Widget buildCountry() {
    return FutureBuilder(
        future: getCountries(),
        builder: (context,AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // print('print----------------1');
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            // print('print----------------2');
            return Text("Error: ${snapshot.error}");
          } else if (!snapshot.hasData) {
            // print('print----------------3');
            return const Text("No data available");
          } else if (snapshot.hasData) {
            // print('print----------------4');

            snapshotData = snapshot.data;

            return Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: locationController.countryFormKey,
              child: DropdownButtonFormField(
                style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500),
                icon: const Icon(Icons.keyboard_arrow_down_rounded),
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.disableColor)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(216, 216, 220, 1), width: 1)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.r)),
                  label: RichText(
                      text: TextSpan(
                          text: "Country",
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w300,
                              color: Colors.black87),
                          children: const [
                        TextSpan(text: "*", style: TextStyle(color: Colors.red))
                      ])),
                ),
                items: snapshotData
                    ?.map((country) => DropdownMenuItem(
                        value: country.name.toString(),
                        child: Text(
                          country.name.toString(),
                        )))
                    .toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedCountry = newValue.toString();
                    selectedState = null;
                    selectedCity = null;
                    selectedStatesCities = [];
                    selectedCountryStates = [];
                    // print("selectedCountry:$selectedCountry");

                    selectedCountryStates = snapshotData!
                        .firstWhere((element) => element.name == newValue)
                        .states!;
                  });
                },
                value: selectedCountry,
                validator: (value) {
                  return locationController.validateCountry(value!.toString());
                },
              ),
            );
          } else {
            return Container();
          }
        });
  }

  Widget buildState() {
    return Form(
      key: locationController.stateFormKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: DropdownButtonFormField<dynamic>(
        style: TextStyle(
            color: AppColors.textColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500),
        icon: const Icon(Icons.keyboard_arrow_down_rounded),
        isExpanded: true,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.disableColor)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromRGBO(216, 216, 220, 1), width: 1)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.r))),
          label: RichText(
              text: TextSpan(
                  text: "State",
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w300,
                      color: Colors.black87),
                  children: const [
                TextSpan(text: "*", style: TextStyle(color: Colors.red))
              ])),
        ),
        items: selectedCountryStates
            .map((state) => DropdownMenuItem<dynamic>(
                value: state.name.toString(),
                child: Text(state.name.toString())))
            .toList(),
        onChanged: (newValue) {
          setState(() {
            selectedState = newValue.toString();
            selectedCity = null;
            // print("selected State: $selectedState");

            selectedStatesCities = selectedCountryStates
                .firstWhere((element) => element.name == newValue)
                .cities!;
          });
        },
        value: selectedState,
        validator: (value) {
          return locationController.validateState(value.toString());
        },
      ),
    );
  }

  Widget buildCity() {
    return Form(
      child: DropdownButtonFormField(
        key: locationController.cityFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(
            color: AppColors.textColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500),
        icon: const Icon(Icons.keyboard_arrow_down_rounded),
        isExpanded: true,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.disableColor)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromRGBO(216, 216, 220, 1), width: 1)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
          label: RichText(
              text: TextSpan(
                  text: "City",
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w300,
                      color: Colors.black87),
                  children: const [
                TextSpan(text: "*", style: TextStyle(color: Colors.red))
              ])),
        ),
        items: selectedStatesCities
            .map((e) => DropdownMenuItem(value: e.name!, child: Text(e.name!)))
            .toList(),
        onChanged: (newValue) {
          setState(() {
            selectedCity = newValue.toString();
            // print("selectedCity: $selectedCity");
          });
        },
        value: selectedCity,
        validator: (value) {
          return locationController.validateCity(value.toString());
        },
      ),
    );
  }
}
