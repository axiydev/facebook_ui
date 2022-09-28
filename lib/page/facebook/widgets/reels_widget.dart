import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReelsWidget extends StatelessWidget {
  final VoidCallback onPress;
  final String title;
  final IconData icon;
  final Color color;
  const ReelsWidget(
      {super.key,
      required this.icon,
      required this.onPress,
      required this.color,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.w),
      child: GestureDetector(
        onTap: onPress,
        child: SizedBox(
            width: 80.w,
            height: 30.h,
            child: Card(
              elevation: .0,
              margin: EdgeInsets.zero,
              color: color.withOpacity(.1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: color,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
