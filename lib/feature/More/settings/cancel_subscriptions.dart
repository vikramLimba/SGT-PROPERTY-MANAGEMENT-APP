import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgt_owner/shared/widgets/custom_appbar.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';

class CancelSubscription extends StatefulWidget {
  const CancelSubscription({super.key});

  @override
  State<CancelSubscription> createState() => _CancelSubscriptionState();
}

class _CancelSubscriptionState extends State<CancelSubscription> {
  final controller = TextEditingController();

  final passwordController = Get.put(PasswordControllerNew());
  final visibilityController = Get.put(VisibilityController());
  String formFieldvalue = "";

  final FocusNode _passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        titleText: "Cancel Subscription",
        isLeading: true,
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(16.h), child: cancelSubscription()),
    );
  }

  Widget cancelSubscription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Current Plan",
          style: AppFontStyle.semiboldTextStyle(AppColors.textColor, 16.sp),
        ),
        SizedBox(
          height: 16.h,
        ),
        Container(
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.all(Radius.circular(6.r))),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 16.h, left: 16.h, bottom: 8.h),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/piggyBank.png",
                      height: 24.h,
                      width: 24.w,
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    Text(
                      "Silver",
                      style: AppFontStyle.mediumTextStyle(
                          AppColors.textColor, 24.sp),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      "\$35/month",
                      style: AppFontStyle.regularTextStyle(
                          AppColors.primaryColor, 16.sp),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 1.h,
                color: AppColors.black,
              ),
              SizedBox(
                height: 18.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 6.h,
                    ),
                    Text(
                      "•",
                      style: AppFontStyle.regularTextStyle(
                          AppColors.textColor, 12.sp),
                    ),
                    SizedBox(
                      width: 6.h,
                    ),
                    Flexible(
                      child: Text(
                        "Cancellation will be effective at the end of your current plan.ie 15 August,",
                        style: AppFontStyle.regularTextStyle(
                            AppColors.textColor, 12.sp),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 6.h,
                    ),
                    Text(
                      "•",
                      style: AppFontStyle.regularTextStyle(
                          AppColors.textColor, 12.sp),
                    ),
                    SizedBox(
                      width: 6.h,
                    ),
                    Flexible(
                      child: Text(
                        "You profile, preferences, account details will be saved for 2 months, after that it will not be recoverable.",
                        style: AppFontStyle.regularTextStyle(
                            AppColors.textColor, 12.sp),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 3.h),
                      child: SizedBox(
                        height: 16.h,
                        width: 16.w,
                        child: Checkbox(
                            activeColor: AppColors.primaryColor,
                            value: true,
                            onChanged: (value) {
                              setState(() {});
                            }),
                      ),
                    ),
                    SizedBox(
                      width: 6.h,
                    ),
                    Flexible(
                      child: Text(
                        "I confirm that I am cancelling my subscription plan. I understand that my SGT membership will be terminated, and I will no longer be charged any future fees.",
                        textAlign: TextAlign.start,
                        style: AppFontStyle.regularTextStyle(
                            AppColors.textColor, 12.sp),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              passwordTextBox(),
              SizedBox(
                height: 36.h,
              ),
              buttons()
            ],
          ),
        ),
      ],
    );
  }

  Widget passwordTextBox() {
    return SizedBox(
      // height: 90.h,
      child: Obx(
        () => Form(
          key: passwordController.passwordFormKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: TextFormField(
              controller: passwordController.passwordController,
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 13.h, horizontal: 10.w),
                  hintText: "Enter Password",
                  hintStyle: TextStyle(
                      color: AppColors.grayColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(216, 216, 220, 1), width: 1)),
                  label: Text(
                    "Password",
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                        color: Colors.black87),
                  ),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.hintColor)),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColors.grayColor),
                      borderRadius: BorderRadius.circular(5.r)),
                  suffixIcon: IconButton(
                      iconSize: 22.w,
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        visibilityController.ishidden1.value =
                            !visibilityController.ishidden1.value;
                      },
                      icon: Icon(visibilityController.ishidden1.value
                          ? Icons.visibility_off
                          : Icons.visibility))),
              obscureText: visibilityController.ishidden1.value,
              onChanged: (value) {
                setState(() {
                  passwordController.password = value;
                  passwordController.checkPassword();
                });
              },
              validator: (value) {
                return passwordController.validatePassword(value!);
              },
              focusNode: _passwordFocus,
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget buttons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(160.w, 50.h),
                  shadowColor: Colors.transparent,
                  surfaceTintColor: Colors.transparent,
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(color: AppColors.primaryColor),
                      borderRadius: BorderRadius.circular(6.r))),
              onPressed: () {},
              child: Text(
                "Cancel",
                style: AppFontStyle.semiboldTextStyle(
                    AppColors.primaryColor, 16.sp),
              )),
        ),
        SizedBox(
          width: 12.w,
        ),
        Expanded(
          child: Obx(
            () => ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(160.w, 50.h),
                    shadowColor: Colors.transparent,
                    surfaceTintColor: Colors.transparent,
                    backgroundColor: !passwordController.btnEnabled.value
                        ? AppColors.disableColor
                        : AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.r))),
                onPressed: passwordController.btnEnabled.value
                    ? () {
                        Navigator.pop(context);
                      }
                    : null,
                child: Text(
                  "Finish",
                  style: AppFontStyle.semiboldTextStyle(AppColors.white, 16.sp),
                )),
          ),
        ),
      ],
    );
  }
}

class PasswordControllerNew extends GetxController {
  final GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();
  var password = "";
  RxBool isPasswordValid = false.obs;
  late TextEditingController passwordController;

  @override
  void onInit() {
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    passwordController.dispose();
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

    if (isPasswordValid.value) {
      Future.delayed(Duration.zero, () {
        btnEnabled.value = true;
      });
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
  }
}

class VisibilityController extends GetxController {
  RxBool ishidden1 = true.obs;
}
