import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SendApplicationController extends GetxController {
  final GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> mobileNumberFormKey = GlobalKey<FormState>();

  late TextEditingController mobileNumberController, emailController;

  var mobileNumber = '';
  var email = '';

  RxBool isMobileNumberValid = false.obs;
  RxBool isEmailValid = false.obs;
  RxBool btnEnable = false.obs;

  @override
  void onInit() {
    super.onInit();

    mobileNumberController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();

    mobileNumberController.dispose();
    emailController.dispose();
  }

  String? validateMobileNumber(String value) {
    if (!GetUtils.isPhoneNumber(value)) {
      Future.delayed(Duration.zero, (() {
        isMobileNumberValid.value = false;
        btnEnable.value = false;
      }));
      return "\u24D8  Enter valid Mobile Number";
    }
    Future.delayed(Duration.zero, (() {
      isMobileNumberValid.value = true;
      if (isMobileNumberValid.value && isEmailValid.value) {
        btnEnable.value = true;
      }
    }));

    return null;
  }

  String? validEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      Future.delayed(Duration.zero, () {
        isEmailValid.value = false;
        btnEnable.value = false;
      });
      return "\u24D8  Enter valid Email Id";
    }
    Future.delayed(Duration.zero, () {
      isEmailValid.value = true;
      if (isMobileNumberValid.value && isEmailValid.value) {
        btnEnable.value = true;
      }
    });

    return null;
  }

  void checkValid() {
    isMobileNumberValid.value = mobileNumberFormKey.currentState!.validate();
    if (!isMobileNumberValid.value) {
      btnEnable.isFalse;
    }
    mobileNumberFormKey.currentState!.save();

    isEmailValid.value = emailFormKey.currentState!.validate();
    if (!isEmailValid.value) {
      btnEnable.value = false;
    }
    emailFormKey.currentState!.save();
  }
}