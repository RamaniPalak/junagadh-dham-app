import 'package:flutter/material.dart';
import 'package:junagadh_temple/app/components/image_components.dart';
import 'package:junagadh_temple/app/components/indicator_ccomponents.dart';
import 'package:junagadh_temple/app/screens/notification/notification_screen.dart';
import 'package:junagadh_temple/app/screens/timing/timing_screen.dart';
import 'package:junagadh_temple/app/utils/constants.dart';
import 'package:junagadh_temple/app/views/bg_container.dart';
import 'package:junagadh_temple/app/views/common_images.dart';
import 'package:junagadh_temple/app/utils/sizer.dart';
import 'dart:ui' as ui;

import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  void _pageChanged(int index) {
    setState(() {});
  }

  final List<Widget> _pages = [
    Container(
     child: sliderImage,
    ),
    Container(
      color: Colors.blueGrey,
    ),
    Container(
      color: Colors.brown,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Home',
          style: kAuthTitleStyle,
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 5.w),
          child: Container(
            child: appIconImage,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 4.w),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const TimingScreen()));
              },
              child: SizedBox(
                width: 5.w,
                height: 5.h,
                child: clockIconImage,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 5.w),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NotificationScreen()));
              },
              child: SizedBox(
                width: 5.w,
                height: 5.h,
                child: notificationImage,
              ),
            ),
          ),
        ],
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return BgContainer(
      child: SingleChildScrollView(
        child: SafeArea(
            child: Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisSize: MainAxisSize.min,
               children: [
            Padding(
              padding: EdgeInsets.only(top: 2.h),
              child: BgButton(
                child: Text(
                  'Daily Darshan',
                  style: kBgButton,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left :4.w,right: 4.w,top: 4.h,bottom: 4.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 23.w,
                    child: MaskedImage(
                        mask: 'assets/images/bg_mask.png',
                        asset: 'https://wallpaperaccess.com/full/6787843.jpg'),
                  ),
                  SizedBox(
                    width: 35.w,
                    child: MaskedImage(
                        mask: 'assets/images/bg_mask.png',
                        asset: 'https://wallpaperaccess.com/full/6787843.jpg'),
                  ),
                  SizedBox(
                    width: 23.w,
                    child: MaskedImage(
                        mask: 'assets/images/bg_mask.png',
                        asset: 'https://wallpaperaccess.com/full/6787843.jpg'),
                  ),
                ],
              ),
            ),
            Container(
              child: Text(
                '|| Shree Ghanshyamji Maharaj ||',
                style: kImgTitle,
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: 3.h,left: 4.w,right: 4.w),
              child: Container(
                height: 23.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5)
              ),
                child: PageView.builder(
                  onPageChanged: _pageChanged,
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                  itemCount: _pages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _pages[index];
                  },
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 1.h),
              child: Indicator(
                controller: _pageController,
                itemCount: _pages.length,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2.h),
              child: SizedBox(width: 90.w, child: designImage),
            ),
            Padding(
              padding: EdgeInsets.only(top: 2.h),
              child: BgButton(
                child: Text(
                  'Live Darshan',
                  style: kBgButton,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 2.h, bottom: 5.h),
              child: Container(
                width: 89.w,
                height: 20.h,
                child: const WebView(
                  initialUrl: 'https://flutter.dev',
                  // javascriptMode: JavascriptMode.unrestricted,
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
