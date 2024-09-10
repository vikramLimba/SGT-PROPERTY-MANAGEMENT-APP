import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class MediaTab extends StatefulWidget {
  const MediaTab({super.key});

  @override
  State<MediaTab> createState() => _MediaTabState();
}

class _MediaTabState extends State<MediaTab> {
  String _getRandomImage(int width, int height) {
    var rng = new Random();
    return 'https://picsum.photos/$width/$height?random=${rng.nextInt(999999)}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        //itemCount: images.length,
        itemCount: 50,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 5.w,
          mainAxisSpacing: 5.w,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Image.network(
              //images[index],
              _getRandomImage(512, 512),
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
