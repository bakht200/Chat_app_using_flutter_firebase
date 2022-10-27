import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/app_theme.dart';

class BrawerListCard extends StatelessWidget {
  final String braweryTitle;
  final String type;
  final String city;
  final String state;
  final String country;

  BrawerListCard(
      {required this.braweryTitle,
      required this.type,
      required this.city,
      required this.state,
      required this.country});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 6.0.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.0.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 4,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: ListTile(
        leading: Container(
          width: 100.w,
          height: 55.h,
          decoration: BoxDecoration(
            color: AppTheme.secondaryColor,
            borderRadius: BorderRadius.circular(4.0.r),
          ),
          child: Center(
            child: Text(
              type,
              style: AppTheme.appartmentNumberTextStyle,
            ),
          ),
        ),
        title: Text(
          braweryTitle,
          style: AppTheme.alertTitleTextStyle,
        ),
        subtitle: Row(
          children: [
            Icon(
              Icons.location_on,
              color: Colors.red,
              size: 15.sp,
            ),
            Text(
              "${city} ${state}, ${city}",
              style: AppTheme.alertTimeTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
