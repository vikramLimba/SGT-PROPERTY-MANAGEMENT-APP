import 'package:flutter/material.dart';
import 'package:sgt_owner/style/colors.dart';


class DeleteDialog extends StatelessWidget {
  const DeleteDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            'Delete media?',
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              'Are you sure you want to delete this media?',
              textAlign: TextAlign.center,
              textScaleFactor: 1.0,
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Divider(
            height: 0,
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(color: AppColors.primaryColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      'Cencel',
                      textScaleFactor: 1.0,
                      style: TextStyle(
                          color: AppColors.primaryColor, fontSize: 15),
                    ),
                  ),
                ),
                SizedBox(
                  width: 70,
                ),
                Container(
                  height: 40,
                  width: 1,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  width: 65,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    border: Border.all(color: AppColors.primaryColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      'Delete',
                      textScaleFactor: 1.0,
                      style: TextStyle(color: AppColors.white, fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
