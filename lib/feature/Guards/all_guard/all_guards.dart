import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgt_owner/feature/Guards/all_guard/shared/view/add_new_guard_popup.dart';
import 'package:sgt_owner/feature/Guards/all_guard/shared/view/edit_profile_popup.dart';
import 'package:sgt_owner/style/colors.dart';

class AllGuards extends StatelessWidget {
  AllGuards({super.key});

  final List<Map<String, dynamic>> guardsData = [
    {
      "image": "assets/guard_1.png",
      "name": "Robinson",
    },
    {
      "image": "assets/guard_2.png",
      "name": "Morey M",
    },
    {
      "image": "assets/guard_3.png",
      "name": "Contra G4",
    },
    {
      "image": "assets/guard_4.png",
      "name": "Rock Johnson",
    },
    {
      "image": "assets/guard_5.png",
      "name": "Contra G4",
    },
    {
      "image": "assets/guard_2.png",
      "name": "Morey M",
    },
    {
      "image": "assets/guard_1.png",
      "name": "Robinson",
    },
    {
      "image": "assets/guard_5.png",
      "name": "Contra G4",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            },
          ),
          toolbarHeight: 63.h,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0.h),
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'All Guard',
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                  ),
                  AddNewGuardPopUp()
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              guardsCard()
            ],
          ),
        ),
    );
  }

  Widget guardsCard() {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: guardsData.length,
        itemBuilder: (context, index) {
          return card(index);
        });
  }

  Widget card(index) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
      margin: EdgeInsets.symmetric(vertical: 6.h, horizontal: 0),
      shadowColor: AppColors.grayColor,
      elevation: 2.h,
      surfaceTintColor: AppColors.white,
      child: ListTile(
        minVerticalPadding: 14.5.h,
        horizontalTitleGap: 12.w,
        contentPadding: EdgeInsets.only(left: 12.w),
        leading: Image.asset(
          guardsData[index]["image"],
          width: 53.w,
          height: 53.h,
        ),
        title: Text(
          guardsData[index]["name"],
          style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600),
        ),
        subtitle: RichText(
            text: TextSpan(
                text: "Position:",
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                    overflow: TextOverflow.ellipsis),
                children: [
              TextSpan(
                  text: " Supervisor",
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis))
            ])),
        trailing: const EditProfilePopUP(),
        // TextButton(
        //     style: TextButton.styleFrom(alignment: Alignment.centerRight),
        //     onPressed: () {},
        //     child: Image.asset(
        //       "assets/Vector-1.png",
        //       width: 2.5.w,
        //       height: 12.5.h,
        //     )),
        onTap: () {
          Get.toNamed("/GuardProfile");
        },
      ),
    );
  }
}
