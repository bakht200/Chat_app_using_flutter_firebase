import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maahey_flutter_task/constants/app_assets.dart';
import 'package:maahey_flutter_task/constants/app_theme.dart';
import 'package:maahey_flutter_task/model/brawery_model.dart';

class DetailPage extends StatelessWidget {
  String name;
  String type;
  String country;
  String city;
  String state;

  DetailPage({
    required this.name,
    required this.city,
    required this.type,
    required this.state,
    required this.country,
  });
  @override
  Widget build(BuildContext context) {
    const levelIndicator = LinearProgressIndicator(
        backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
        value: 12,
        valueColor: AlwaysStoppedAnimation(Colors.green));

    final coursePrice = Container(
      padding: EdgeInsets.all(7.0.w),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5.0)),
      child: const Text(
        "\$22",
        style: TextStyle(color: Colors.white),
      ),
    );

    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 120.0.h),
        Image.asset(
          ImageAssets.logoImage,
          width: 50.w,
          height: 50.h,
        ),
        Container(
          width: 90.0.w,
          child: Divider(color: Colors.green),
        ),
        SizedBox(height: 10.0.h),
        Text(
          name.toString(),
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.white, fontSize: 25.sp),
        ),
        SizedBox(height: 20.0.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Expanded(flex: 1, child: levelIndicator),
            Expanded(
                flex: 6,
                child: Padding(
                    padding: EdgeInsets.only(left: 10.0.w),
                    child: const Text(
                      "Ratings",
                      style: TextStyle(color: Colors.white),
                    ))),
            Expanded(flex: 1, child: coursePrice)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(left: 10.0.w),
                child: const Text(
                  "Type",
                  style: TextStyle(
                      color: Colors.white, fontStyle: FontStyle.italic),
                )),
            Padding(
                padding: EdgeInsets.only(left: 10.0.w),
                child: Text(
                  type,
                  style: TextStyle(color: Colors.white),
                )),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(left: 10.0.w),
                child: Text(
                  "Address: ",
                  style: TextStyle(
                      color: Colors.white, fontStyle: FontStyle.italic),
                )),
            Padding(
                padding: EdgeInsets.only(left: 5.0.w),
                child: Text(
                  city.toString(),
                  style: TextStyle(color: Colors.white),
                )),
            Padding(
                padding: EdgeInsets.only(left: 5.0.w),
                child: Text(
                  "${state.toString()},",
                  style: TextStyle(color: Colors.white),
                )),
            Padding(
                padding: EdgeInsets.only(left: 5.0.w),
                child: Text(
                  country.toString(),
                  style: TextStyle(color: Colors.white),
                )),
          ],
        ),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(left: 10.0),
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage(ImageAssets.logoImage),
                fit: BoxFit.cover,
              ),
            )),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );

    final bottomContentText = Text(
      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
      style: TextStyle(fontSize: 15.0.sp),
      textAlign: TextAlign.justify,
    );
    final readButton = Container(
        padding: EdgeInsets.symmetric(vertical: 16.0.h),
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          style: AppTheme.themeFilledButtonStyle,
          onPressed: () => {},
          child: Text("Contact", style: TextStyle(color: Colors.white)),
        ));
    final bottomContent = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(40.0.w),
      child: Center(
        child: Column(
          children: <Widget>[bottomContentText, readButton],
        ),
      ),
    );

    return Scaffold(
      body: Column(
        children: <Widget>[topContent, bottomContent],
      ),
    );
  }
}
