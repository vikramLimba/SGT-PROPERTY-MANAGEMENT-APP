import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditGuardProfileController extends GetxController {
  final GlobalKey<FormState> nameFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> genderFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> guardPositionFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> dobFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> mobileNumberFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> streetAddressFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> postalCodeFormKey = GlobalKey<FormState>();

  late TextEditingController nameController,
      genderController,
      guardPositionController,
      dobController,
      mobileNumberController,
      emailController,
      streesAddressController,
      postalCodeController;

  var name = '';
  var lName = '';
  var gender = '';
  var guardPosition ='';
  var dateOfBirth = '';
  var mobileNumber = '';
  var email = '';
  var streetAddress = '', postalCode = '', country = '', state = '', city = '';

  RxBool isNameValid = false.obs;
  RxBool isGenderValid = false.obs;
  RxBool isGuradPositionValid = false.obs;
  RxBool isDobValid = false.obs;
  RxBool isMobileNumberValid = false.obs;
  RxBool isEmailValid = false.obs;
  RxBool isStreetAddressValid = false.obs;
  RxBool isPostalCodeValid = false.obs;

  RxBool btnEnable = false.obs;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    genderController = TextEditingController();
    guardPositionController = TextEditingController();
    dobController = TextEditingController();
    mobileNumberController = TextEditingController();
    emailController = TextEditingController();
    streesAddressController = TextEditingController();
    postalCodeController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    genderController.dispose();
    guardPositionController.dispose();
    dobController.dispose();
    mobileNumberController.dispose();
    emailController.dispose();
    streesAddressController.dispose();
    postalCodeController.dispose();
  }

  String? validateName(String value) {
    if (value == '' || value.isEmpty) {
      Future.delayed(Duration.zero, () {
        isNameValid.value = false;
        btnEnable.value = false;
      });
      return "\u24D8  Please Enter First Name";
    }
    Future.delayed(Duration.zero, () {
      isNameValid.value = true;
      if (isNameValid.value &&
          isGenderValid.value &&
          isGuradPositionValid.value &&
          isMobileNumberValid.value &&
          isEmailValid.value &&
          isStreetAddressValid.value &&
          isPostalCodeValid.value) {
        btnEnable.value = true;
      }
    });
    return null;
  }

  String? validateGender(String value) {
    if (value == ' ' || value.isEmpty) {
      Future.delayed(Duration.zero, () {
        isGenderValid.value = false;
        btnEnable.value = false;
      });
      return "\u24D8 Please select Gender";
    }
    Future.delayed(Duration.zero, () {
      isGenderValid.value = true;
      if (isNameValid.value &&
          isGenderValid.value &&
          isGuradPositionValid.value &&
          isMobileNumberValid.value &&
          isEmailValid.value &&
          isStreetAddressValid.value &&
          isPostalCodeValid.value) {
        btnEnable.value = true;
      }
    });
    return null;
  }

  String? validateGuardPosition(String value) {
    if (value == '' || value.isEmpty) {
      Future.delayed(Duration.zero, () {
        isGuradPositionValid.value = false;
        btnEnable.value = false;
      });
      return '\u24D8 Please select Guard Position';
    }
    Future.delayed(Duration.zero, () {
      isGuradPositionValid.value = true;
      if (isNameValid.value &&
          isGenderValid.value &&
          isGuradPositionValid.value &&
          isMobileNumberValid.value &&
          isEmailValid.value &&
          isStreetAddressValid.value &&
          isPostalCodeValid.value) {
        btnEnable.value = true;
      }
    });
    return null;
  }

  String? validateDOB(String value) {
    if (value == '' || value.isEmpty) {
      return 'u24D8 Please select Date Of Birth';
    }
    return null;
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
      if (isNameValid.value &&
          isGenderValid.value &&
          isGuradPositionValid.value &&
          isMobileNumberValid.value &&
          isEmailValid.value &&
          isStreetAddressValid.value &&
          isPostalCodeValid.value) {
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
      if (isNameValid.value &&
          isGenderValid.value &&
          isGuradPositionValid.value &&
          isMobileNumberValid.value &&
          isEmailValid.value &&
          isStreetAddressValid.value &&
          isPostalCodeValid.value) {
        btnEnable.value = true;
      }
    });

    return null;
  }

  String? validataStreetAdrees(String value) {
    if (value == "") {
      Future.delayed(Duration.zero, () {
        isStreetAddressValid.value = false;
        btnEnable.value = false;
      });

      return "\u24D8  Please Enter Street Address";
    }
    Future.delayed(Duration.zero, () {
      print("street Address valid");
      isStreetAddressValid.value = true;
      if (isNameValid.value &&
          isGenderValid.value &&
          isGuradPositionValid.value &&
          isMobileNumberValid.value &&
          isEmailValid.value &&
          isStreetAddressValid.value &&
          isPostalCodeValid.value) {
        btnEnable.value = true;
      }
    });
    return null;
  }

  String? validatePostalCode(String value) {
    if (value == "") {
      Future.delayed(Duration.zero, () {
        isPostalCodeValid.value = false;
        btnEnable.value = false;
      });
      return "\u24D8  Please Enter Postal Code";
    }
    Future.delayed(Duration.zero, () {
      print("postal code valid");
      isPostalCodeValid.value = true;
      if (isNameValid.value &&
          isGenderValid.value &&
          isGuradPositionValid.value &&
          isMobileNumberValid.value &&
          isEmailValid.value &&
          isStreetAddressValid.value &&
          isPostalCodeValid.value) {
        btnEnable.value = true;
      }
    });
    return null;
  }

  void checkValid() {
    isNameValid.value = nameFormKey.currentState!.validate();
    if (!isNameValid.value) {
      btnEnable.value = false;
    } else {
      nameFormKey.currentState!.save();
    }

    isGenderValid.value = genderFormKey.currentState!.validate();
    if (!isGenderValid.value) {
      btnEnable.value = false;
    } else {
      genderFormKey.currentState!.save();
    }

    isGuradPositionValid.value = guardPositionFormKey.currentState!.validate();
    if (!isGuradPositionValid.value) {
      btnEnable.value = false;
    } else {
      guardPositionFormKey.currentState!.save();
    }

    isDobValid.value = dobFormKey.currentState!.validate();
    if (!isDobValid.value) {
      btnEnable.value = false;
    } else {
      dobFormKey.currentState!.save();
    }

    isMobileNumberValid.value = mobileNumberFormKey.currentState!.validate();
    if (!isMobileNumberValid.value) {
      btnEnable.value = false;
    } else {
      mobileNumberFormKey.currentState!.save();
    }

    isEmailValid.value = emailFormKey.currentState!.validate();
    if (!isEmailValid.value) {
      btnEnable.value = false;
    } else {
      emailFormKey.currentState!.save();
    }
    // locationController.checkLocationValid();
    isStreetAddressValid.value = streetAddressFormKey.currentState!.validate();
    if (!isStreetAddressValid.value) {
      btnEnable.value = false;
    } else {
      streetAddressFormKey.currentState!.save();
    }

    isPostalCodeValid.value = postalCodeFormKey.currentState!.validate();
    if (!isPostalCodeValid.value) {
      btnEnable.value = false;
    } else {
      postalCodeFormKey.currentState!.save();
    }

    if (isNameValid.value &&
        isGenderValid.value &&
        isGuradPositionValid.value &&
        isDobValid.value &&
        isMobileNumberValid.value &&
        isEmailValid.value &&
        isStreetAddressValid.value &&
        isPostalCodeValid.value) {
      Get.toNamed("/GuardProfile")!.then((value) {
        nameController.clear();
        genderController.clear();
        guardPositionController.clear();
        dobController.clear();
        mobileNumberController.clear();
        emailController.clear();
        streesAddressController.clear();
        postalCodeController.clear();
      });
    }
  }
}
