import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:maahey_flutter_task/constants/secure_storage.dart';

import 'package:maahey_flutter_task/controller/brawery_controller.dart';
import 'package:maahey_flutter_task/view/detail_page.dart';
import 'package:maahey_flutter_task/view/login_screen.dart';
import 'package:maahey_flutter_task/view/messaging/search.dart';
import 'package:maahey_flutter_task/view/widget/alert_card_widget.dart';
import '../constants/app_assets.dart';
import '../constants/app_theme.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final brawerController = Get.put(BraweryController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () => brawerController.fetchBrawerList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.backgroundColor,
        leading: GestureDetector(
          onTap: () async {
            await UserSecureStorage.deleteSecureStorage();
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (builder) => LoginScreen()));
          },
          child: Icon(
            Icons.logout,
            color: AppTheme.secondaryColor,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (builder) => Search()));
              },
              child: Icon(
                Icons.message_rounded,
                color: AppTheme.secondaryColor,
                size: 30.sp,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 12.0.w, right: 12.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 30.h,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome to Dashboard',
                      style: AppTheme.dashboardTitleTextStyle,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      'Set your interests ',
                      style: AppTheme.propertyTextStyle,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Expanded(
                  flex: 7,
                  child: GetBuilder(
                      init: brawerController,
                      builder: (context) {
                        return brawerController.loader == true
                            ? Center(child: CircularProgressIndicator())
                            : ListView.builder(
                                itemCount: brawerController.brawerList.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (builder) => DetailPage(
                                                    name: brawerController
                                                        .brawerList[index]
                                                        .name!,
                                                    type: brawerController
                                                        .brawerList[index]
                                                        .breweryType!,
                                                    city: brawerController
                                                        .brawerList[index]
                                                        .city!,
                                                    country: brawerController
                                                        .brawerList[index]
                                                        .country!,
                                                    state: brawerController
                                                        .brawerList[index]
                                                        .state!,
                                                  )));
                                    },
                                    child: BrawerListCard(
                                      braweryTitle: brawerController
                                          .brawerList[index].name
                                          .toString(),
                                      type: brawerController
                                          .brawerList[index].breweryType
                                          .toString(),
                                      city: brawerController
                                          .brawerList[index].city
                                          .toString(),
                                      state: brawerController
                                          .brawerList[index].state
                                          .toString(),
                                      country: brawerController
                                          .brawerList[index].country
                                          .toString(),
                                    ),
                                  );
                                });
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
