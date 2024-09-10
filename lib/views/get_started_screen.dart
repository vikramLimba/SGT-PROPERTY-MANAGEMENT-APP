import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgt_owner/feature/authentication/Privacy_policy/privacy_policy.dart';
import 'package:sgt_owner/feature/authentication/Privacy_policy/terms_and_conditions.dart';
import 'package:sgt_owner/shared/widgets/custom_buttons.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';
import 'package:sgt_owner/views/welcome_screen.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Stack(alignment: Alignment.center, children: [
            Image(
              width: 200.w,
              height: 80.h,
              fit: BoxFit.fill,
              image: const AssetImage('assets/splash_4.png'),
            ),
            Positioned(
                bottom: 40.h,
                child: Column(
                  children: [
                    AppButton(
                      onTaps: () {
                        Get.toNamed("/welcome");
                      },
                      backgoundColor: AppColors.white,
                      textColor: AppColors.primaryColor,
                      titleText: 'Get Started',
                      isIcon: false,
                    ),
                    SizedBox(
                      height: 22.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(() => TermsAndConditions());
                          },
                          child: Text(
                            'Terms & Conditions | ',
                            style: AppFontStyle.semiboldTextStyle(
                                AppColors.white, 12.sp),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                             Get.to(() => PrivacyPolicy());
                          },
                          child: Text(
                            'Privacy Policy',
                            style: AppFontStyle.semiboldTextStyle(
                                AppColors.white, 12.sp),
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   height: 32.h,
                    // ),
                  ],
                )
                ),
          ]),
        ));
  }
}
