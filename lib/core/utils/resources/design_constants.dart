import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color_manager.dart';

/* Padding constants */
const double kTinyPadding = 8;

const double kSmallPadding = 12;

const double kMediumPadding = 20;

const double kLargePadding = 30;

const double kXLargePadding = 40;

const double kXXLargePadding = 50;

const double kHugePadding = 60;

const double kXHugePadding = 70;

const double kXXHugePadding = 80;

const double inf = double.infinity;

SizedBox kWi4 = SizedBox(
  width: 4.w,
);
SizedBox kWi8 = SizedBox(
  width: 8.w,
);
SizedBox kWi12 = SizedBox(
  width: 12.w,
);
SizedBox kWi16 = SizedBox(
  width: 16.w,
);
SizedBox kWi20 = SizedBox(
  width: 20.w,
);
SizedBox kWi24 = SizedBox(
  width: 24.w,
);
SizedBox kWi28 = SizedBox(
  width: 28.w,
);
SizedBox kWi32 = SizedBox(
  width: 32.w,
);
SizedBox kWi36 = SizedBox(
  width: 36.w,
);
SizedBox kWi40 = SizedBox(
  width: 40.w,
);
SizedBox kWi44 = SizedBox(
  width: 44.w,
);
SizedBox kWi50 = SizedBox(
  width: 50.w,
);
SizedBox kWi60 = SizedBox(
  width: 60.w,
);
SizedBox kWi80 = SizedBox(
  width: 80.w,
);
SizedBox kWi180 = SizedBox(
  width: 180.w,
);
SizedBox kWi220 = SizedBox(
  width: 220.w,
);
SizedBox kWi280 = SizedBox(
  width: 280.w,
);
SizedBox kHe4 = SizedBox(
  height: 4.h,
);
SizedBox kHe8 = SizedBox(
  height: 8.h,
);
SizedBox kHe12 = SizedBox(
  height: 12.h,
);
SizedBox kHe16 = SizedBox(
  height: 16.h,
);
SizedBox kHe20 = SizedBox(
  height: 20.h,
);
SizedBox kHe24 = SizedBox(
  height: 24.h,
);
SizedBox kHe28 = SizedBox(
  height: 28.h,
);
SizedBox kHe32 = SizedBox(
  height: 32.h,
);
SizedBox kHe36 = SizedBox(
  height: 36.h,
);
SizedBox kHe40 = SizedBox(
  height: 40.h,
);
SizedBox kHe44 = SizedBox(
  height: 44.h,
);
SizedBox kHe50 = SizedBox(
  height: 50.h,
);
SizedBox kHe60 = SizedBox(
  height: 60.h,
);

EdgeInsets kTinyAllPadding = EdgeInsets.all(kTinyPadding.w);
EdgeInsets kSmallAllPadding = EdgeInsets.all(kSmallPadding.w);
EdgeInsets kMediumAllPadding = EdgeInsets.all(kMediumPadding.w);
EdgeInsets kLargeAllPadding = EdgeInsets.all(kLargePadding.w);
EdgeInsets kXLargeAllPadding = EdgeInsets.all(kXLargePadding.w);
EdgeInsets kXXLargeAllPadding = EdgeInsets.all(kXXLargePadding.w);
EdgeInsets kHugeAllPadding = EdgeInsets.all(kHugePadding.w);
EdgeInsets kXHugeAllPadding = EdgeInsets.all(kXHugePadding.w);
EdgeInsets kXXHugeAllPadding = EdgeInsets.all(kXXHugePadding.w);

EdgeInsets kSmallSymWidth =
    EdgeInsets.symmetric(horizontal: kSmallPadding.w, vertical: kTinyPadding.h);
EdgeInsets kSmallMedWidth = EdgeInsets.symmetric(
    horizontal: kSmallPadding.w, vertical: kMediumPadding.h);
EdgeInsets kMediumSymWidth = EdgeInsets.symmetric(
    horizontal: kMediumPadding.w, vertical: kTinyPadding.h);
EdgeInsets kLargeSymWidth = EdgeInsets.symmetric(
    horizontal: kXLargePadding.w, vertical: kSmallPadding.h);
EdgeInsets kSmallSymHeight =
    EdgeInsets.symmetric(horizontal: kTinyPadding.w, vertical: kSmallPadding.h);
EdgeInsets kMediumSymHeight = EdgeInsets.symmetric(
    horizontal: kTinyPadding.w, vertical: kMediumPadding.h);
EdgeInsets kMediumLarHeight =
    EdgeInsets.symmetric(horizontal: kTinyPadding.w, vertical: kLargePadding.h);
EdgeInsets kLargeSymHeight = EdgeInsets.symmetric(
    horizontal: kSmallPadding.w, vertical: kLargePadding.h);
EdgeInsets wLargeSymWidth =
    EdgeInsets.symmetric(horizontal: kLargePadding.w, vertical: kTinyPadding.h);
EdgeInsets wHugeSymWidth = EdgeInsets.symmetric(
    horizontal: kXXHugePadding.w, vertical: kTinyPadding.h);

UnderlineInputBorder kUnderlinedBorderPrimary = UnderlineInputBorder(
  borderSide: BorderSide(color: ColorManager.primary),
);
UnderlineInputBorder kUnderlinedBorderGrey = UnderlineInputBorder(
  borderSide: BorderSide(color: ColorManager.lightGrey),
);
UnderlineInputBorder kUnderlinedBorderError = const UnderlineInputBorder(
  borderSide: BorderSide(color: Colors.red),
);
OutlineInputBorder kOutlinedBorderGray = OutlineInputBorder(
  borderRadius: const BorderRadius.all(Radius.circular(12)),
  borderSide: BorderSide(color: ColorManager.lightGrey, width: 0.7),
);
OutlineInputBorder kOutlinedBorderBlack = OutlineInputBorder(
  borderRadius: const BorderRadius.all(Radius.circular(12)),
  borderSide: BorderSide(color: ColorManager.black, width: 0.7),
);
OutlineInputBorder kOutlinedBorderPrimary = OutlineInputBorder(
  borderRadius: const BorderRadius.all(Radius.circular(12)),
  borderSide: BorderSide(color: ColorManager.primary, width: 0.7),
);
OutlineInputBorder kOutlinedBorderRed = OutlineInputBorder(
  borderRadius: const BorderRadius.all(Radius.circular(12)),
  borderSide: BorderSide(color: ColorManager.redError),
);
// BoxShadow veryLowElevation = BoxShadow(
//     color: ColorManager.black.withOpacity(0.04),
//     offset: const Offset(0, 0),
//     blurRadius: 6,
//     spreadRadius: 1);
// BoxShadow lowElevation = BoxShadow(
//     color: ColorManager.black.withOpacity(0.16),
//     offset: const Offset(0, 0),
//     blurRadius: 6,
//     spreadRadius: 2);
// BoxShadow lowWhiteElevation = BoxShadow(
//     color: ColorManager.black.withOpacity(0.16),
//     offset: const Offset(0, 0),
//     blurRadius: 6,
//     spreadRadius: 2);

const BorderRadius lowBorderRadius = BorderRadius.all(Radius.circular(8));
const BorderRadius smallBorderRadius = BorderRadius.all(Radius.circular(12));
const BorderRadius medBorderRadius = BorderRadius.all(Radius.circular(16));
const BorderRadius highBorderRadius = BorderRadius.all(Radius.circular(24));
BorderRadius circularBorderRadius = BorderRadius.circular(100);
BoxDecoration getfilterBoxDecoration(context) => BoxDecoration(
      border: Border.all(color: context.colors.outline),
      borderRadius: BorderRadius.circular(8),
    );
// Map<String, Widget> templateLabelsIcons = {
//   'read': SvgPicture.asset(ImageAssets.docs),
//   'write': SvgPicture.asset(ImageAssets.docs)
// };
