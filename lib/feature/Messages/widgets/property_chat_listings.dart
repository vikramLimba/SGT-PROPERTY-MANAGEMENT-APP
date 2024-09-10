import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sgt_owner/feature/Messages/cubit/islongpressed/islongpress_cubit.dart';
import 'package:sgt_owner/feature/Messages/widgets/chat_model.dart';
import 'package:sgt_owner/feature/Messages/widgets/chattile_widget.dart';
import 'package:sgt_owner/shared/widgets/custom_appbar.dart';
import 'package:sgt_owner/style/colors.dart';

class ConnectScreen extends StatefulWidget {
  const ConnectScreen({super.key});

  @override
  State<ConnectScreen> createState() => _ConnectScreenState();
}

class _ConnectScreenState extends State<ConnectScreen> {
  @override
  Widget build(BuildContext context) {
    // return BlocConsumer<IslongpressCubit, IslongpressState>(
    //   listener: (context, state) {},
    //   builder: (context, state) {
    return Scaffold(
      appBar:
          // state.selectedChatTile.isNotEmpty ?
          //     AppBar(
          //         leadingWidth: 0,
          //         backgroundColor: AppColors.white,
          //         leading: IconButton(
          //           icon: Icon(
          //             Icons.arrow_back_ios,
          //             color: AppColors.black,
          //           ),
          //           onPressed: () {},
          //         ),
          //         actions: [
          //           IconButton(
          //               onPressed: () {
          //                 context.read<IslongpressCubit>().removeAll();
          //               },
          //               icon: Icon(
          //                 Icons.delete_outline,
          //                 color: AppColors.black,
          //                 size: 25,
          //               ))
          //         ],
          //       )
          // :
          CustomAppBar(
        titleText: 'Radission Blu Hotel Chats',
        isLeading: true,
      ),
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            // state.selectedChatTile.isNotEmpty
            //     ? Padding(
            //         padding: const EdgeInsets.only(
            //             left: 16.0, bottom: 10, right: 16),
            //         child: Text(
            //           'Chats',
            //           style: TextStyle(
            //               color: AppColors.primaryColor,
            //               fontSize: 17,
            //               fontWeight: FontWeight.w500),
            //         ),
            //       )
            //     :
            // state.selectedChatTile.isNotEmpty
            //     ? Container()
            //     :
            SizedBox(
              height: 90 * dummyData.length.toDouble(),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                itemCount: dummyData.length,
                itemBuilder: (context, index) => ChatTileWidget(
                    index: index,
                    color:
                        // context
                        //         .read<IslongpressCubit>()
                        //         .state
                        //         .selectedChatTile
                        //         .contains(index)
                        //     ?
                        AppColors.white
                    // : Colors.transparent,
                    // cubit: BlocProvider.of(context),
                    ),
              ),
            )
          ],
        ),
      ),
    );
    //   },
    // );
  }
}
