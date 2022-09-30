import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IndicatorItem extends StatelessWidget {
  final bool isSelected;
  const IndicatorItem({Key? key, this.isSelected = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(
        milliseconds: 200,
      ),
      height: 6.w,
      width: 6.w,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Colors.blue : Colors.grey),
    );
  }
}
