import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgt_owner/feature/More/roles_&_permissions/add_role/view/add_role.dart';
import 'package:sgt_owner/feature/More/roles_&_permissions/role_&_permission_details/view/role_&_permission_details.dart';
import 'package:sgt_owner/feature/More/roles_&_permissions/roles_&_permissions/controller/roles_and_permission_controller.dart';
import 'package:sgt_owner/shared/widgets/custom_appbar.dart';
import 'package:sgt_owner/shared/widgets/custom_bottomsheet.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';

class RolesAndPermissionsScreen extends StatefulWidget {
  const RolesAndPermissionsScreen({super.key});

  @override
  State<RolesAndPermissionsScreen> createState() => _RolesAndPermissionsScreenState();
}

class _RolesAndPermissionsScreenState extends State<RolesAndPermissionsScreen> {
  final controller = Get.put(RolesAndPermissionsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: CustomAppBar(
        titleText: 'Roles & Permission',
        isLeading: true,
      ),
        body: SingleChildScrollView(
            padding: EdgeInsets.all(16.0.h),
            physics: const BouncingScrollPhysics(),
            child: buildTotalRoles()),
      );
  }

  Widget buildTotalRoles() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
                text: TextSpan(
                    text: "Total Roles",
                    style: AppFontStyle.semiboldTextStyle(
                        AppColors.textColor, 16.sp),
                    children: [
                  TextSpan(
                      text: " (40)",
                      style: AppFontStyle.semiboldTextStyle(
                          AppColors.grayColor, 16))
                ])),
            GestureDetector(
              onTap: () {
                Get.to(() => AddRole());
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 25.w,
                    child: IconButton(
                      style: IconButton.styleFrom(
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                      padding: EdgeInsets.zero,
                      alignment: Alignment.centerRight,
                      onPressed: () {
                        // showModalFilter();
                      },
                      icon: const Icon(Icons.add),
                      color: AppColors.primaryColor,
                    ),
                  ),
                  Text(
                    'Add New Role',
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 16.h,
        ),
        buildRoleCardList()
      ],
    );
  }

  Widget buildRoleCardList() {
    return Obx(
      () => ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: controller.roleStatus.length,
          itemBuilder: (BuildContext context, int index) {
            return buildRoleCard(index);
          }),
    );
  }

  Widget buildRoleCard(int index) {
    return GestureDetector(
      onTap: () {
        Get.to(() => RoleName(),
            arguments: {"isActive": controller.roleStatus[index]});
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
        elevation: 2.h,
        margin: EdgeInsets.only(bottom: 8.h),
        surfaceTintColor: AppColors.white,
        shadowColor: AppColors.secondaryColor,
        child: Padding(
          padding: EdgeInsets.all(12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => RichText(
                        text: TextSpan(
                            text: "Role Name ${index + 1}",
                            style: AppFontStyle.semiboldTextStyle(
                                AppColors.primaryColor, 16.sp),
                            children: [
                          controller.roleStatus[index] == true
                              ? TextSpan(
                                  text: " (Active)",
                                  style: AppFontStyle.semiboldTextStyle(
                                      AppColors.greenColor, 16))
                              : TextSpan(
                                  text: " (Inactive)",
                                  style: AppFontStyle.semiboldTextStyle(
                                      AppColors.redColor, 16))
                        ])),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 25.w,
                        child: IconButton(
                          style: IconButton.styleFrom(
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                          padding: EdgeInsets.zero,
                          alignment: Alignment.centerRight,
                          onPressed: () {
                            showModalRoleStatus(index);
                          },
                          icon: Icon(
                            Icons.more_vert,
                            size: 18.w,
                          ),
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              RichText(
                  text: TextSpan(
                      text: "Total Users:",
                      style: AppFontStyle.mediumTextStyle(
                          AppColors.textColor, 14.sp),
                      children: [
                    TextSpan(
                        text: " 01",
                        style: AppFontStyle.mediumTextStyle(
                            AppColors.primaryColor, 14.sp))
                  ])),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                      text: TextSpan(
                          text: "Creation Date:",
                          style: AppFontStyle.mediumTextStyle(
                              AppColors.textColor, 14.sp),
                          children: [
                        TextSpan(
                            text: " 09/08/2023",
                            style: AppFontStyle.mediumTextStyle(
                                AppColors.primaryColor, 14.sp))
                      ])),
                  Obx(
                    () => SizedBox(
                      width: 20.w,
                      child: controller.roleStatus[index] == true
                          ? Icon(
                              Icons.done_all,
                              size: 20.w,
                              color: AppColors.greenColor,
                            )
                          : Icon(
                              Icons.block,
                              size: 20.w,
                              color: AppColors.redColor,
                            ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future showModalRoleStatus(int index) {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return AppBottomSheet(
              child: Container(
            color: AppColors.white,
            child: Column(children: [
              SizedBox(
                height: 12.h,
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.only(top: 15.h, bottom: 16.h),
                  height: 48.h,
                  width: Get.width - 80.w,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: AppColors.grayColor,
                        width: 1.w,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RichText(
                          text: TextSpan(
                              text: "Role Status",
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400),
                              children: [
                            TextSpan(
                              text: "",
                              style: TextStyle(
                                  color: AppColors.secondaryColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600),
                            )
                          ])),
                      Obx(
                        () => SizedBox(
                          width: 50.w,
                          height: 30.h,
                          child: Switch.adaptive(
                              value: controller.roleStatus[index],
                              onChanged: (bool value) {
                                controller.roleStatus[index] = value;
                              }),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.only(top: 15.h, bottom: 16.h),
                  height: 48.h,
                  width: Get.width - 80.w,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: AppColors.grayColor,
                        width: 1.w,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RichText(
                          text: TextSpan(
                              text: "Delete",
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400),
                              children: [
                            TextSpan(
                              text: "",
                              style: TextStyle(
                                  color: AppColors.secondaryColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600),
                            )
                          ])),
                      IconButton(
                          padding: EdgeInsets.zero,
                          alignment: Alignment.centerRight,
                          onPressed: () {
                            _showDialogDeleteRole(index);
                            // Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.delete_outline_rounded,
                            color: AppColors.primaryColor,
                          )),
                    ],
                  ),
                ),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.only(top: 15.h, bottom: 16.h),
                  height: 48.h,
                  width: Get.width - 80.w,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: AppColors.grayColor,
                        width: 1.w,
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ));
        });
  }

  Future _showDialogDeleteRole(int index) async {
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
                    Text(
                      "Are you sure you want to delete this roles?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
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
                              Future.delayed(Duration(milliseconds: 500), () {
                                controller.roleStatus.removeAt(index);
                                // controller.roleStatus.removeWhere((element) =>
                                //     element == controller.roleStatus[index]);
                              });
                            },
                            child: Text(
                              "Delete",
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
