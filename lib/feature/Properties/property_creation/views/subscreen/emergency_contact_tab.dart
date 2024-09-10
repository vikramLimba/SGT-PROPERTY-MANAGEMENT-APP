// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgt_owner/feature/Properties/property_creation/controller/emergency_contact_controller.dart';
import 'package:sgt_owner/shared/widgets/custom_buttons.dart';
import 'package:sgt_owner/shared/widgets/custom_textfield.dart';
import 'package:sgt_owner/shared/widgets/custom_underline.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';

class EmergencyContactWidgetTab extends StatefulWidget {
  const EmergencyContactWidgetTab({super.key});

  @override
  State<EmergencyContactWidgetTab> createState() =>
      _EmergencyContactWidgetTabState();
}

class _EmergencyContactWidgetTabState extends State<EmergencyContactWidgetTab> {
  final emergencyContactController = Get.put(EmergencyContactController());

  final _nameFocus = FocusNode();
  final _phoneFocus = FocusNode();
  var item1 = <int, Widget>{};
  var nameTEC1 = <int, TextEditingController>{};
  var mobileTEC1 = <int, TextEditingController>{};

  List<Widget> contactsList = [];

  @override
  void initState() {
    super.initState();
    newMethod(context, 0);
  }

  @override
  void dispose() {
    super.dispose();
    _nameFocus.dispose();
    _phoneFocus.dispose();
  }

  newMethod(BuildContext context, int index) {
    var nameController = TextEditingController();
    var mobileController = TextEditingController();
    nameTEC1.addAll({index: nameController});
    mobileTEC1.addAll({index: mobileController});
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            CustomUnderlineTextFieldWidget(
              textfieldTitle: 'Name',
              hintText: 'Name',
              controller: nameController,
            ),
            CustomUnderlineTextFieldWidget(
              textfieldTitle: 'Phone Number',
              hintText: 'Phone Number',
              keyboardType: TextInputType.number,
              controller: mobileController,
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Emergency Contact',
            style: AppFontStyle.semiboldTextStyle(AppColors.textColor, 16.sp),
          ),
          SizedBox(
            height: 4.h,
          ),
          Text(
            'Minimum 1 and Maximum 5 Contact can be add.',
            style: AppFontStyle.lightTextStyle(AppColors.secondaryColor, 12.sp),
          ),
          SizedBox(
            height: 12.h,
          ),
          Container(
              width: Get.width - 32.w,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.all(Radius.circular(6.r)),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.disableColor.withAlpha(50),
                      blurRadius: 1.0,
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 12.h,
                      ),
                      Column(
                        children: contactsList.length == 0
                            ? []
                            : [
                                Text(
                                  'Contact 1',
                                  style: AppFontStyle.semiboldTextStyle(
                                      AppColors.primaryColor, 16.sp),
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                              ],
                      ),
                      Form(
                        // key: emergencyContactController.nameFormKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: SignUpTextField(
                          controller: emergencyContactController.nameController,
                          label: RichText(
                              text: TextSpan(
                                  text: 'Name',
                                  style: AppFontStyle.lightTextStyle(
                                      AppColors.black, 14.sp),
                                  children: contactsList.length == 0
                                      ? [
                                          TextSpan(
                                              text: ' *',
                                              style: TextStyle(
                                                color: Colors.red,
                                              ))
                                        ]
                                      : [])),
                          maxWords: 25,
                          hintText: "Enter Name",
                          keyboardType: TextInputType.text,
                          focusNode: _nameFocus,
                          onSaved: (value) {
                            emergencyContactController.name = value!;
                          },
                          validator: (value) {
                            return emergencyContactController
                                .validateName(value!);
                          },
                          onTapOutside: (event) {
                            FocusScope.of(context).unfocus();
                          },
                          onFieldSubmitted: (value) {
                            FocusScope.of(context).requestFocus(_phoneFocus);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Form(
                        // key: emergencyContactController.phoneFormKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: AppTextField(
                          controller:
                              emergencyContactController.phoneController,
                          label: RichText(
                              text: TextSpan(
                                  text: 'Mobile Number',
                                  style: AppFontStyle.lightTextStyle(
                                      AppColors.black, 14.sp),
                                  children: contactsList.length == 0
                                      ? [
                                          TextSpan(
                                              text: ' *',
                                              style: TextStyle(
                                                color: Colors.red,
                                              ))
                                        ]
                                      : [])),
                          hintText: "Enter Mobile Number",
                          keyboardType: TextInputType.phone,
                          focusNode: _phoneFocus,
                          onSaved: (value) {
                            emergencyContactController.phone = value!;
                          },
                          validator: (value) {
                            return emergencyContactController
                                .validateNumber(value!);
                          },
                          onTapOutside: (event) {
                            FocusScope.of(context).unfocus();
                          },
                          onFieldSubmitted: (value) {
                            FocusScope.of(context).requestFocus(_nameFocus);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                    ]),
              )).paddingOnly(bottom: 16.h),
          Column(
            children: [
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: contactsList.length,
                  itemBuilder: (context, index) {
                    return contactCard(index);
                  }),
            ],
          ),
          AppButton(
              onTaps: contactsList.length < 4
                  ? () {
                      setState(() {
                        contactsList.add(contactCard(contactsList.length));
                      });
                    }
                  : null,
              backgoundColor: contactsList.length < 4
                  ? AppColors.black
                  : AppColors.disableColor,
              textColor: AppColors.white,
              titleText: "+ Add More Contact"),
          SizedBox(
            height: 16.h,
          ),
        ]);
  }

  Widget contactCard(index) {
    return Container(
        width: Get.width - 32.w,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.all(Radius.circular(6.r)),
            boxShadow: [
              BoxShadow(
                color: AppColors.disableColor.withAlpha(50),
                blurRadius: 1.0,
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Contact ${index + 2}',
                          style: AppFontStyle.semiboldTextStyle(
                              AppColors.primaryColor, 16.sp),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                      ],
                    ),
                    TextButton(
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            alignment: Alignment.topCenter,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                        onPressed: () {
                          _showDialogDeleteRoute(index);
                          // setState(() {
                          //   if (index >= 0 && index <= contactsList.length) {
                          //     contactsList.removeAt(index);
                          //   }
                          // });
                        },
                        child: Text(
                          "Remove",
                          style: AppFontStyle.semiboldTextStyle(
                              AppColors.redColor, 14.sp),
                        )).paddingOnly(top: 5.h)
                  ],
                ),
                Form(
                  // key: emergencyContactController.nameFormKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: SignUpTextField(
                    controller: emergencyContactController.nameController,
                    label: RichText(
                        text: TextSpan(
                            text: 'Name',
                            style: AppFontStyle.lightTextStyle(
                                AppColors.black, 14.sp),
                            children: [
                          TextSpan(
                              text: '',
                              style: TextStyle(
                                color: Colors.red,
                              ))
                        ])),
                    maxWords: 25,
                    hintText: "Enter Name",
                    keyboardType: TextInputType.text,
                    focusNode: _nameFocus,
                    onSaved: (value) {
                      emergencyContactController.name = value!;
                    },
                    validator: (value) {
                      return emergencyContactController.validateName(value!);
                    },
                    onTapOutside: (event) {
                      FocusScope.of(context).unfocus();
                    },
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).requestFocus(_phoneFocus);
                    },
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: AppTextField(
                    controller: emergencyContactController.phoneController,
                    label: RichText(
                        text: TextSpan(
                            text: 'Mobile Number',
                            style: AppFontStyle.lightTextStyle(
                                AppColors.black, 14.sp),
                            children: [
                          TextSpan(
                              text: '',
                              style: TextStyle(
                                color: Colors.red,
                              ))
                        ])),
                    hintText: "Enter Mobile Number",
                    keyboardType: TextInputType.phone,
                    focusNode: _phoneFocus,
                    onSaved: (value) {
                      emergencyContactController.phone = value!;
                    },
                    validator: (value) {
                      return emergencyContactController.validateNumber(value!);
                    },
                    onTapOutside: (event) {
                      FocusScope.of(context).unfocus();
                    },
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).requestFocus(_nameFocus);
                    },
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemCount: item1.length,
                        itemBuilder: (context, index) {
                          return item1.values.elementAt(index);
                        }),
                  ],
                ),
              ]),
        )).paddingOnly(bottom: 16.h);
  }

  Future _showDialogDeleteRoute(int index) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            insetPadding: EdgeInsets.all(15.h),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(6.r)),
              height: 150.h,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22.w),
                      child: Text(
                          "Are you sure you want to delete this contact?",
                          textAlign: TextAlign.center,
                          style: AppFontStyle.mediumTextStyle(
                              AppColors.textColor, 14.sp)),
                    ),
                    SizedBox(
                      height: 35.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                fixedSize: Size(127.w, 35.h),
                                side: const BorderSide(
                                    color: AppColors.primaryColor),
                                surfaceTintColor: AppColors.white,
                                backgroundColor: AppColors.white,
                                foregroundColor: AppColors.primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.r))),
                            onPressed: () {
                              Navigator.pop(context);
                              setState(() {
                                if (index >= 0 &&
                                    index <= contactsList.length) {
                                  contactsList.removeAt(index);
                                }
                              });
                            },
                            child: Text(
                              "Remove",
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.w600),
                            )),
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                minimumSize: Size(130.w, 35.h),
                                side: const BorderSide(
                                    color: AppColors.primaryColor),
                                surfaceTintColor: AppColors.white,
                                backgroundColor: AppColors.primaryColor,
                                foregroundColor: AppColors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.r))),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.w600),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
