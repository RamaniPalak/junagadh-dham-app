import 'package:flutter/material.dart';
import 'sizer.dart';

Color kPrimaryColor = const Color(0xffF3453C);
Color kSecondary = const Color(0xff9C0D06);
Color kWhite = const Color(0xffFFFFFF);
Color bg1 = const Color(0xffD3BA9D);
Color bg2 = const Color(0xffEBD6BC).withOpacity(0.98);
Color kLightYellow = const Color(0xffF1D398);
Color greyColor = const Color(0xff666666);
Color dividerColor = const Color(0xff949494);

//Routes
String kInitialRoute = '/';
String kLoginRoute = '/LoginScreen';
String kHomeRoute = '/HomeScreen';

String kRegularFonts = "Lato";

double kFontRatio = 1.0;

double kFlexibleSize(double size) {
  return size * kFontRatio;
}

final kAuthTitleStyle = TextStyle(
  color: kWhite,
  fontSize: 20.sp,
  fontWeight: FontWeight.w500,
);

final kBgButton = TextStyle(
  color: kSecondary,
  fontSize: 16.sp,
  fontWeight: FontWeight.w600,
);

final kImgTitle = TextStyle(
  color: kSecondary,
  fontSize: 16.sp,
  fontWeight: FontWeight.w700,
);

final kDarshanImg = TextStyle(
  color: kSecondary,
  fontSize: 11.sp,
  fontWeight: FontWeight.w700,
);

final kDonateButton = TextStyle(
  color: kWhite,
  fontSize: 14.sp,
  fontWeight: FontWeight.w500,
);
