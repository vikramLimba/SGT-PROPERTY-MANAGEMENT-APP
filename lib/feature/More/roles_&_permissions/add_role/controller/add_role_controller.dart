import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddRoleController extends GetxController {
  final GlobalKey<FormState> roleNameFormKey = GlobalKey<FormState>();

  late TextEditingController roleNameController;

  var roleName = '';

  RxBool isRoleNameValid = false.obs;
  RxBool btnEnable = false.obs;

  @override
  void onInit() {
    roleNameController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    roleNameController.dispose();
    super.onClose();
  }

  String? validateRoleName(value) {
    if (value == "") {
      Future.delayed(Duration.zero, () {
        btnEnable.value = false;
      });
      return "\u24D8  Role Name is required";
    }
    Future.delayed(Duration.zero, () {
      btnEnable.value = true;
    });
    return null;
  }

  void checkValidation() {
    isRoleNameValid.value = roleNameFormKey.currentState!.validate();
    if (!isRoleNameValid.value) {
      btnEnable.value = false;
    } else {
      roleNameFormKey.currentState!.save();
      // roleNameController.clear();
    }
  }
}
