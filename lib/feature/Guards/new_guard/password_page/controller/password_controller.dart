import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordController extends GetxController {
  final GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> confirmPasswordFormKey = GlobalKey<FormState>();

  late TextEditingController passwordController, confirmPasswordController;

  var password = "";
  var confirmPassword = "";

  RxBool isPasswordValid = false.obs;
  RxBool isConfirmPasswordValid = false.obs;

  @override
  void onInit() {
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();

    super.onInit();
  }

  @override
  void onClose() {
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.onClose();
  }

  RxBool btnEnabled = false.obs;

  String? validatePassword(String value) {
    if (value == '' || value.isEmpty) {
      Future.delayed(Duration.zero, () {
        btnEnabled.value = false;
      });
      return "\u24D8  Password is required";
    }
    if (value.length < 8) {
      Future.delayed(Duration.zero, () {
        btnEnabled.value = false;
      });
      return "\u24D8  Password must be at least 8 characters long";
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      Future.delayed(Duration.zero, () {
        btnEnabled.value = false;
      });
      return "\u24D8  Password must contain at least one uppercase letter";
    }
    if (!value.contains(RegExp(r'[a-z]'))) {
      Future.delayed(Duration.zero, () {
        btnEnabled.value = false;
      });
      return "\u24D8  Password must contain at least one lowercase letter";
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      Future.delayed(Duration.zero, () {
        btnEnabled.value = false;
      });
      return "\u24D8  Password must contain at least one numeric character";
    }
    if (!value.contains(RegExp(r'[!@#\$%^&*()<>?/|}{~:]'))) {
      Future.delayed(Duration.zero, () {
        btnEnabled.value = false;
      });
      return "\u24D8  Password must contain at least one special character";
    }

    if (isPasswordValid.value &&
        isConfirmPasswordValid.value &&
        (value == confirmPassword)) {
      Future.delayed(Duration.zero, () {
        btnEnabled.value = true;
      });
    }
    if (value == confirmPassword) {
      Future.delayed(Duration.zero, () {
        btnEnabled.value = true;
      });
    }
    if (value != confirmPassword) {
      Future.delayed(Duration.zero, () {
        btnEnabled.value = false;
      });
      return "\u24D8 Password not matched";
    }
    return null;
  }

  String? validateConfirmPassword(String value) {
    if (value == password) {
      Future.delayed(Duration.zero, () {
        btnEnabled.value = true;
        isConfirmPasswordValid.value = true;
      });
    }
    if (isPasswordValid.value &&
        isConfirmPasswordValid.value &&
        (value == password)) {
      Future.delayed(Duration.zero, () {
        btnEnabled.value = true;
      });
    }

    if (value != password) {
      Future.delayed(Duration.zero, () {
        btnEnabled.value = false;
      });
      return "\u24D8 Password not matched";
    }

    return null;
  }

  void checkPassword() {
    isPasswordValid.value = passwordFormKey.currentState!.validate();
    if (!isPasswordValid.value) {
      btnEnabled.value = false;
    } else {
      passwordFormKey.currentState!.save();
    }

    isConfirmPasswordValid.value = passwordFormKey.currentState!.validate();
    if (!isPasswordValid.value) {
      btnEnabled.value = false;
    } else {
      confirmPasswordFormKey.currentState!.save();
    }
    if (isPasswordValid.value == isConfirmPasswordValid.value) {
      passwordController.clear();
      confirmPasswordController.clear();
    }
  }
}
