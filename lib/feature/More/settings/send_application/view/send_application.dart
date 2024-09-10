import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgt_owner/shared/widgets/custom_appbar.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';
import 'package:sgt_owner/feature/More/settings/send_application/controller/send_application_controller.dart';

class SendApplication extends StatefulWidget {
  const SendApplication({super.key});

  @override
  State<SendApplication> createState() => _SendApplicationState();
}

class _SendApplicationState extends State<SendApplication> {
  final controller = Get.put(SendApplicationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        titleText: "Send Application",
        isLeading: true,
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(16.h), child: sendApplication()),
    );
  }

  Widget sendApplication() {
    return Container(
      // height: 50,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.disableColor, width: 1.w),
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(6.r))),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          children: [
            SizedBox(
              height: 12.h,
            ),
            selectGuard(),
            SizedBox(
              height: 18.h,
            ),
            buildEmail(),
            SizedBox(
              height: 18.h,
            ),
            buildMobileNumber(),
            SizedBox(
              height: 16.h,
            ),
            Obx(
              () => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 47.h),
                      shadowColor: Colors.transparent,
                      surfaceTintColor: Colors.transparent,
                      backgroundColor: !controller.btnEnable.value
                          ? AppColors.disableColor
                          : AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.r))),
                  onPressed: () {
                    // Get.to(() => CancelSubscription());
                  },
                  child: Text(
                    "Send",
                    style:
                        AppFontStyle.semiboldTextStyle(AppColors.white, 16.sp),
                  )),
            ),
            SizedBox(
              height: 16.h,
            ),
          ],
        ),
      ),
    );
  }

  Widget selectGuard() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onTap: () {
            Get.dialog(const GuardsList());
          },
          child: Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: Container(
              width: MediaQuery.of(context).size.width * .9,
              padding: EdgeInsets.only(
                  left: 19.w, top: 14.w, bottom: 14.w, right: 11.w),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(width: 1, color: AppColors.disableColor),
                  borderRadius: BorderRadius.all(Radius.elliptical(5.r, 5.r))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Select guard to send application ',
                      style: AppFontStyle.regularTextStyle(
                          AppColors.disableColor, 12.sp)),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.textColor,
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 10.w,
          child: Container(
            color: AppColors.white,
            child: Text(
              ' Select Guard  ',
              style: AppFontStyle.mediumTextStyle(AppColors.grayColor, 12.sp),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildEmail() {
    return SizedBox(
      // height: 46.h,
      child: Form(
        key: controller.emailFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: TextFormField(
          // initialValue: "supervisor@sgt.com",
          style: AppFontStyle.regularTextStyle(AppColors.textColor, 12.sp),
          controller: controller.emailController,
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 13.h, horizontal: 10.w),
              hintText: "Enter Email",
              hintStyle:
                  AppFontStyle.mediumTextStyle(AppColors.disableColor, 12.sp),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromRGBO(216, 216, 220, 1), width: 1)),
              label: RichText(
                  text: TextSpan(
                      text: "Email ",
                      style: AppFontStyle.mediumTextStyle(
                          AppColors.grayColor, 12.sp),
                      children: const [
                    TextSpan(text: "", style: TextStyle(color: Colors.red))
                  ])),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.disableColor)),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.grayColor),
                  borderRadius: BorderRadius.circular(5.r))),
          onChanged: (value) {
            controller.email = value;
          },
          validator: (value) {
            return controller.validEmail(value!);
          },
          // focusNode: _emailFocus,
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          //   onFieldSubmitted: (value) {
          //   FocusScope.of(context).requestFocus(_mobileNumberFocus);
          // },
        ),
      ),
    );
  }

  Widget buildMobileNumber() {
    return SizedBox(
      // height: 46.h,
      child: Form(
        key: controller.mobileNumberFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: TextFormField(
          style: AppFontStyle.regularTextStyle(AppColors.textColor, 12.sp),
          controller: controller.mobileNumberController,
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 13.h, horizontal: 10.w),
              hintText: "Enter Mobile Number",
              hintStyle:
                  AppFontStyle.mediumTextStyle(AppColors.disableColor, 12.sp),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromRGBO(216, 216, 220, 1), width: 1)),
              label: RichText(
                  text: TextSpan(
                      text: "Mobile Number",
                      style: AppFontStyle.mediumTextStyle(
                          AppColors.grayColor, 12.sp),
                      children: const [
                    TextSpan(text: "", style: TextStyle(color: Colors.red))
                  ])),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.disableColor)),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.grayColor),
                  borderRadius: BorderRadius.circular(5.r))),
          onChanged: (value) {
            controller.mobileNumber = value;
          },
          validator: (value) {
            return controller.validateMobileNumber(value!);
          },
          // focusNode: _mobileNumberFocus,
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          onFieldSubmitted: (value) {
            FocusScope.of(context).unfocus();
          },
        ),
      ),
    );
  }
}

class GuardsList extends StatefulWidget {
  const GuardsList({super.key});

  @override
  State<GuardsList> createState() => _GuardsListState();
}

class _GuardsListState extends State<GuardsList> {
  List<bool> checkBox = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 120.h),
      child: Column(
        children: [
          Container(
            color: AppColors.primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Available Guards',
                  style: AppFontStyle.mediumTextStyle(AppColors.white, 16.sp),
                ),
                Text(
                  '17',
                  style: AppFontStyle.mediumTextStyle(AppColors.white, 16.sp),
                ),
              ],
            ),
          ),
          Container(
            height: 350.h,
            child: GlowingOverscrollIndicator(
              color: AppColors.primaryColor,
              axisDirection: AxisDirection.down,
              child: RawScrollbar(
                minThumbLength: 40.h,
                thumbColor: AppColors.primaryColor,
                radius: const Radius.circular(20),
                thickness: 5,
                child: guardCard(),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: AppColors.primaryBackColor,
            ),
            width: Get.width,
            height: 66.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 8.h),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.r)),
                    backgroundColor: AppColors.primaryColor),
                onPressed: () {},
                child: Text(
                  'Assign Guard',
                  style: AppFontStyle.mediumTextStyle(AppColors.white, 16.sp),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget guardCard() {
    return ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: checkBox.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                setState(() {
                  checkBox[index] = true;
                });
                if (checkBox[index] == true) {
                  Navigator.pop(context);
                }
              },
              child: card(index));
        });
  }

  Widget card(index) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: SizedBox(
        height: 78.h,
        child: Card(
          margin: EdgeInsets.zero,
          surfaceTintColor: Colors.white,
          elevation: 2.h,
          shadowColor: AppColors.grayColor,
          color: checkBox[index] == true
              ? AppColors.primaryBackColor
              : AppColors.white,
          shape: const RoundedRectangleBorder(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                RotatedBox(
                  quarterTurns: (1),
                  child: Container(
                    height: 16.h,
                    decoration: BoxDecoration(
                        color: checkBox[index] == true
                            ? AppColors.primaryColor
                            : AppColors.primaryBackColor),
                    child: Center(
                      child: Text(
                        "Available",
                        style: TextStyle(
                            color: checkBox[index] == true
                                ? AppColors.white
                                : AppColors.primaryColor,
                            fontSize: 12.h,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 6.w),
                  child: Image(
                      height: 55.h,
                      width: 55.w,
                      image: const AssetImage("assets/guard_image.png")),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Lorri Warf ${index + 1}",
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      RichText(
                          text: TextSpan(
                              text: "Email:",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black),
                              children: [
                            TextSpan(
                                text: " Lorri201@gmail.com",
                                style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    overflow: TextOverflow.ellipsis))
                          ])),
                      SizedBox(
                        height: 2.h,
                      ),
                      RichText(
                          text: TextSpan(
                              text: "Phone Number:",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black),
                              children: [
                            TextSpan(
                                text: " (920) 948-1722",
                                style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    overflow: TextOverflow.ellipsis))
                          ])),
                    ],
                  ),
                ),
              ]),
              Checkbox(
                  side: const BorderSide(color: AppColors.primaryColor),
                  value: checkBox[index],
                  activeColor: AppColors.primaryColor,
                  onChanged: (bool? newValue) {
                    setState(() {
                      Future.delayed(Duration.zero, () {
                        // Get.toNamed('/PropertiesPage',
                        //     arguments: {"selectedGuardsCard": card(index)});
                        Navigator.pop(context);
                      });

                      checkBox[index] = newValue!;
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
