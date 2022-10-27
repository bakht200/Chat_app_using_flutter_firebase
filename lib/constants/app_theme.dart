import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static var primaryColor = Color(0XFF534B66);
  static var secondaryColor = Color(0XFF9489B5);

  static var backgroundColor = Color(0xFFFCFBFF);
  static var accentColor = Color(0XFFF6D0A1);

  static var resolvedIconColor = Color(0XFF5A7EDA);
  static var unResolvedIconColor = Color(0XFFDA5A5A);

  static var alertTypeBackGroundColor = Color(0XFFECEAF3);

  static var loginTextStyle = TextStyle(
    fontSize: 30.sp,
    color: Colors.black,
  );

  static var dashboardTitleTextStyle = TextStyle(
      fontSize: 32.sp, color: Colors.black, fontWeight: FontWeight.w400);

  static var forgetPasswordTextStyle = TextStyle(
      fontSize: 14.sp,
      color: AppTheme.primaryColor,
      fontWeight: FontWeight.w600);

  static var alertTitleTextStyle = TextStyle(
    fontSize: 18.sp,
    color: Colors.black,
  );

  static var alertTimeTextStyle = TextStyle(
      fontSize: 12.sp, color: Colors.black, fontWeight: FontWeight.w400);

  static var appartmentNumberTextStyle = TextStyle(
    fontSize: 20.sp,
    color: Colors.white,
  );

  static var propertyTextStyle = TextStyle(
      fontSize: 16.sp, color: Colors.black, fontWeight: FontWeight.w400);

  static var themeFilledButtonTextStyle = TextStyle(
    fontSize: 18.sp,
    color: Colors.white,
  );
  static var themeFilledButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(AppTheme.primaryColor),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3.w),
        side: BorderSide(
          color: AppTheme.primaryColor,
        ),
      ),
    ),
  );
}
