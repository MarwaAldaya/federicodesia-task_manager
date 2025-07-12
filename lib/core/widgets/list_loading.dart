import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/shimmer_widget.dart';

class ListLoading extends StatelessWidget {
  const ListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: ListView.separated(
        itemCount: 9,
        itemBuilder: (context, index) =>
            ShimmerWidget.rectangular(height: 220.h, borderRadius: 12.r),
        separatorBuilder: (context, index) => 20.verticalSpace,
      ),
    );
  }
}
