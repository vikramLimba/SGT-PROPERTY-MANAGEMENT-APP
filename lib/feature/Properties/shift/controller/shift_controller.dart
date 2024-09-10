import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CreateShiftController extends GetxController {
  var currentStep = 0.obs;

  final GlobalKey<FormState> shiftNameFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> clockInTimeFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> clockInDescriptionFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> clockOutTimeFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> clockOutDescriptionFormKey =
      GlobalKey<FormState>();

  late TextEditingController shiftNameController,
      clockInTimeController,
      clockInDescriptionController,
      clockOutTimeController,
      clockOutDescriptionController;

  var shiftName = '';
  var clockInTime = '';
  var clockInDescription = '';
  var clockOutTime = '';
  var clockOutDescription = '';

  // RxBool isFNameValid = false.obs;

  RxBool btnEnabled1 = false.obs;
  RxBool btnEnabled2 = false.obs;
  RxBool saveBtnEnabled = false.obs;

  @override
  void onInit() {
    super.onInit();
    shiftNameController = TextEditingController();
    clockInTimeController = TextEditingController();
    clockInDescriptionController = TextEditingController();
    clockOutTimeController = TextEditingController();
    clockOutDescriptionController = TextEditingController();
  }

  @override
  void onClose() {
    shiftNameController.dispose();
    clockInTimeController.dispose();
    clockInDescriptionController.dispose();
    clockOutTimeController.dispose();
    clockOutDescriptionController.dispose();
  }

  String? validateShiftName(String value) {
    if (value == '' || value.isEmpty) {
      Future.delayed(Duration.zero, () {
        saveBtnEnabled.value = false;
      });
      return "\u24D8  Please Enter Shift Name";
    }
    if (btnEnabled1.value && btnEnabled2.value && value.isNotEmpty) {
      Future.delayed(Duration.zero, () {
        saveBtnEnabled.value = true;
      });
    }
    return null;
  }

  String? validateClockInTime(String value) {
    if (value == '' || value.isEmpty) {
      Future.delayed(Duration.zero, () {
        btnEnabled1.value = false;
        saveBtnEnabled.value = false;
      });
      return "\u24D8  Select ClockIn Time";
    }
    if (clockInTimeController.text.isNotEmpty &&
        clockInDescriptionController.text.isNotEmpty) {
      Future.delayed(Duration.zero, () {
        btnEnabled1.value = true;
      });
    }
    if (btnEnabled1.value && btnEnabled2.value && value.isNotEmpty) {
      Future.delayed(Duration.zero, () {
        saveBtnEnabled.value = true;
      });
    }
    return null;
  }

  String? validateClockInDescription(String value) {
    if (value == '' || value.isEmpty) {
      Future.delayed(Duration.zero, () {
        btnEnabled1.value = false;
        saveBtnEnabled.value = false;
      });
      return "\u24D8  Enter ClockIn Description";
    }
    if (clockInTimeController.text.isNotEmpty &&
        clockInDescriptionController.text.isNotEmpty) {
      Future.delayed(Duration.zero, () {
        btnEnabled1.value = true;
      });
    }
    if (btnEnabled1.value && btnEnabled2.value && value.isNotEmpty) {
      Future.delayed(Duration.zero, () {
        saveBtnEnabled.value = true;
      });
    }
    return null;
  }

  String? validateClockOutTime(String value) {
    if (value == '' || value.isEmpty) {
      Future.delayed(Duration.zero, () {
        btnEnabled2.value = false;
        saveBtnEnabled.value = false;
      });
      return "\u24D8  Select ClockOut Time";
    }
    if (clockOutTimeController.text.isNotEmpty &&
        clockOutDescriptionController.text.isNotEmpty) {
      Future.delayed(Duration.zero, () {
        btnEnabled2.value = true;
      });
    }
    if (btnEnabled1.value && btnEnabled2.value && value.isNotEmpty) {
      Future.delayed(Duration.zero, () {
        saveBtnEnabled.value = true;
      });
    }
    return null;
  }

  String? validateClockOutDescription(String value) {
    if (value == '' || value.isEmpty) {
      Future.delayed(Duration.zero, () {
        btnEnabled2.value = false;
        saveBtnEnabled.value = false;
      });
      return "\u24D8  Enter ClockOut Description";
    }
    if (clockOutTimeController.text.isNotEmpty &&
        clockOutDescriptionController.text.isNotEmpty) {
      Future.delayed(Duration.zero, () {
        btnEnabled2.value = true;
      });
    }
    if (btnEnabled1.value && btnEnabled2.value && value.isNotEmpty) {
      Future.delayed(Duration.zero, () {
        saveBtnEnabled.value = true;
      });
    }
    return null;
  }

  void checkRequiredShiftDetails() {}

  void checkLogin() {
    // isFNameValid.value = fNameFormKey.currentState!.validate();
    // if (!isFNameValid.value) {
    //   return;
    // } else {
    //   fNameFormKey.currentState!.save();
    // }
    // isLNameValid.value = lNameFormKey.currentState!.validate();
    // if (!isLNameValid.value) {
    //   return;
    // } else {
    //   lNameFormKey.currentState!.save();
    // }
    // isEmailValid.value = emailFormKey.currentState!.validate();
    // if (!isEmailValid.value) {
    //   return;
    // } else {
    //   emailFormKey.currentState!.save();
    // }
    // isNumberValid.value = phoneFormKey.currentState!.validate();
    // if (!isNumberValid.value) {
    //   return;
    // } else {
    //   phoneFormKey.currentState!.save();
    // }

    // isPasswordValid1.value = passFormKey1.currentState!.validate();
    // if (!isPasswordValid1.value) {
    //   return;
    // } else {
    //   passFormKey1.currentState!.save();
    // }

    // isPasswordValid2.value = passFormKey2.currentState!.validate();
    // if (!isPasswordValid2.value) {
    //   return;
    // } else {
    //   Get.toNamed("/email_verification",

    //           parameters: {"email": emailController.text,"signUp":'signUpSuccessful'})!
    //       .then((value) {
    //     fNameController.clear();
    //     lNameController.clear();
    //     emailController.clear();
    //     phoneController.clear();
    //     passwordController1.clear();
    //     passwordController2.clear();
    //   });
    //   passFormKey2.currentState!.save();
    // }
  }
}
