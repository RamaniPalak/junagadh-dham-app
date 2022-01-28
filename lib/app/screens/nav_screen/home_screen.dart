import 'package:flutter/material.dart';
import 'package:junagadh_temple/app/components/image_components.dart';
import 'package:junagadh_temple/app/components/indicator_ccomponents.dart';
import 'package:junagadh_temple/app/providers/home_provider.dart';
import 'package:junagadh_temple/app/screens/imageview/dailydarshan_view.dart';
import 'package:junagadh_temple/app/screens/notification/notification_screen.dart';
import 'package:junagadh_temple/app/screens/timing/timing_screen.dart';
import 'package:junagadh_temple/app/utils/constants.dart';
import 'package:junagadh_temple/app/utils/enums.dart';
import 'package:junagadh_temple/app/views/bg_container.dart';
import 'package:junagadh_temple/app/views/common_images.dart';
import 'package:junagadh_temple/app/utils/sizer.dart';
import 'package:junagadh_temple/app/views/loading_small.dart';
import 'package:junagadh_temple/app/views/network_image.dart';
import 'dart:ui' as ui;

import 'package:webview_flutter/webview_flutter.dart';
import 'package:provider/provider.dart';

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
      color: Colors.blueGrey,
    ),
    Container(
      color: Colors.blueGrey,
    ),
    Container(
      color: Colors.brown,
    ),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      context.read<HomeProviderImpl>().getSlider();
      context.read<HomeProviderImpl>().getDailyDarshan();

    });
  }

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
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => TimingScreen()));
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
            dailyDarshan(),
            homeSlider(),
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
                  allowsInlineMediaPlayback: true,
                  initialUrl: 'https://www.youtube.com/watch?v=3CC8w2q7X30',
                  javascriptMode: JavascriptMode.unrestricted,
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }

  Widget homeSlider() {
    final slider = context.watch<HomeProviderImpl>();

    if (slider.res?.state == Status.LOADING) {
      return Center(child: LoadingSmall(color: kSecondary));
    }

    final data = slider.res?.data?.data;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 3.h, left: 4.w, right: 4.w),
          child: Container(
            width: 89.w,
            height: 20.h,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            child: PageView.builder(
              onPageChanged: _pageChanged,
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              itemCount: data?.imageurl?.length,
              itemBuilder: (BuildContext context, int index) {
                print(data
                    ?.imageurl?[index]); // AA vastu image ni url ma vapr vani
                return Container(
                  child: CustomNetWorkImage(
                    url: '${data?.imageurl?[index]}',
                    fit: BoxFit.fill,
                  ),
                );
              },
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 1.h),
          child: Indicator(
            controller: _pageController,
            itemCount: data?.imageurl?.length ?? 0,
          ),
        ),
      ],
    );
  }

  Widget dailyDarshan() {
    final dailyDarshan = context.watch<HomeProviderImpl>();

    if (dailyDarshan.resDailyDarshan?.state == Status.LOADING) {
      return Center(child: LoadingSmall(color: kSecondary));
    }

    final data = dailyDarshan.resDailyDarshan?.data?.data;

    return Column(
      children: [
        GridView.builder(
          itemCount: 3,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, childAspectRatio: 0.6),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => DailyDarshanView(
                  url: data?.elementAt(index).imageurl,
                ),));

              },
              child: Center(
                child: CustomShapedImage(
                  width: (index == 1) ? 33.w : 23.w,
                  url: '${data?.elementAt(index).imageurl}',
                ),
              ),
            );
          },
        ),
        Container(
          child: Text(
            '|| ${data?.elementAt(1).name} ||',
            style: kImgTitle,
          ),
        ),
      ],
    );
  }
}
