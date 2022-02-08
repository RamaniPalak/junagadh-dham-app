import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:junagadh_temple/app/screens/donation/donation_screen.dart';
import 'package:junagadh_temple/app/screens/nav_screen/darshan_screen.dart';
import 'package:junagadh_temple/app/screens/nav_screen/event_screen.dart';
import 'package:junagadh_temple/app/screens/nav_screen/gallery_screen.dart';
import 'package:junagadh_temple/app/screens/nav_screen/home_screen.dart';
import 'package:junagadh_temple/app/utils/constants.dart';
import 'package:junagadh_temple/app/utils/show_snack_bar.dart';
import 'package:junagadh_temple/app/views/bg_container.dart';
import 'package:junagadh_temple/app/views/common_images.dart';
import 'package:junagadh_temple/app/utils/sizer.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectedPage = 0;

  final _page1 = GlobalKey<NavigatorState>();
  final _page2 = GlobalKey<NavigatorState>();
  final _page3 = GlobalKey<NavigatorState>();
  final _page4 = GlobalKey<NavigatorState>();
  final _page5 = GlobalKey<NavigatorState>();


  final _pageOptions = [
    HomeScreen(),
    DarshanScreen(),
    GalleryScreen(),
    EventScreen(),
    DonationScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    return BgContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: IndexedStack(
            index: selectedPage, children: [
          Navigator(
            key: _page1,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => HomeScreen(),
            ),
          ),
          Navigator(
            key: _page2,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => const DarshanScreen(),
            ),
          ),
          Navigator(
            key: _page3,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => const GalleryScreen(),
            ),
          ),
          Navigator(
            key: _page4,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => const EventScreen(),
            ),
          ),
          Navigator(
            key: _page5,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => const DonationScreen(),
            ),
          ),
          //_pageOptions[selectedPage]],
        ] //
            ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.popUntil(_page5.currentContext ?? context, (route) {
              return route.isFirst;
            });
            setState(() {
              selectedPage = 4;
            });
          },
          tooltip: 'Donation',
          child: CircleAvatar(radius: 70, child: floatingBtn),
          elevation: 0.0,
        ),
        bottomNavigationBar: BottomAppBar(
          notchMargin: 8,
          shape: CircularNotchedRectangle(),
          child: Container(
            height: 8.h,
            padding: EdgeInsets.only(left: 1.w, top: 1.h, right: 1.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                tabIcon(
                    title: 'Home',
                    txtColor: selectedPage == 0 ? kPrimaryColor : greyColor,
                    img: homeImage(
                      selectedPage == 0 ? kPrimaryColor : greyColor,
                    ),
                    onTap: () {
                      Navigator.popUntil(_page1.currentContext ?? context,
                          (route) {
                        return route.isFirst;
                      });
                      setState(() {
                        selectedPage = 0;
                      });
                    }),
                tabIcon(
                    title: 'Darshan',
                    txtColor: selectedPage == 1 ? kPrimaryColor : greyColor,
                    img: searchImage(
                      selectedPage == 1 ? kPrimaryColor : greyColor,
                    ),
                    onTap: () {
                      Navigator.popUntil(_page2.currentContext ?? context,
                          (route) {
                        return route.isFirst;
                      });
                      setState(() {
                        selectedPage = 1;
                      });
                    }),
                SizedBox(width: 10.w),
                tabIcon(
                    title: 'Gallery',
                    txtColor: selectedPage == 2 ? kPrimaryColor : greyColor,
                    img: galleryImage(
                      selectedPage == 2 ? kPrimaryColor : greyColor,
                    ),
                    onTap: () {
                      Navigator.popUntil(_page3.currentContext ?? context,
                          (route) {
                        return route.isFirst;
                      });
                      setState(() {
                        selectedPage = 2;
                      });
                    }),
                tabIcon(
                    title: 'Event',
                    txtColor: selectedPage == 3 ? kPrimaryColor : greyColor,
                    img: eventImage(
                      selectedPage == 3 ? kPrimaryColor : greyColor,
                    ),
                    onTap: () {
                      Navigator.popUntil(_page4.currentContext ?? context,
                          (route) {
                        return route.isFirst;
                      });

                      setState(() {
                        selectedPage = 3;
                      });
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InkWell tabIcon(
      {@required String? title, Image? img, Color? txtColor, Function? onTap}) {
    return InkWell(
      onTap: () {
        onTap!();
      },
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              margin: EdgeInsets.only(top: 1.5.w), width: 7.w, child: img),
          Text(
            title ?? '',
            style: TextStyle(
                fontSize: 12.sp, fontWeight: FontWeight.w600, color: txtColor),
          )
        ],
      ),
    );
  }
}


class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

  int selectedPage = 0;

  final page = [
    HomeScreen(),
    DarshanScreen(),
    DonationScreen(),
    GalleryScreen(),
    EventScreen(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.initState();
  }

  void onGooglePayResult(paymentResult) {
    // Send the resulting Google Pay token to your server / PSP
    print(paymentResult);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // fit: StackFit.expand,
        children: [
          page[selectedPage],

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: LayoutBuilder(builder: (context, constraints) {

                final width = constraints.maxWidth;

                return CustomPaint(
                  size: Size(width, (width*0.17).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                  painter: BottomAppBarPainter(),
                  child: SizedBox(
                    height: width*0.17,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        tabIcon(
                        title: 'Home',
                        txtColor: selectedPage == 0 ? kPrimaryColor : greyColor,
                        img: homeImage(
                          selectedPage == 0 ? kPrimaryColor : greyColor,
                        ),
                        onTap: () {
                          setState(() {
                            selectedPage = 0;
                          });
                        }),

                        tabIcon(
                            title: 'Darshan',
                            txtColor: selectedPage == 1 ? kPrimaryColor : greyColor,
                            img: searchImage(
                              selectedPage == 1 ? kPrimaryColor : greyColor,
                            ),
                            onTap: () {
                              setState(() {
                                selectedPage = 1;
                              });
                            }),

                        SizedBox(width: 40,),

                        tabIcon(
                            title: 'Gallery',
                            txtColor: selectedPage == 3 ? kPrimaryColor : greyColor,
                            img: galleryImage(
                              selectedPage == 3 ? kPrimaryColor : greyColor,
                            ),
                            onTap: () {
                              setState(() {
                                selectedPage = 3;
                              });
                            }),

                        tabIcon(
                            title: 'Event',
                            txtColor: selectedPage == 4 ? kPrimaryColor : greyColor,
                            img: eventImage(
                              selectedPage == 4 ? kPrimaryColor : greyColor,
                            ),
                            onTap: () {
                              setState(() {
                                selectedPage = 4;
                              });
                            })
                      ],
                    ),
                  ),
                );

              },),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(color: Colors.white,
              height: MediaQuery.of(context).padding.bottom,
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding:  EdgeInsets.only(bottom: 4.h),
                child: Center(
                  child: SafeArea(
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          selectedPage = 2;
                        });
                      },
                      child: Container(
                        height: 20.w,
                        width: 20.w,
                        decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(10.w)
                        ),
                        child: floatingBtn,
                      ),
                    ),
                  ),
                ),
              )),

        ],
      ),
    );
  }

  InkWell tabIcon(
      {@required String? title, Image? img, Color? txtColor, Function? onTap}) {
    return InkWell(
      onTap: () {
        onTap!();
      },
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              margin: EdgeInsets.only(top: 2.h), width: 5.w, child: img),
          Text(
            title ?? '',
            style: TextStyle(
                fontSize: 12.sp, fontWeight: FontWeight.w600, color: txtColor),
          )
        ],
      ),
    );
  }

}

class BottomAppBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(0,0);
    path_0.lineTo(size.width*0.2500000,0);
    path_0.lineTo(size.width*0.3013925,0);
    path_0.cubicTo(size.width*0.3331682,0,size.width*0.3632383,size.height*0.08310959,size.width*0.3831986,size.height*0.2260973);
    path_0.lineTo(size.width*0.4417804,size.height*0.6457649);
    path_0.cubicTo(size.width*0.4724626,size.height*0.8655459,size.width*0.5307430,size.height*0.8589608,size.width*0.5599159,size.height*0.6324176);
    path_0.lineTo(size.width*0.6098224,size.height*0.2448676);
    path_0.cubicTo(size.width*0.6296636,size.height*0.09078797,size.width*0.6609276,0,size.width*0.6941449,0);
    path_0.lineTo(size.width*0.7500000,0);
    path_0.lineTo(size.width,0);
    path_0.lineTo(size.width,size.height*1.079554);
    path_0.lineTo(size.width*0.4894860,size.height*1.079554);
    path_0.lineTo(0,size.height*1.079554);
    path_0.lineTo(0,0);
    path_0.close();

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_0,paint_0_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

