// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:sgt_owner/style/colors.dart';
// import 'package:sgt_owner/style/font_style.dart';

// class MyThreeColorProgressValueColor extends AlwaysStoppedAnimation<Color> {
//   MyThreeColorProgressValueColor(double value)
//       : super(_getColor(value));

//   static Color _getColor(double value) {
//     if (value < 0.33) {
//       return AppColors.greenColor; // Color for the first third of the progress
//     } else if (value < 0.67) {
//       return AppColors.primaryColor; // Color for the second third of the progress
//     } else {
//       return AppColors.grayColor; // Color for the last third of the progress
//     }
//   }
// }

// class MyProgressPage extends StatefulWidget {
//   int? currentStep;
//   MyProgressPage({super.key, required this.currentStep});

//   @override
//   State<MyProgressPage> createState() => _MyProgressPageState();
// }

// class _MyProgressPageState extends State<MyProgressPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               buildStepWidget(0, "Shift"),
//               buildStepWidget(1, "Checkpoint"),
//               buildStepWidget(2, "Route"),
//               buildStepWidget(3, "AssignGuard"),
//             ],
//           ),
//           SizedBox(height: 16.h),
//           LinearProgressIndicator(
//             value:
//                 ((widget.currentStep != null ? widget.currentStep! : 0) + 1) /
//                     4, // Calculate the progress based on the current step
//             backgroundColor: AppColors.primaryBackColor,
//             valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
//             borderRadius: BorderRadius.all(Radius.elliptical(5.r, 5.r)),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildStepWidget(int stepNumber, String value) {
//     return Column(
//       children: [
//         Center(
//           child: Text(
//             value,
//             style: AppFontStyle.mediumTextStyle(
//                 (widget.currentStep != null ? widget.currentStep! : 0) > stepNumber
//                     ? AppColors.greenColor
//                     : (widget.currentStep != null ? widget.currentStep! : 0) ==
//                             stepNumber
//                         ? AppColors.primaryColor
//                         : (widget.currentStep != null ? widget.currentStep! : 0) <
//                                 stepNumber
//                             ? AppColors.grayColor
//                             : AppColors.grayColor,
//                 14.sp),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgt_owner/style/colors.dart';

class MyProgressPage extends StatefulWidget {
  final int currentIndex;
  const MyProgressPage({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  @override
  State<MyProgressPage> createState() => _MyProgressPageState();
}

class _MyProgressPageState extends State<MyProgressPage> {
  late final int _currentIndex = widget.currentIndex;
  final List<String> _pages = [
    " Shift ",
    "Checkpoint",
    " Route ",
    "Assign Guard"
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(_pages.length, (index) {
          final isCurrent = _currentIndex == index;

          final isRecent = index < _currentIndex;
          final color = isCurrent
              ? AppColors.primaryColor
              : isRecent
                  ? AppColors.greenColor
                  : AppColors.grayColor;
          // print("widget.currentIndex: ${widget.currentIndex}");
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  _pages[index],
                  style: TextStyle(color: color),
                ),
                SizedBox(height: 11.h),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                    color: color,
                  ),
                  width: _pages[index].length.toDouble().w * 9,
                  // width: _calculateProgressBarWidth(index),
                  height: 5.h,
                )
              ],
            ),
          );
        }),
      ),
    );
  }

  // double _calculateProgressBarWidth(int index) {
  //   switch (index) {
  //     case 0:
  //       return 58.w;
  //     case 1:
  //       return 70.w;
  //     case 2:
  //       return 58.w;
  //     case 3:
  //       return 89.w;
  //     default:
  //       return 0;
  //   }
  // }
}
