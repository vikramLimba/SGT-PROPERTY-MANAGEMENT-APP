import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgt_owner/feature/More/roles_&_permissions/add_role/controller/add_role_controller.dart';
import 'package:sgt_owner/shared/widgets/custom_appbar.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';

class AddRole extends StatefulWidget {
  const AddRole({super.key});

  @override
  State<AddRole> createState() => _AddRoleState();
}

class _AddRoleState extends State<AddRole> {
  bool isTrue = true;
  final controller = Get.put(AddRoleController());

  List roleList = [
    {
      "boxVisible": false,
      "title": "Manage Property",
      "roleType": [
        {"name": "Create", "value": true},
        {"name": "Read", "value": true},
        {"name": "Update", "value": true},
        {"name": "Delete", "value": true},
      ]
    },
    {
      "boxVisible": false,
      "title": "Manage Guards",
      "roleType": [
        {"name": "Create", "value": true},
        {"name": "Read", "value": true},
        {"name": "Update", "value": true},
        {"name": "Delete", "value": true},
      ]
    },
    {
      "boxVisible": false,
      "title": "Reports",
      "roleType": [
        {"name": "Create", "value": true},
        {"name": "Read", "value": true},
        {"name": "Update", "value": true},
        {"name": "Delete", "value": true},
      ]
    },
    {
      "boxVisible": false,
      "title": "Manage Shifts",
      "roleType": [
        {"name": "Create", "value": true},
        {"name": "Read", "value": true},
        {"name": "Update", "value": true},
        {"name": "Delete", "value": true},
      ]
    },
    {
      "boxVisible": false,
      "title": "Manage Checkpoint",
      "roleType": [
        {"name": "Create", "value": true},
        {"name": "Read", "value": true},
        {"name": "Update", "value": true},
        {"name": "Delete", "value": true},
      ]
    },
    {
      "boxVisible": false,
      "title": "Manage Routes",
      "roleType": [
        {"name": "Create", "value": true},
        {"name": "Read", "value": true},
        {"name": "Update", "value": true},
        {"name": "Delete", "value": true},
      ]
    },
    {
      "boxVisible": false,
      "title": "Role and Permission",
      "roleType": [
        {"name": "Create", "value": true},
        {"name": "Read", "value": true},
        {"name": "Update", "value": true},
        {"name": "Delete", "value": true},
      ]
    },
    {
      "boxVisible": false,
      "title": "Staff Management",
      "roleType": [
        {"name": "Create", "value": true},
        {"name": "Read", "value": true},
        {"name": "Update", "value": true},
        {"name": "Delete", "value": true},
      ]
    },
    {
      "boxVisible": false,
      "title": "Time Sheet",
      "roleType": [
        {"name": "Create", "value": true},
        {"name": "Read", "value": true},
        {"name": "Update", "value": true},
        {"name": "Delete", "value": true},
      ]
    },
    {
      "boxVisible": false,
      "title": "Manage Leaves",
      "roleType": [
        {"name": "Create", "value": true},
        {"name": "Read", "value": true},
        {"name": "Update", "value": true},
        {"name": "Delete", "value": true},
      ]
    },
    {
      "boxVisible": false,
      "title": "Guard Attendance",
      "roleType": [
        {"name": "Create", "value": true},
        {"name": "Read", "value": true},
        {"name": "Update", "value": true},
        {"name": "Delete", "value": true},
      ]
    },
    {
      "boxVisible": false,
      "title": "Active Log",
      "roleType": [
        {"name": "Create", "value": true},
        {"name": "Read", "value": true},
        {"name": "Update", "value": true},
        {"name": "Delete", "value": true},
      ]
    },
    {
      "boxVisible": false,
      "title": "Settings",
      "roleType": [
        {"name": "Create", "value": true},
        {"name": "Read", "value": true},
        {"name": "Update", "value": true},
        {"name": "Delete", "value": true},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: CustomAppBar(
        titleText: 'Add Role',
        isLeading: true,
      ),
        body: SingleChildScrollView(
            padding: EdgeInsets.all(16.0.h),
            physics: const BouncingScrollPhysics(),
            child: buildRoleName()),
      );
  }

  Widget buildRoleName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Role',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
            Row(
              children: [
                Text('Inactive',
                    style:
                        AppFontStyle.regularTextStyle(AppColors.textColor, 16)),
                SizedBox(
                  width: 50.w,
                  height: 30.h,
                  child: Switch.adaptive(
                      value: isTrue,
                      onChanged: (bool value) {
                        setState(() {
                          isTrue = value;
                        });
                      }),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 24.h,
        ),
        buildRoleNameTextField(),
        SizedBox(
          height: 15.h,
        ),
        Text(
          'Permission',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 15.h,
        ),
        buildRoleNameCardList(),
        SizedBox(
          height: 16.h,
        ),
        SizedBox(
            height: 47.h,
            width: MediaQuery.of(context).size.width,
            child: Obx(
              () => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.r)),
                      backgroundColor: (!controller.btnEnable.value)
                          ? AppColors.disableColor
                          : AppColors.primaryColor,
                      foregroundColor: AppColors.white),
                  onPressed: controller.btnEnable.value
                      ? () {
                          controller.checkValidation();
                        }
                      : null,
                  child: Text(
                    "Save",
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                  )),
            )),
      ],
    );
  }

  Widget buildRoleNameCardList() {
    return ListView.builder(
        padding: EdgeInsets.zero,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: roleList.length,
        itemBuilder: (context, index) {
          return card(index);
        });
  }

  Widget card(int cardIndex) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
      elevation: 0.5.h,
      margin: EdgeInsets.only(bottom: 8.h),
      color: AppColors.white,
      surfaceTintColor: AppColors.white,
      shadowColor: AppColors.secondaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 12.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      roleList[cardIndex]["title"],
                      style: TextStyle(
                          color: AppColors.textColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                    height: 20.h,
                    child: IconButton(
                        style: IconButton.styleFrom(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                        alignment: Alignment.center,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            if (roleList[cardIndex]["boxVisible"] == false) {
                              roleList[cardIndex]["boxVisible"] = true;
                            } else {
                              roleList[cardIndex]["boxVisible"] = false;
                            }
                          });
                        },
                        icon: roleList[cardIndex]["boxVisible"] == true
                            ? const Icon(
                                Icons.expand_less,
                              )
                            : const Icon(
                                Icons.expand_more,
                              )))
              ],
            ),
          ),
          PhysicalModel(
            color: AppColors.white,
            elevation: 4.h,
            shadowColor: AppColors.secondaryColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5.r),
                bottomRight: Radius.circular(5.r)),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 12.w),
              child: Visibility(
                  visible: roleList[cardIndex]["boxVisible"],
                  // isTrueList[cardIndex],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.builder(
                          clipBehavior: Clip.none,
                          padding: EdgeInsets.zero,
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: roleList[cardIndex]["roleType"].length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: CheckboxListTile(
                                  contentPadding: EdgeInsets.zero,
                                  activeColor: AppColors.primaryColor,
                                  // tileColor: AppColors.primaryColor,
                                  title: Text(
                                    roleList[cardIndex]["roleType"][index]
                                        ["name"],
                                    style: AppFontStyle.mediumTextStyle(
                                        AppColors.textColor, 16.sp),
                                  ),
                                  value: roleList[cardIndex]["roleType"][index]
                                      ["value"],
                                  onChanged: (value) {
                                    setState(() {
                                      roleList[cardIndex]["roleType"][index]
                                          ["value"] = value!;
                                    });
                                  }),
                            );
                          }),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRoleNameTextField() {
    return Form(
      key: controller.roleNameFormKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: TextFormField(
        style: TextStyle(
            color: AppColors.textColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500),
        controller: controller.roleNameController,
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 13.h, horizontal: 10.w),
            hintText: "Role Name",
            hintStyle: TextStyle(
                color: AppColors.textColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromRGBO(216, 216, 220, 1), width: 1)),
            label: RichText(
                text: TextSpan(
                    text: "Role Name",
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w300,
                        color: AppColors.grayColor),
                    children: const [
                  TextSpan(text: "", style: TextStyle(color: Colors.red))
                ])),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.disableColor)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.grayColor),
                borderRadius: BorderRadius.circular(5.r))),
        onChanged: (value) {
          controller.roleName = value;
        },
        validator: (value) {
          return controller.validateRoleName(value!);
        },
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
      ),
    );
  }
}
