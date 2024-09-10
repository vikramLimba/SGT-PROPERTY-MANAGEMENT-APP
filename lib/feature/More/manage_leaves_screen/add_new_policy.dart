import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgt_owner/shared/widgets/custom_textfield.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';

class AddNewPolicyScreen extends StatefulWidget {
  const AddNewPolicyScreen({super.key});

  @override
  State<AddNewPolicyScreen> createState() => _AddNewPolicyScreenState();
}

class _AddNewPolicyScreenState extends State<AddNewPolicyScreen> {
  TextEditingController addPolicyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Add New Policy",
          style: AppFontStyle.semiboldTextStyle(AppColors.textColor, 16.sp),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 24.h),
            child: TextFormField(
              style: AppFontStyle.mediumTextStyle(AppColors.textColor, 14.sp),
              controller: addPolicyController,
              autofocus: true,
              maxLines: 8,
              decoration: InputDecoration(
                hintText: 'Please add Policy Details',
                hintStyle: AppFontStyle.regularTextStyle(
                    AppColors.secondaryColor, 14.sp),
                filled: true,
                fillColor: Colors.white,
                label: Text(
                  "Add Policy Details",
                  style:
                      AppFontStyle.lightTextStyle(AppColors.textColor, 12.sp),
                ),
                labelStyle:
                    AppFontStyle.regularTextStyle(AppColors.textColor, 12.sp),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 19.w, vertical: 8.h),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide:
                      const BorderSide(width: 1, color: AppColors.disableColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide:
                      const BorderSide(width: 1, color: AppColors.disableColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: const BorderSide(
                    color: AppColors.disableColor,
                    width: 1.0,
                  ),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  addPolicyController.text = value.toString();
                });
              },
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 24.h),
          //   child: AppTextField(
          //     controller: addPolicyController,
          //     labelText: "Add Policy Details",
          //     hintText: "Enter Policy Details",
          //     onChanged: (value) {
          //       setState(() {
          //         addPolicyController.text = value.toString();
          //       });
          //     },
          //     onTapOutside: (event) {
          //       FocusScope.of(context).unfocus();
          //     },
          //   ),
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      side:
                          BorderSide(width: 1.w, color: AppColors.primaryColor),
                      borderRadius: BorderRadius.circular(7.r),
                    ),
                    fixedSize: Size.fromHeight(47.h),
                    foregroundColor: AppColors.primaryColor,
                    backgroundColor: AppColors.white,
                  ),
                  onPressed: () {
                    Get.toNamed('LeavePolicyScreen');
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 34.w, vertical: 8.h),
                    child: Text(
                      "Discard",
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w600),
                    ),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.r)),
                    fixedSize: Size.fromHeight(47.h),
                    foregroundColor: AppColors.white,
                    backgroundColor: AppColors.primaryColor,
                  ),
                  onPressed: addPolicyController.text != ''
                      ? () {
                          Get.dialog(AddNewPolicyDialog());
                        }
                      : null,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 47.w, vertical: 8.h),
                    child: Text(
                      "Add",
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w600),
                    ),
                  )),
            ],
          )
        ],
      ),
    );
  }
}

class AddNewPolicyDialog extends StatefulWidget {
  AddNewPolicyDialog({
    super.key,
  });

  @override
  State<AddNewPolicyDialog> createState() => _AddNewPolicyDialogState();
}

class _AddNewPolicyDialogState extends State<AddNewPolicyDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(8.h),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(6.r)),
        height: 148.h,
        width: MediaQuery.of(context).size.width - 32.w,
        child: Padding(
          padding: EdgeInsets.all(8.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 60.w),
                child: Text(
                  "Leave policy added successfully?",
                  textAlign: TextAlign.center,
                  style: AppFontStyle.mediumTextStyle(
                      AppColors.primaryColor, 18.sp),
                ),
              ),
              SizedBox(height: 23.h),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.r)),
                    fixedSize: Size.fromHeight(47.h),
                    foregroundColor: AppColors.white,
                    backgroundColor: AppColors.primaryColor,
                  ),
                  onPressed: () {
                    Get.toNamed('LeavePolicyScreen');
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 35.w, vertical: 8.h),
                    child: Text(
                      "Done",
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w600),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
