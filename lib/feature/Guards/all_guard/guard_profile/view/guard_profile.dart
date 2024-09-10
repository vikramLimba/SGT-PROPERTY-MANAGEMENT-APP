import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgt_owner/feature/Guards/all_guard/missed_shifts/view/missed_shifts.dart';
import 'package:sgt_owner/feature/Guards/all_guard/shared/view/edit_profile_popup.dart';
import 'package:sgt_owner/feature/Guards/new_guard/shared/controller/location_picker_controller.dart';
import 'package:sgt_owner/shared/country_state_city_model.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';

class GuardProfile extends StatefulWidget {
  const GuardProfile({super.key});

  @override
  State<GuardProfile> createState() => _GuardProfileState();
}

class _GuardProfileState extends State<GuardProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 6,
        shadowColor: Color.fromARGB(255, 186, 185, 185),
        leading: Padding(
          padding: EdgeInsets.only(
            left: 12.w,
          ),
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_outlined,
              color: AppColors.textColor,
            ),
          ),
        ),
        leadingWidth: 30.w,
        title: Text(
          "Patrecia Gracia",
          style: AppFontStyle.semiboldTextStyle(AppColors.textColor, 16.sp),
        ),
        centerTitle: false,
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
                      Positioned(right: 0, child: EditProfilePopUP())
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
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Added Since: 23 Aug,2023",
                  style: TextStyle(
                      color: AppColors.secondaryColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
    );
  }

  Widget buildName() {
    return SizedBox(
      height: 46.h,
      child: Form(
        // key: profileController.fNameFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: TextFormField(
          readOnly: true,
          initialValue: "John Doe",
          style: TextStyle(
              color: AppColors.secondaryColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500),
          // controller: profileController.fNameController,
          decoration: InputDecoration(
              hintText: "Enter First Name",
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
                      text: "First Name",
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w300,
                          color: Colors.black87),
                      children: const [
                    TextSpan(text: "", style: TextStyle(color: Colors.red))
                  ])),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 153, 131, 126)),
                  borderRadius: BorderRadius.circular(5.r))),
          // onChanged: (value) {
          //   // profileController.fName = value;
          // },
          // // validator: (value) {
          // //   // return profileController.validateFName(value!);
          // // },
          // // focusNode: _fNameFocus,
          // onTapOutside: (event) {
          //   FocusScope.of(context).unfocus();
          // },
          // onFieldSubmitted: (value) {
          //   // FocusScope.of(context).requestFocus(_lNameFocus);
          // },
        ),
      ),
    );
  }

  Widget buildPosition() {
    return SizedBox(
      height: 46.h,
      child: Form(
        // key: profileController.fNameFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: TextFormField(
          readOnly: true,
          initialValue: "Supervisor",
          style: TextStyle(
              color: AppColors.secondaryColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500),
          // controller: profileController.fNameController,
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
                    TextSpan(text: "", style: TextStyle(color: Colors.red))
                  ])),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.grayColor),
                  borderRadius: BorderRadius.circular(5.r))),
          // onChanged: (value) {
          //   // profileController.fName = value;
          // },
          // validator: (value) {
          //   // return profileController.validateFName(value!);
          // },
          // // focusNode: _fNameFocus,
          // onTapOutside: (event) {
          //   FocusScope.of(context).unfocus();
          // },
          // onFieldSubmitted: (value) {
          //   // FocusScope.of(context).requestFocus(_lNameFocus);
          // },
        ),
      ),
    );
  }

  Widget buildGender() {
    return SizedBox(
      height: 46.h,
      child: Form(
          // key: profileController.genderFormKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: DropdownButtonFormField(
            style: TextStyle(
                color: AppColors.secondaryColor,
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
                      TextSpan(text: "", style: TextStyle(color: Colors.red))
                    ])),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.disableColor)),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.grayColor)),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.grayColor),
                    borderRadius: BorderRadius.circular(5.r))),
            items: ["Male"].map((e) {
              return DropdownMenuItem(child: Text(e));
            }).toList(),
            //  _gender.map((e) {
            //   return DropdownMenuItem(
            //       value: e,
            //       child: Text(
            //         e,
            //         style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
            //       ));
            // }).toList(),
            onChanged: null,
            // onChanged: (value) {
            //   // profileController.gender = value!;
            // },
            // validator: (value) {
            //   return profileController.validateGender(value ?? "");
            // },
          )),
    );
  }

  Widget buildEmail() {
    return SizedBox(
      height: 46.h,
      child: Form(
        // key: profileController.emailFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: TextFormField(
          initialValue: "supervisor@sgt.com",
          style: TextStyle(
              color: AppColors.secondaryColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500),
          readOnly: true,
          // controller: profileController.emailController,
          decoration: InputDecoration(
              // isDense: true,
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
                      text: "Email ",
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w300,
                          color: Colors.black87),
                      children: const [
                    TextSpan(text: "", style: TextStyle(color: Colors.red))
                  ])),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.disableColor)),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.grayColor),
                  borderRadius: BorderRadius.circular(5.r))),
          onChanged: null,
          // onChanged: (value) {
          //   profileController.email = value;
          // },
          // validator: (value) {
          //   return profileController.validEmail(value!);
          // },
          // focusNode: _emailFocus,
          // onTapOutside: (event) {
          //   FocusScope.of(context).unfocus();
          // },
        ),
      ),
    );
  }

  Widget buildMobileNumber() {
    return SizedBox(
      height: 46.h,
      child: Form(
        // key: profileController.mobileNumberFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: TextFormField(
          readOnly: true,
          initialValue: "+91 622694949",
          style: TextStyle(
              color: AppColors.secondaryColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500),
          // controller: profileController.mobileNumberController,
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
                    TextSpan(text: "", style: TextStyle(color: Colors.red))
                  ])),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.disableColor)),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.grayColor),
                  borderRadius: BorderRadius.circular(5.r))),
          // onChanged: (value) {
          //   profileController.mobileNumber = value;
          // },
          // validator: (value) {
          //   return profileController.validateMobileNumber(value!);
          // },
          // focusNode: _mobileNumberFocus,
          // onTapOutside: (event) {
          //   FocusScope.of(context).unfocus();
          // },
          // onFieldSubmitted: (value) {
          //   FocusScope.of(context).requestFocus(_emailFocus);
          // },
        ),
      ),
    );
  }

  Widget buildStreetAddress() {
    return Form(
      // key: addressController.streetAddressFormKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: SizedBox(
        child: TextFormField(
          readOnly: true,
          initialValue: "Hallway street 75/25",
          style: TextStyle(
              color: AppColors.secondaryColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500),
          maxLines: 3,
          // controller: addressController.streesAddressController,
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
              label: Text(
                "Street Address",
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w300,
                    color: Colors.black87),
              ),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.disableColor)),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.grayColor),
                  borderRadius: BorderRadius.circular(5.r))),
          // onChanged: (value) {
          //   addressController.streetAddress = value;
          // },
          // validator: (value) {
          //   return addressController.validataStreetAdrees(value!);
          // },
          // focusNode: _fNameFocus,
          // onTapOutside: (event) {
          //   FocusScope.of(context).unfocus();
          // },
          // onFieldSubmitted: (value) {
          //   // FocusScope.of(context).requestFocus(_lNameFocus);
          // },
        ),
      ),
    );
  }

  Widget buildPostalCode() {
    return SizedBox(
      // height: 90.h,
      child: Form(
        // key: addressController.postalCodeFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: TextFormField(
          readOnly: true,
          initialValue: "000100",
          style: TextStyle(
              color: AppColors.secondaryColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500),
          // controller: addressController.postalCodeController,
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
              label: Text(
                "Postal Code",
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w300,
                    color: Colors.black87),
              ),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.disableColor)),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.grayColor),
                  borderRadius: BorderRadius.circular(5.r))),
          // onChanged: (value) {
          //   addressController.postalCode = value;
          // },
          // validator: (value) {
          //   return addressController.validatePostalCode(value!);
          // },
          // focusNode: _fNameFocus,
          // onTapOutside: (event) {
          //   // FocusScope.of(context).unfocus();
          // },
          // onFieldSubmitted: (value) {
          //   // FocusScope.of(context).requestFocus(_lNameFocus);
          // },
        ),
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
  // var profileController1 = Get.find<ProfileController>();

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
      // key: profileController1.dobFormKey,
      child: TextFormField(
        readOnly: true,
        style: TextStyle(
            color: AppColors.secondaryColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500),
        keyboardType: TextInputType.none,
        controller: TextEditingController(
            text: selectedDate == null
                ? today
                : selectedDate?.toLocal().toString().split(" ")[0]),
        // onTap: () {
        //   openDialog();
        // },
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
                  TextSpan(text: "", style: TextStyle(color: Colors.red))
                ])),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.disableColor)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.grayColor),
                borderRadius: BorderRadius.circular(5.r))),
        // onChanged: (value) {
        //   profileController1.dateOfBirth = value;
        //   value = selectedDate.toString();
        // },
        onChanged: null,
        // validator: (value) {
        //   return profileController1.validateDOB(value!);
        // },
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
  // LocationPickerController locationController =
  //     Get.put(LocationPickerController());

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
        .loadString("assets/data/country_state_city.json");
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
            print('print----------------1');
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            print('print----------------2');
            return Text("Error: ${snapshot.error}");
          } else if (!snapshot.hasData) {
            print('print----------------3');
            return const Text("No data available");
          } else if (snapshot.hasData) {
            print('print----------------4');

            snapshotData = snapshot.data;

            return SizedBox(
              height: 46.h,
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                // key: locationController.countryFormKey,
                child: DropdownButtonFormField(
                  style: TextStyle(
                      color: AppColors.grayColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500),
                  icon: const Icon(Icons.keyboard_arrow_down_rounded),
                  decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.disableColor)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(216, 216, 220, 1),
                              width: 1)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.r)),
                      label: Text(
                        "Country",
                        style: TextStyle(
                            color: AppColors.black,
                            fontSize: 15.h,
                            fontWeight: FontWeight.w300),
                      )
                      // RichText(
                      //   text: const TextSpan(
                      //       text: "Country",
                      //       style: TextStyle(color: Colors.black87),
                      //       children: [
                      //         TextSpan(
                      //             text: "*", style: TextStyle(color: Colors.red))
                      //       ]),
                      // )
                      ),
                  items: ["India"].map((e) {
                    return DropdownMenuItem(child: Text(e));
                  }).toList(),
                  //items: snapshotData
                  //     ?.map((country) => DropdownMenuItem(
                  //         value: country.name.toString(),
                  //         child: Text(
                  //           country.name.toString(),
                  //         )))
                  //     .toList(),
                  onChanged: null,
                  // onChanged: (newValue) {
                  //   setState(() {
                  //     selectedCountry = newValue;
                  //     selectedState = null;
                  //     selectedCity = null;
                  //     selectedStatesCities = [];
                  //     selectedCountryStates = [];
                  //     print("selectedCountry:$selectedCountry");

                  //     selectedCountryStates = snapshotData!
                  //         .firstWhere((element) => element.name == newValue)
                  //         .states!;
                  //   });
                  // },
                  // value: selectedCountry,
                  // validator: (value) {
                  //   return locationController.validateCountry(value!);
                  // },
                ),
              ),
            );
          } else {
            return Container();
          }
        });
  }

  Widget buildState() {
    return Form(
      // key: locationController.stateFormKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: DropdownButtonFormField(
        style: TextStyle(
            color: AppColors.grayColor,
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
            label: Text(
              "State",
              style: TextStyle(
                  color: AppColors.black,
                  fontSize: 15.h,
                  fontWeight: FontWeight.w300),
            )
            //  RichText(
            //     text: const TextSpan(
            //         text: "States",
            //         style: TextStyle(color: Colors.black87),
            //         children: [
            //       TextSpan(text: "*", style: TextStyle(color: Colors.red))
            //     ]))
            ),
        items: ["Uttar Pradesh"].map((e) {
          return DropdownMenuItem(child: Text(e));
        }).toList(),
        onChanged: null,
        // items: selectedCountryStates
        //     .map((state) => DropdownMenuItem<dynamic>(
        //         value: state.name.toString(),
        //         child: Text(state.name.toString())))
        //     .toList(),
        // onChanged: (newValue) {
        //   setState(() {
        //     selectedState = newValue;
        //     selectedCity = null;
        //     print("selected State: $selectedState");

        //     selectedStatesCities = selectedCountryStates
        //         .firstWhere((element) => element.name == newValue)
        //         .cities!;
        //   });
        // },
        // value: selectedState,
        // validator: (value) {
        //   return locationController.validateState(value!);
        // },
      ),
    );
  }

  Widget buildCity() {
    return Form(
      child: DropdownButtonFormField(
        // key: locationController.cityFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        icon: const Icon(Icons.keyboard_arrow_down_rounded),
        isExpanded: true,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.disableColor)),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromRGBO(216, 216, 220, 1), width: 1)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
            label: Text(
              "City",
              style: TextStyle(
                  color: AppColors.black,
                  fontSize: 15.h,
                  fontWeight: FontWeight.w300),
            )
            //  RichText(
            //   text: const TextSpan(
            //       text: 'Cities',
            //       style: TextStyle(color: Colors.black87),
            //       children: [
            //         TextSpan(text: "*", style: TextStyle(color: Colors.red))
            //       ]),
            // )
            ),
        items: ["Luknow"].map((e) {
          return DropdownMenuItem(child: Text(e));
        }).toList(),
        onChanged: null,
        // items: selectedStatesCities
        //     .map((e) => DropdownMenuItem(value: e.name!, child: Text(e.name!)))
        //     .toList(),
        // onChanged: (newValue) {
        //   setState(() {
        //     selectedCity = newValue;
        //     print("selectedCity: $selectedCity");
        //   });
        // },
        // value: selectedCity,
        // validator: (value) {
        //   return locationController.validateCity(value!);
        // },
      ),
    );
  }
}
