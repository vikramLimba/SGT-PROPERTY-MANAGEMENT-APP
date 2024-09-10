import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgt_owner/feature/Messages/widgets/shared_items/tabs.dart/docs_tab.dart';
import 'package:sgt_owner/feature/Messages/widgets/shared_items/tabs.dart/links_tab.dart';
import 'package:sgt_owner/feature/Messages/widgets/shared_items/tabs.dart/media_tab.dart';
import 'package:sgt_owner/shared/widgets/custom_appbar.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';

class ShareItemsScreen extends StatefulWidget {
  const ShareItemsScreen({super.key});

  @override
  State<ShareItemsScreen> createState() => _ShareItemsScreenState();
}

class _ShareItemsScreenState extends State<ShareItemsScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          titleText: 'Shared Items',
          isLeading: true,
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 18.h),
                child: Center(
                  child: Container(
                    width: Get.width - 132.w,
                    decoration: BoxDecoration(
                      color: AppColors.disableColor.withOpacity(0.6),
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(5.r, 5.r)),
                    ),
                    child: Column(
                      children: [
                        TabBar(
                          labelPadding: EdgeInsets.symmetric(
                              horizontal: 0.w, vertical: 0.h),
                          // tabAlignment: TabAlignment.center,
                          labelStyle: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          unselectedLabelStyle: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          labelColor: Colors.white,
                          indicatorColor: Colors.transparent,
                          dividerColor: Colors.transparent,
                          padding: EdgeInsets.all(2.h),
                          isScrollable: false,
                          tabAlignment: TabAlignment.fill,
                          // padding: EdgeInsets.zero,
                          controller: _tabController,
                          // indicatorWeight: 2,
                          tabs: [
                            Tab(
                              child: Center(
                                child: Text(
                                  'Media',
                                  style: AppFontStyle.semiboldTextStyle(
                                      AppColors.textColor, 12.sp),
                                ),
                              ),
                            ),
                            Tab(
                              child: Center(
                                child: Text(
                                  'Links',
                                  style: AppFontStyle.semiboldTextStyle(
                                      AppColors.textColor, 12.sp),
                                ),
                              ),
                            ),
                            Tab(
                              child: Center(
                                child: Text(
                                  'Docs',
                                  style: AppFontStyle.semiboldTextStyle(
                                      AppColors.textColor, 12.sp),
                                ),
                              ),
                            ),
                          ],
                          // indicatorColor: Colors.transparent,
                          // labelColor: Colors.white,
                          unselectedLabelColor: Colors.black,
                          indicator: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(5.r),
                              color: AppColors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                child: TabBarView(controller: _tabController, children: [
                  const MediaTab(),
                  const LinksTab(),
                  const DocsTab(),
                ]),
              ),
            ]),
        bottomSheet: bottomSheet());
  }

  Widget bottomSheet() {
    return BottomSheet(
      elevation: 5.h,
      shadowColor: AppColors.black,
      enableDrag: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(0.0)),
      ),
      onClosing: () {},
      builder: (context) => Container(
        color: AppColors.white,
        height: 63.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 16.h,
              child: IconButton(
                  padding: EdgeInsets.zero,
                  alignment: Alignment.topCenter,
                  iconSize: 20.h,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.star_rate_rounded,
                    color: AppColors.primaryColor,
                  )),
            ),
            SizedBox(
              height: 16.h,
              child: IconButton(
                  padding: EdgeInsets.zero,
                  alignment: Alignment.topCenter,
                  iconSize: 20.h,
                  onPressed: () {
                    deletePopup();
                  },
                  icon: const Icon(
                    Icons.delete_outline_rounded,
                    color: AppColors.primaryColor,
                  )),
            )
          ],
        ),
      ),
    );
  }

  Future deletePopup() {
    return Get.dialog(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(5.r),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Material(
                  child: Column(
                    children: [
                      Text(
                        "Are you sure you want to delete this selection ?",
                        textAlign: TextAlign.center,
                        style: AppFontStyle.mediumTextStyle(
                            AppColors.textColor, 14.sp),
                      ),
                      SizedBox(height: 20.h),
                      //Buttons
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shadowColor: Colors.transparent,
                                  minimumSize: Size(0, 35.h),
                                  backgroundColor: AppColors.white,
                                  foregroundColor: AppColors.primaryColor,
                                  textStyle: AppFontStyle.semiboldTextStyle(
                                      AppColors.primaryColor, 16.sp),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.r),
                                    side: BorderSide(
                                      color: AppColors.primaryColor,
                                      width: 1.0.w,
                                    ),
                                  )),
                              onPressed: () {
                                setState(() {
                                  // isClear = true;
                                });
                                Get.back();
                              },
                              child: const Text(
                                'Delete',
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shadowColor: Colors.transparent,
                                minimumSize: Size(0, 35.h),
                                backgroundColor: AppColors.primaryColor,
                                textStyle: AppFontStyle.semiboldTextStyle(
                                    AppColors.white, 16.sp),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.r),
                                ),
                              ),
                              onPressed: () {
                                Get.back();
                              },
                              child: Text(
                                'Cancel',
                                style: AppFontStyle.semiboldTextStyle(
                                    AppColors.white, 16.sp),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
