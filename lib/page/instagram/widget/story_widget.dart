import 'package:facebook_app/model/story_insta_model.dart';
import 'package:facebook_app/page/instagram/ui_elements/my_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoryInstaWidget extends StatelessWidget {
  final StoryInstaModel? story;
  const StoryInstaWidget({Key? key, required this.story}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: .0,
      margin: EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomPaint(
            painter: MyPainter(),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(28.w),
                child: Image.asset(
                  story!.image,
                  width: 54.w,
                  fit: BoxFit.cover,
                )),
          ),
          SizedBox(
            height: 5.h,
          ),
          Flexible(
              child: Text(
            story!.username,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
          ))
        ],
      ),
    );
  }
}
