import 'package:flutter/material.dart';
import 'package:junagadh_temple/app/screens/donation/donation_screen.dart';
import 'package:junagadh_temple/app/screens/nav_screen/darshan_screen.dart';
import 'package:junagadh_temple/app/screens/nav_screen/event_screen.dart';
import 'package:junagadh_temple/app/screens/nav_screen/gallery_screen.dart';
import 'package:junagadh_temple/app/screens/nav_screen/home_screen.dart';
import 'package:junagadh_temple/app/utils/constants.dart';
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
    return Scaffold(
      backgroundColor: bg2,
      body: IndexedStack(index: selectedPage,
          children: [
            Navigator(
              key: _page1,
              onGenerateRoute: (route) => MaterialPageRoute(
                settings: route,
                builder: (context) =>  HomeScreen(),
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
            ]     //
              ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: 18.w,
        height: 18.h,
        color: Colors.transparent,
        child: FloatingActionButton(
          onPressed: () {
            // Navigator.of(context).push(
            //     MaterialPageRoute(builder: (context) => DonationScreen()));
            setState(() {
              selectedPage = 4;
            });
          },
          tooltip: 'Donation',
          child: CircleAvatar(radius: 70, child: floatingBtn),
          elevation: 0.0,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8,
        color: kWhite,
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
              SizedBox(width: 10.w),
              tabIcon(
                  title: 'Gallery',
                  txtColor: selectedPage == 2 ? kPrimaryColor : greyColor,
                  img: galleryImage(
                    selectedPage == 2 ? kPrimaryColor : greyColor,
                  ),
                  onTap: () {
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
                    setState(() {
                      selectedPage = 3;
                    });
                  }),
            ],
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
