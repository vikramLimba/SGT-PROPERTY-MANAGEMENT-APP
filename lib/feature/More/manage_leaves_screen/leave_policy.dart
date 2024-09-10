import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgt_owner/feature/More/manage_leaves_screen/policy_updated_popup.dart';
import 'package:sgt_owner/shared/widgets/custom_buttons.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';

class LeavePolicyScreen extends StatefulWidget {
  String? page;
  
  var pageName;
  LeavePolicyScreen({super.key,this.pageName});

  @override
  State<LeavePolicyScreen> createState() => _LeavePolicyScreenState();
}

class _LeavePolicyScreenState extends State<LeavePolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
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
            "Leave Policy",
            style: AppFontStyle.semiboldTextStyle(AppColors.textColor, 16.sp),
          ),
          centerTitle: false,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GestureDetector(
               onTap: () {
                 Get.toNamed('/add_new_policy');
               }, 
                child: Row(
                  children: [
                    const Icon(
                      Icons.add,
                      color: AppColors.primaryColor,
                    ),
                    Text(
                      "Add New",
                      style: AppFontStyle.semiboldTextStyle(
                          AppColors.primaryColor, 16.sp),
                    ),
                  ],
                ),
              ),
            )
          ]),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Leave Policy",
                  style: AppFontStyle.semiboldTextStyle(
                      AppColors.textColor, 16.sp),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(LeavePolicyScreen(pageName: 'edit',));
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.edit,
                        color: AppColors.primaryColor,
                      ),
                      Text(
                        "Edit",
                        style: AppFontStyle.semiboldTextStyle(
                            AppColors.primaryColor, 16.sp),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: Get.width - 15.w,
            decoration: BoxDecoration(
              color: AppColors.primaryBackColor,
              borderRadius: BorderRadius.all(Radius.elliptical(5.r, 5.r)),
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.grey.withOpacity(0.5),
              //     spreadRadius: 5.r,
              //     blurRadius: 7.r,
              //     offset: Offset(0.w, 3.h), // changes position of shadow
              //   ),
              // ],
            ),
            margin: EdgeInsets.all(8.w),
            padding: EdgeInsets.all(8.w),
            child: Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.all(Radius.elliptical(5.r, 5.r)),
              ),
              child: Text(
                "Lorem ipsum dolor sit amet consectetur. Nunc in erat tempus sed tristique congue id auctor vestibulum. A ultrices dignissim tortor amet pellentesque vitae pellentesque. Fermentum mauris elit nam morbi. Phasellus eget felis aliquam tempor fringilla. At pellentesque neque nisi et ut malesuada sem eget massa. Fusce id et massa gravida ullamcorper gravida. Sed vel vitae vitae dictum tortor a gravida. Neque morbi diam suscipit volutpat. Egestas habitasse eu ac sit. Tincidunt quis fermentum aliquet phasellus amet tortor auctor vitae. Porta pharetra proin porttitor nisl sit. Nunc at curabitur consequat scelerisque neque sit. Quis ultrices hendrerit aliquet tristique velit turpis metus quam massa. A facilisis elementum tellus egestas potenti. Nibh faucibus elementum scelerisque diam.Lorem ipsum dolor sit amet consectetur. Nunc in erat tempus sed tristique congue id auctor vestibulum. A ultrices dignissim tortor amet pellentesque vitae pellentesque. Fermentum mauris elit nam morbi. Phasellus eget felis aliquam tempor fringilla. At pellentesque neque nisi et ut malesuada sem eget massa. Fusce id et massa gravida ullamcorper gravida. Sed vel vitae vitae dictum tortor a gravida. Neque morbi diam suscipit volutpat. Egestas habitasse eu ac sit. Tincidunt quis fermentum aliquet phasellus amet tortor auctor vitae. Porta pharetra proin porttitor nisl sit. Nunc at curabitur consequat scelerisque neque sit. Quis ultrices hendrerit aliquet tristique velit turpis metus quam massa. A facilisis elementum tellus egestas potenti. Nibh faucibus elementum scelerisque diam.",
                style: AppFontStyle.semiboldTextStyle(
                    AppColors.textColor.withOpacity(0.6), 12.sp),
              ),
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          widget.pageName=="edit" ?
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1.w,color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(7.r),),
                    fixedSize: Size.fromHeight(47.h),
                    foregroundColor: AppColors.primaryColor,
                    backgroundColor: AppColors.white,
                  ),
                  onPressed: () {
                    Get.dialog(LeavePolicyUpdatedDialog(status: 'delete'));
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 40.w, vertical: 8.h),
                    child: Text(
                      "Delete",
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
                  onPressed: () {
                    Get.dialog(LeavePolicyUpdatedDialog(status: 'update'));
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 40.w, vertical: 8.h),
                    child: Text(
                      "Update",
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w600),
                    ),
                  )),
            ],
          ): Container(),
        ],
      ),
    );
  }
}
