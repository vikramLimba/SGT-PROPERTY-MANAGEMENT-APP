import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgt_owner/style/colors.dart';

class AssignDutyProgrssBar extends StatefulWidget {
  final int currentIndex;
  const AssignDutyProgrssBar({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  @override
  State<AssignDutyProgrssBar> createState() => _AssignDutyProgrssBarState();
}

class _AssignDutyProgrssBarState extends State<AssignDutyProgrssBar> {
  late final int _currentIndex = widget.currentIndex;
  final List<String> _pages = ["Guards", "Properties", "Route"];

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
                  ? AppColors.primaryColor
                  : AppColors.primaryColor.withOpacity(0.4);
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  _pages[index],
                  style: TextStyle(
                      color: color,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 11.h),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.r),
                      bottomRight: Radius.circular(5.r),
                    ),
                    color: color,
                  ),
                  width: _calculateProgressBarWidth(index),
                  height: 5.h,
                )
              ],
            ),
          );
        }),
      ),
    );
  }

  double _calculateProgressBarWidth(int index) {
    switch (index) {
      case 0:
        return 80.w;
      case 1:
        return 120.w;
      case 2:
        return 90.w;
      default:
        return 0.w;
    }
  }
}
