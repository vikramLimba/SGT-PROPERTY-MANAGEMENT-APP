import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgt_owner/feature/Messages/widgets/chat_model.dart';
import 'package:sgt_owner/shared/widgets/custom_appbar.dart';
import 'package:sgt_owner/style/colors.dart';

class ShareToConnection extends StatefulWidget {
  const ShareToConnection({super.key});

  @override
  State<ShareToConnection> createState() => _ShareToConnectionState();
}

class _ShareToConnectionState extends State<ShareToConnection> {
  List selectedChatTile = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: selectedChatTile.isNotEmpty
          ? CustomAppBar(titleText: '${selectedChatTile.length} Selected',)
          : CustomAppBar(titleText: 'Share to',),
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height:
                  //BlocProvider.of<IslongpressCubit>(context, listen: true)
                  // state.selectedChatTile.isNotEmpty
                  selectedChatTile.isNotEmpty
                      ? MediaQuery.of(context).size.height * 4 / 5
                      : MediaQuery.of(context).size.height * 3.56 / 5,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemCount: dummyData.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      tileColor:
                          // BlocProvider.of<IslongpressCubit>(
                          //   context,
                          // )
                          //state.selectedChatTile.contains(index)
                          selectedChatTile.contains(index)
                              ? AppColors.secondaryColor
                              : null,
                      onLongPress: () {
                        // BlocProvider.of<IslongpressCubit>(
                        //   context,
                        // ).addtoList(index);
                        setState(() {
                          selectedChatTile.add(index);
                        });
                        print(selectedChatTile[index]);
                      },
                      onTap: () {
                        setState(() {
                          selectedChatTile.remove(index);
                        });
                      },
                      leading: Stack(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: AppColors.grayColor,
                            backgroundImage: NetworkImage(
                              dummyData[index].profileUrl,
                            ),
                          ),
                          dummyData[index].isOnline
                              ? Positioned(
                                  top: 40,
                                  left: 40,
                                  child: Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                      color: AppColors.greenColor,
                                      border:
                                          Border.all(color: AppColors.white, width: 2),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                )
                              : Positioned(
                                  top: 40,
                                  left: 40,
                                  child: Container(),
                                )
                        ],
                      ),
                      title: Text(dummyData[index].name),
                      subtitle: dummyData[index].isSendByMe
                          ? Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                dummyData[index].messagetype == 'not_send'
                                    ? Icon(
                                        Icons.av_timer,
                                        size: 17.sp,
                                      )
                                    : Icon(
                                        Icons.done_all_outlined,
                                        size: 17.sp,
                                        color: dummyData[index].ismessageSeen
                                            ? AppColors.primaryColor
                                            : Colors.grey,
                                      ),
                                dummyData[index].messagetype == 'photo'
                                    ? Icon(
                                        Icons.photo,
                                        size: 16.sp,
                                      )
                                    : dummyData[index].messagetype == 'video'
                                        ? Icon(
                                            Icons.videocam,
                                            size: 16.sp,
                                          )
                                        : Container(),
                                SizedBox(
                                  width: 140.w,
                                  child: Text(
                                    dummyData[index].messagetype == 'photo'
                                        ? 'Photo'
                                        : dummyData[index].messagetype ==
                                                'video'
                                            ? "Video"
                                            : dummyData[index].message,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                  ),
                                )
                              ],
                            )
                          : Text(
                              dummyData[index].message,
                              overflow: TextOverflow.ellipsis,
                            ),
                      trailing: SizedBox(
                        height: 60.h,
                        width: 64.w,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                dummyData[index].time,
                                style: const TextStyle(color: Colors.grey),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              dummyData[index].msgNo != 0.toString()
                                  ? Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                          color: AppColors.primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: Center(
                                        child: Text(
                                          dummyData[index].msgNo,
                                          style: TextStyle(color: AppColors.white),
                                        ),
                                      ),
                                    )
                                  : Container()
                            ]),
                      ),
                    ),
                    // BlocProvider.of<IslongpressCubit>(context, listen: true)
                    //         .state
                    //         .islongpressed
                    // BlocProvider.of<IslongpressCubit>(context,
                    //             listen: true)
                    //         .state
                    //         .selectedChatTile
                    //         .contains(index)
                    selectedChatTile.contains(index)
                        ? Divider(
                            height: 0,
                            color: Colors.grey,
                          )
                        : const Padding(
                            padding: EdgeInsets.only(left: 90.0),
                            child: Divider(
                              color: Colors.grey,
                            ),
                          )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
