// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sgt_owner/feature/Properties/property_creation/controller/property_detail_controller.dart';
import 'package:sgt_owner/feature/Properties/property_creation/controller/property_imagepicker_controller.dart';
import 'package:sgt_owner/shared/widgets/custom_bottomsheet.dart';
import 'package:sgt_owner/shared/widgets/custom_textfield.dart';
import 'package:sgt_owner/style/colors.dart';
import 'package:sgt_owner/style/font_style.dart';

class PropertyWidgetTab extends StatefulWidget {
  const PropertyWidgetTab({
    super.key,
  });

  @override
  State<PropertyWidgetTab> createState() => _PropertyWidgetTabState();
}

class _PropertyWidgetTabState extends State<PropertyWidgetTab> {
  final propertyDetailController = Get.put(PropertyDetailController());
  // NewConfirmController pCTRL = Get.put(NewConfirmController());

  PropertyImagePickerController imgController =
      Get.put(PropertyImagePickerController());

  final _propertyNameFocus = FocusNode();
  final _propertyTypeFocus = FocusNode();
  final _asstManagerFocus = FocusNode();
  final _propertyAreaFocus = FocusNode();
  final _propertyDescriptionFocus = FocusNode();
  final _uploadImageFocus = FocusNode();

  String? selectedPropertyType;
  String? selectedAsstManager;

  List<String> asstManager = [
    "Lorri Warf",
    "Laura",
    "Warf",
    "Lorri",
    "Wauri",
  ];

  List<String> propertyType = [
    "Residential Property",
    "Commercial Property",
    "Healthcare Property",
    "Educational Property",
    "Office Property",
    "Hotel Property",
    "Government Property",
    "Financial Property",
    "Other Property",
  ];

  @override
  void dispose() {
    super.dispose();
    _propertyNameFocus.dispose();
    _asstManagerFocus.dispose();
    _propertyAreaFocus.dispose();
    _propertyDescriptionFocus.dispose();
    _uploadImageFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Center(
              child: Container(
                width: Get.width - 32.w,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(Radius.circular(6.r)),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.disableColor.withAlpha(50),
                        blurRadius: 1.0,
                      )
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        'Property Details',
                        style: AppFontStyle.semiboldTextStyle(
                            AppColors.textColor, 16.sp),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Form(
                        key: propertyDetailController.propertyNameFormKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: SignUpTextField(
                          controller:
                              propertyDetailController.propertyNameController,
                          label: RichText(
                              text: TextSpan(
                                  text: 'Property Name',
                                  style: AppFontStyle.lightTextStyle(
                                      AppColors.black, 14.sp),
                                  children: const [
                                TextSpan(
                                    text: ' *',
                                    style: TextStyle(
                                      color: Colors.red,
                                    ))
                              ])),
                          maxWords: 24,
                          hintText: "Enter Property Name",
                          keyboardType: TextInputType.text,
                          focusNode: _propertyNameFocus,
                          onSaved: (value) {
                            propertyDetailController.propertyName = value!;
                          },
                          validator: (value) {
                            return propertyDetailController
                                .validatePropertyName(value!);
                          },
                          onTapOutside: (event) {
                            FocusScope.of(context).unfocus();
                          },
                          onFieldSubmitted: (value) {
                            FocusScope.of(context)
                                .requestFocus(_propertyTypeFocus);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Form(
                        key: propertyDetailController.propertyTypeFormKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: buildDropdown(
                            RichText(
                                text: TextSpan(
                                    text: 'Property Type',
                                    style: AppFontStyle.lightTextStyle(
                                        AppColors.black, 14.sp),
                                    children: const [
                                  TextSpan(
                                      text: ' *',
                                      style: TextStyle(
                                        color: Colors.red,
                                      ))
                                ])),
                            propertyType, (value) {
                          setState(() {
                            selectedPropertyType = value;
                          });
                        }, _propertyTypeFocus, _asstManagerFocus),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Form(
                        key: propertyDetailController.asstManagerFormKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: buildDropdown(
                            RichText(
                                text: TextSpan(
                                    text: 'Assign Manager',
                                    style: AppFontStyle.lightTextStyle(
                                        AppColors.black, 14.sp),
                                    children: const [
                                  TextSpan(
                                      text: ' *',
                                      style: TextStyle(
                                        color: Colors.red,
                                      ))
                                ])),
                            asstManager, (value) {
                          setState(() {
                            selectedAsstManager = value;
                          });
                        }, _asstManagerFocus, _propertyAreaFocus),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Form(
                        key: propertyDetailController.propertyAreaFormKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: AppTextField(
                          controller:
                              propertyDetailController.propertyAreaController,
                          label: RichText(
                              text: TextSpan(
                                  text: 'Property Area',
                                  style: AppFontStyle.lightTextStyle(
                                      AppColors.black, 14.sp),
                                  children: const [
                                TextSpan(
                                    text: ' *',
                                    style: TextStyle(
                                      color: Colors.red,
                                    ))
                              ])),
                          hintText: "Enter Area in Sq.ft.",
                          keyboardType: TextInputType.number,
                          focusNode: _propertyAreaFocus,
                          onSaved: (value) {
                            propertyDetailController.propertyArea = value!;
                          },
                          validator: (value) {
                            return propertyDetailController
                                .validatePropertyArea(value!);
                          },
                          onTapOutside: (event) {
                            FocusScope.of(context).unfocus();
                          },
                          onFieldSubmitted: (value) {
                            FocusScope.of(context)
                                .requestFocus(_propertyDescriptionFocus);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Form(
                        key:
                            propertyDetailController.propertyDescriptionFormKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: SignUpTextField(
                          controller: propertyDetailController
                              .propertyDescriptionController,
                          label: RichText(
                              text: TextSpan(
                                  text: 'Property Description',
                                  style: AppFontStyle.lightTextStyle(
                                      AppColors.black, 14.sp),
                                  children: const [
                                TextSpan(
                                    text: ' *',
                                    style: TextStyle(
                                      color: Colors.red,
                                    ))
                              ])),
                          maxWords: 1000,
                          maxLines: 8,
                          hintText: "Enter Property description here...",
                          keyboardType: TextInputType.multiline,
                          focusNode: _propertyDescriptionFocus,
                          onSaved: (value) {
                            propertyDetailController.propertyDescription =
                                value!;
                          },
                          validator: (value) {
                            return propertyDetailController
                                .validatePropertyDescription(value!);
                          },
                          onTapOutside: (event) {
                            FocusScope.of(context).unfocus();
                          },
                          onFieldSubmitted: (value) {
                            FocusScope.of(context)
                                .requestFocus(_uploadImageFocus);
                          },
                        ),

                        //     TextField(
                        //   maxLines: 8, //or null
                        //   decoration: InputDecoration.collapsed(
                        //       hintText: "Enter Property Description Here..."),
                        // ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            AddPropertyImage(imgController: imgController),
          ],
        ),
        SizedBox(
          height: 24.h,
        ),
      ],
    );
  }

  Widget buildDropdown(
      RichText label, List<String> items, onChanged, focusNode, nextFocus) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField(
          focusColor: AppColors.primaryColor,
          value: items.contains(selectedPropertyType)
              ? selectedPropertyType
              : null,
          onChanged: onChanged,
          focusNode: focusNode,
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          decoration: InputDecoration(
            label: label,
            enabledBorder: OutlineInputBorder( borderSide: BorderSide(color:AppColors.disableColor))
          ),
          validator: (value) {
            return propertyDetailController.validatePropertyType(value!);
          },
          onSaved: (newValue) {
            FocusScope.of(context).requestFocus(nextFocus);
          },
        )
        // onTapOutside: (event) {
        //                     FocusScope.of(context).unfocus();
        //                   },
        // onFieldSubmitted: (value) {
        //                     FocusScope.of(context)
        //                         .requestFocus(_uploadImageFocus);
        //                   },,
      ],
    );
  }
}

class AddPropertyImage extends StatelessWidget {
  const AddPropertyImage({
    super.key,
    required this.imgController,
  });

  final PropertyImagePickerController imgController;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Obx(() => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Property Image',
                style:
                    AppFontStyle.semiboldTextStyle(AppColors.textColor, 16.sp),
              ),
              SizedBox(
                height: 12.h,
              ),
              Center(
                child: Container(
                  width: Get.width - 32.w,
                  height: 113.h,
                  child: imgController.selectedImagePath.value == ""
                      ? GestureDetector(
                          onTap: () {
                            showImagePicker(context);
                          },
                          child: DottedBorder(
                            radius: Radius.circular(10.r),
                            color: AppColors.secondaryColor,
                            strokeWidth: 1.w,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.upload,
                                    color: AppColors.primaryColor,
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Text(
                                    'Browse Image',
                                    style: AppFontStyle.regularTextStyle(
                                        AppColors.primaryColor, 12.sp),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : Image.file(
                          File(imgController.selectedImagePath.value),
                          fit: BoxFit.fill,
                          width: 343.w,
                          height: 178.h,
                        ),
                ),
              ),
              SizedBox(
                height: 6.h,
              ),
              Text(
                'Maximum 10 images of property can be uploaded, maximum size of image should be 2 MB and in JPG or PNG format.',
                style: AppFontStyle.lightTextStyle(
                    AppColors.secondaryColor, 12.sp),
              ),
            ],
          )),
    ]);
  }

  void showImagePicker(BuildContext context) {
    showModalBottomSheet<int>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return AppBottomSheet(
          child: Container(
            color: AppColors.white,
            child: Column(children: [
              SizedBox(
                height: 20.h,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  imgController.getImage(ImageSource.camera);
                },
                child: Center(
                  child: Container(
                    padding: EdgeInsets.only(top: 15.h, bottom: 16.h),
                    height: 48.h,
                    width: Get.width - 80,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppColors.grayColor,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Take Photo',
                          style: AppFontStyle.regularTextStyle(
                              AppColors.textColor, 14.sp),
                        ),
                        Icon(
                          Entypo.camera,
                          color: AppColors.primaryColor,
                          size: 22,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  imgController.getImage(ImageSource.gallery);
                },
                child: Center(
                  child: Container(
                    padding: EdgeInsets.only(top: 15.h, bottom: 16.h),
                    height: 48.h,
                    width: Get.width - 80,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppColors.grayColor,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Choose Photo',
                          style: AppFontStyle.regularTextStyle(
                              AppColors.textColor, 14.sp),
                        ),
                        Icon(
                          FontAwesome5.images,
                          color: AppColors.primaryColor,
                          size: 22,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (imgController.selectedImagePath.value != "")
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    Get.dialog(
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
                                        "Are you sure you want to delete this profile picture ?",
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
                                                  minimumSize: Size(0, 35.h),
                                                  backgroundColor:
                                                      AppColors.white,
                                                  foregroundColor:
                                                      AppColors.primaryColor,
                                                  textStyle: AppFontStyle
                                                      .semiboldTextStyle(
                                                          AppColors
                                                              .primaryColor,
                                                          16.sp),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6.r),
                                                    side: BorderSide(
                                                      color: AppColors
                                                          .primaryColor,
                                                      width: 1.0,
                                                    ),
                                                  )),
                                              onPressed: () {
                                                imgController.selectedImagePath
                                                    .value = "";
                                                Get.back();
                                              },
                                              child: Text(
                                                'Delete',
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 10.w),
                                          Expanded(
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                minimumSize: Size(0, 35.h),
                                                backgroundColor:
                                                    AppColors.primaryColor,
                                                textStyle: AppFontStyle
                                                    .semiboldTextStyle(
                                                        AppColors.white, 16.sp),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6.r),
                                                ),
                                              ),
                                              onPressed: () {
                                                Get.back();
                                              },
                                              child: const Text(
                                                'Cancel',
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
                  },
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.only(top: 15.h, bottom: 16.h),
                      height: 48.h,
                      width: Get.width - 80,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: AppColors.grayColor,
                            width: 1,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Delete Photo',
                            style: AppFontStyle.regularTextStyle(
                                AppColors.textColor, 14.sp),
                          ),
                          Icon(
                            Icons.delete_outline,
                            color: AppColors.primaryColor,
                            size: 26,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              Center(
                child: Container(
                  padding: EdgeInsets.only(top: 15.h, bottom: 16.h),
                  height: 48.h,
                  width: Get.width - 80,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: AppColors.grayColor,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        );
      },
    );
  }
}

class GuardsListings extends StatefulWidget {
  const GuardsListings({super.key});

  @override
  State<GuardsListings> createState() => _GuardsListingsState();
}

class _GuardsListingsState extends State<GuardsListings> {
  List<bool> checkBox = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 120.h),
      child: Column(
        children: [
          Container(
            height: 350.h,
            child: GlowingOverscrollIndicator(
              color: AppColors.primaryColor,
              axisDirection: AxisDirection.down,
              child: RawScrollbar(
                minThumbLength: 40.h,
                thumbColor: AppColors.primaryColor,
                radius: Radius.circular(20),
                thickness: 5,
                child: guardCard(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget guardCard() {
    return ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: checkBox.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                setState(() {
                  checkBox[index] = true;
                });
                if (checkBox[index] == true) {
                  Navigator.pop(context);
                }
              },
              child: card(index));
        });
  }

  Widget card(index) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: SizedBox(
        height: 75.h,
        child: Card(
          margin: EdgeInsets.zero,
          surfaceTintColor: Colors.white,
          elevation: 2.h,
          shadowColor: AppColors.grayColor,
          color: checkBox[index] == true
              ? AppColors.primaryBackColor
              : AppColors.white,
          shape: const RoundedRectangleBorder(),
          child: Row(children: [
            RotatedBox(
              quarterTurns: (1),
              child: Container(
                height: 16.h,
                decoration: BoxDecoration(
                    color: checkBox[index] == true
                        ? AppColors.primaryColor
                        : AppColors.primaryBackColor),
                child: Center(
                  child: Text(
                    "Available",
                    style: TextStyle(
                        color: checkBox[index] == true
                            ? AppColors.white
                            : AppColors.primaryColor,
                        fontSize: 12.h,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 6.w),
              child: Image(
                  height: 55.h,
                  width: 55.w,
                  image: const AssetImage("assets/guard_image.png")),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Lorri Warf ${index + 1}",
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  RichText(
                      text: TextSpan(
                          text: "Email:",
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black),
                          children: [
                        TextSpan(
                            text: " Lorri201@gmail.com",
                            style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                overflow: TextOverflow.ellipsis))
                      ])),
                  SizedBox(
                    height: 2.h,
                  ),
                  RichText(
                      text: TextSpan(
                          text: "Phone Number:",
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black),
                          children: [
                        TextSpan(
                            text: " (920) 948-1722",
                            style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                overflow: TextOverflow.ellipsis))
                      ])),
                ],
              ),
            ),
            Padding(
              padding: Platform.isAndroid
                  ? EdgeInsets.all(14.w)
                  : EdgeInsets.all(0.w),
              child: Checkbox(
                  side: const BorderSide(color: AppColors.primaryColor),
                  value: checkBox[index],
                  activeColor: AppColors.primaryColor,
                  onChanged: (bool? newValue) {
                    setState(() {
                      Future.delayed(Duration.zero, () {
                        // Get.toNamed('/PropertiesPage',
                        //     arguments: {"selectedGuardsCard": card(index)});
                        Navigator.pop(context);
                      });

                      checkBox[index] = newValue!;
                    });
                  }),
            )
          ]),
        ),
      ),
    );
  }
}
