import 'dart:async';

import 'package:flutter/material.dart';
import 'package:junagadh/app/components/image_components.dart';
import 'package:junagadh/app/components/indicator_ccomponents.dart';
import 'package:junagadh/app/providers/home_provider.dart';
import 'package:junagadh/app/screens/imageview/dailydarshan_view.dart';
import 'package:junagadh/app/screens/imageview/image_view.dart';
import 'package:junagadh/app/screens/imageview/webview_screen.dart';
import 'package:junagadh/app/screens/notification/notification_screen.dart';
import 'package:junagadh/app/screens/timing/timing_screen.dart';
import 'package:junagadh/app/utils/constants.dart';
import 'package:junagadh/app/utils/enums.dart';
import 'package:junagadh/app/utils/no_data_found_view.dart';
import 'package:junagadh/app/views/bg_container.dart';
import 'package:junagadh/app/views/common_images.dart';
import 'package:junagadh/app/utils/sizer.dart';
import 'package:junagadh/app/views/loading_small.dart';
import 'package:junagadh/app/views/network_image.dart';
import 'package:junagadh/app/views/upi_donation.dart';

import 'package:webview_flutter/webview_flutter.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  final Completer<WebViewController> _controller =
  Completer<WebViewController>();

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
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      final provider = context.read<HomeProviderImpl>();

      if (provider.res?.data == null) {
        provider.getSlider();
      }

      if (provider.resDailyDarshanDate?.data == null) {
        provider.getDailyDarshan();
      }

      if (provider.resGallery?.data == null) {
        provider.getGallery();
      }

      // if(provider.youtubeURL?.data == null){
      provider.getYoutubeUrl().then((value) async {
        final controller = await _controller.future;
        final iframe =
            "<iframe width=\"100%\" height=\"100%\" src=\"${value}\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>";

        // final iframe = "<iframe src=\"${value}\" title=\"W3Schools Free Online Web Tutorials\" width=\"100%\" height=\"600\" > </iframe>";

        controller.loadHtmlString(iframe);

        print(iframe);
      });
      // }
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
          InkWell(
            onTap: () {
              Navigator.of(context, rootNavigator: true).push(
                  MaterialPageRoute(builder: (context) => TimingScreen()));
            },
            child: Padding(
              padding: EdgeInsets.all(3.5.w),
              child: Center(
                child: SizedBox(
                  width: 5.w,
                  height: 5.h,
                  child: clockIconImage,
                ),
              ),
            ),
          ),
          // InkWell(
          //   onTap: () {
          //     Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
          //         builder: (context) => NotificationScreen()));
          //   },
          //   child: Padding(
          //     padding: EdgeInsets.all(3.5.w),
          //     child: Center(
          //       child: SizedBox(
          //         width: 5.w,
          //         height: 5.h,
          //         child: notificationImage,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {

    return BgContainer(
      child: SafeArea(
        child: SingleChildScrollView(
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
                padding: EdgeInsets.only(top: 2.h),
                child: SizedBox(
                  width: 89.w,
                  height: 25.h,
                  child: Stack(
                    children: [
                      WebView(
                        initialMediaPlaybackPolicy:
                        AutoMediaPlaybackPolicy.always_allow,
                        allowsInlineMediaPlayback: true,
                        javascriptMode: JavascriptMode.unrestricted,
                        //initialUrl: 'https://youtu.be/VfjQHQgTFTI',
                        onWebViewCreated: (controller) {
                          _controller.complete(controller);
                        },
                      ),
                      Positioned(
                        bottom: 3,
                        right: 3,
                        child: viewYoutubeBtn(context),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h),
                child: SizedBox(width: 90.w, child: designImage),
              ),
              Padding(
                padding: EdgeInsets.only(top: 1.h),
                child: BgButton(
                  child: Text(
                    'Donation',
                    style: kBgButton,
                  ),
                ),
              ),
              UPIDonationScreen(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 1.h),
                child: SizedBox(width: 90.w, child: designImage),
              ),
              Padding(
                padding: EdgeInsets.only(top: 1.h),
                child: BgButton(
                  child: Text(
                    'Gallery',
                    style: kBgButton,
                  ),
                ),
              ),
              gallery(),
              SizedBox(
                height: 10.h,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget viewYoutubeBtn(BuildContext context) {
    final provider = context.watch<HomeProviderImpl>();
    if(provider.youtubeURL?.state == Status.LOADING){
      return Container();
    }
    return InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) =>
                                  WebviewScreen(
                                    url: provider.youtubeURL?.data ?? '',
                                  ),));
                        },
                        child: Icon(
                          Icons.zoom_out_map,
                          color: kWhite,
                        ),
                      );
  }

  Widget gallery() {
    final gallery = context.watch<HomeProviderImpl>();

    if (gallery.resGallery?.state == Status.LOADING) {
      return Center(child: LoadingSmall(color: kSecondary));
    }

    final hasError = gallery.resGallery?.state == Status.ERROR ||
        gallery.resGallery?.state == Status.UNAUTHORISED;

    if (hasError) {
      return Center(
          child: Container(
            child: NoDataFoundView(
                retryCall: () {
                  context.read<HomeProviderImpl>().getGallery();
                },
                title: 'No Data Found'),
          ));
    }

    final data = gallery.resGallery?.data?.data;

    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 5.w, right: 5.w, bottom: 8.w, top: 5.w),
        child: GridView.builder(
          itemCount: 4,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.15,
              mainAxisSpacing: 4.w,
              crossAxisSpacing: 4.w),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context, rootNavigator: true)
                    .push(MaterialPageRoute(
                  builder: (context) =>
                      ImageViewScreen(
                        imgIndex: data?.imageurl,
                        index: index,
                      ),
                ));
              },
              child: CustomNetWorkImage(
                url: '${data?.imageurl?[index]}',
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget homeSlider() {
    final slider = context.watch<HomeProviderImpl>();

    // if (slider.res?.state == Status.LOADING) {
    //   return Center(child: LoadingSmall(color: kSecondary));
    // }

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
                // AA vastu image ni url ma vapr vani
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

    // if (dailyDarshan.resDailyDarshan?.state == Status.LOADING) {
    //   return Center(child: LoadingSmall(color: kSecondary));
    // }

    final data = dailyDarshan.resDailyDarshanDate?.data;

    return Column(
      children: [
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: 3,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, childAspectRatio: 0.6),
          itemBuilder: (context, index) {
            //  print(data?.elementAt(index).thumburl);
            return InkWell(
              onTap: () {
                print(data?.data?.list
                    ?.elementAt(index)
                    .imageurl);
                Navigator.of(context, rootNavigator: true)
                    .push(MaterialPageRoute(
                  builder: (context) =>
                      DailyDarshanView(
                        url: data?.data?.list
                            ?.elementAt(index)
                            .imageurl,
                      ),
                ));
              },
              child: Center(
                child: CustomShapedImage(
                  width: (index == 1) ? 33.w : 23.w,
                  url: '${data?.data?.list
                      ?.elementAt(index)
                      .thumburl}',
                ),
              ),
            );
          },
        ),
        Container(
          child: Text(
            '|| ${data?.data?.list
                ?.elementAt(1)
                .name ?? '-'} ||',
            style: kImgTitle,
          ),
        ),
      ],
    );
  }
}
