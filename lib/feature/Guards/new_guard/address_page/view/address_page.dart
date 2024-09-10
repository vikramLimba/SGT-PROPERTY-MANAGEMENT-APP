import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgt_owner/feature/Guards/new_guard/address_page/controller/address_controller.dart';
import 'package:sgt_owner/feature/Guards/new_guard/shared/controller/add_guard_image_picker_controller.dart';
import 'package:sgt_owner/feature/Guards/new_guard/shared/controller/location_picker_controller.dart';
import 'package:sgt_owner/feature/Guards/new_guard/shared/view/image_picker.dart';
import 'package:sgt_owner/feature/Guards/new_guard/shared/view/location_picker.dart';
import 'package:sgt_owner/feature/Guards/new_guard/shared/view/new_guard_progress_bar.dart';
import 'package:sgt_owner/shared/widgets/custom_appbar.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  ImagePickerController imgController = Get.put(ImagePickerController());
  final addressController = Get.put(AddressController());
  final locationController = Get.put(LocationPickerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: AppColors.backgroundColor,
           appBar: CustomAppBar(
        titleText: 'Add Guard',
        isLeading: true,
      ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 13.h,
                    ),
                    SizedBox(
                        height: 25.h,
                        child: const NewGuardProgressBar(
                          currentIndex: 1,
                        )),
                    SizedBox(
                      height: 24.h,
                    ),
                    Container(
                      height: 117.h,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(6.r)),
                      child: Center(
                          child: AddProfileImage(
                        imgController: imgController,
                      )),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(6.r)),
                      child: Padding(
                        padding: EdgeInsets.all(8.0.w),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                    text: "Address",
                                    style: AppFontStyle.boldTextStyle(AppColors.black,16.sp),
                                    children: [
                                      TextSpan(
                                          text: " (Optional)",
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              color: AppColors.disableColor,
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.italic))
                                    ]),
                              ),
                              SizedBox(
                                height: 12.h,
                              ),
                              buildStreetAddress(),
                              SizedBox(
                                height: 7.h,
                              ),
                              buildPostalCode(),
                              SizedBox(
                                height: 20.h,
                              ),
                              LocationPicker(
                                locationController: locationController,
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                            ]),
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    SizedBox(
                      height: 47.h,
                      width: MediaQuery.of(context).size.width,
                      child:
                          //  Obx(
                          //   () =>
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6.r)),
                                  backgroundColor:
                                      // !addressController.btnEnable.value
                                      //     ? AppColors.disableColor
                                      //     :
                                      AppColors.primaryColor,
                                  foregroundColor: AppColors.white),
                              onPressed:
                                  // addressController.btnEnable.value
                                  //     ?

                                  () {
                                addressController.checkAddressValid();
                                // profileController.checkValid();
                              }
                              // : null
                              //  () {}
                              ,
                              child: Text(
                                "Next",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
                              )),
                    ),
                    // ),
                    SizedBox(
                      height: 50.h,
                    ),
                  ]),
            ),
        ));
  }

  Widget buildStreetAddress() {
    return Form(
      key: addressController.streetAddressFormKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: SizedBox(
        child: TextFormField(
          maxLines: 3,
          controller: addressController.streesAddressController,
          maxLength: 64,
          decoration: InputDecoration(
              // contentPadding:
              //     EdgeInsets.symmetric(vertical: 13.h, horizontal: 10.w),
              hintText: "Enter your Street Address...",
              hintStyle: AppFontStyle.regularTextStyle(AppColors.grayColor,14.sp),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromRGBO(216, 216, 220, 1), width: 1)),
              label: Text(
                "Street Address",
                style: AppFontStyle.regularTextStyle(AppColors.grayColor,14.sp),
              ),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.grayColor),
                  borderRadius: BorderRadius.circular(5.r))),
          onChanged: (value) {
            addressController.streetAddress = value;
          },
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
        key: addressController.postalCodeFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: TextFormField(
          controller: addressController.postalCodeController,
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 13.h, horizontal: 10.w),
              hintText: "Enter Postal Code",
              hintStyle: AppFontStyle.regularTextStyle(AppColors.grayColor,14.sp),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromRGBO(216, 216, 220, 1), width: 1)),
              label: Text(
                "Postal Code",
                style: AppFontStyle.regularTextStyle(Colors.black87,12.sp),
              ),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.grayColor),
                  borderRadius: BorderRadius.circular(5.r))),
          onChanged: (value) {
            addressController.postalCode = value;
          },
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
