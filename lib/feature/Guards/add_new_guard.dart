import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';

class AddNewGuard extends StatelessWidget {
  const AddNewGuard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("All Guard",
                  style: AppFontStyle.semiboldTextStyle(
                    AppColors.black,
                    16.sp,
                  )
                  // TextStyle(
                  //   color: AppColors.black,
                  //   fontSize: 16.sp,
                  //   fontWeight: FontWeight.w600,
                  // ),
                  ),
              TextButton(
                  onPressed: () {
                    Get.toNamed('/GuardsPage');
                  },
                  child: Text(
                    "+Assign Duty",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ))
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                    height: 170.h, image: const AssetImage('assets/ang-1.png')),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  'No Guards Added',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        foregroundColor: AppColors.white,
                        shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(5.r)),
                        fixedSize: Size(190.w, 38.h)),
                    onPressed: () {
                      Get.toNamed('ProfilePage');
                    },
                    child: Text(
                      "+ Add New Guard",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
