import 'package:flutter/material.dart';
import 'package:sgt_owner/style/colors.dart';

class CustomBottomModelSheet extends StatelessWidget {
  const CustomBottomModelSheet(
      {super.key, required this.cameraClick, required this.galleryClick});
  final VoidCallback cameraClick;
  final VoidCallback galleryClick;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 25),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Select Media From?',
            textScaleFactor: 1.0,
            style: TextStyle(fontSize: 16),
          ),
          const Text(
            'Use camera or select file from device gallery',
            textScaleFactor: 1.0,
            style: TextStyle(
                fontSize: 12, color: Color.fromARGB(255, 109, 109, 109)),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: cameraClick,
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: AppColors.grayColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        size: 30,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Camera',
                      textScaleFactor: 1.0,
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: galleryClick,
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.folder_open_outlined,
                        size: 30,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Gallery',
                      textScaleFactor: 1.0,
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
