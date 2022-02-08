import 'package:flutter/material.dart';
import 'package:junagadh_temple/app/screens/timing/timing_screen.dart';
import 'package:junagadh_temple/app/utils/constants.dart';
import 'package:junagadh_temple/app/utils/sizer.dart';
import 'package:junagadh_temple/app/views/bg_container.dart';
import 'package:junagadh_temple/app/views/common_images.dart';

class NotificationScreen extends StatefulWidget {
  NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Notification',
          style: kAuthTitleStyle,
        ),
        actions: [
          // InkWell(
          //   onTap: () {
          //     Navigator.of(context,rootNavigator: true).push(
          //         MaterialPageRoute(builder: (context) => TimingScreen()));
          //   },
          //   child: Padding(
          //     padding: EdgeInsets.all(3.5.w),
          //     child: Center(
          //       child: SizedBox(
          //         width: 5.w,
          //         height: 5.h,
          //         child: clockIconImage,
          //       ),
          //     ),
          //   ),
          // ),
          // InkWell(
          //   onTap: () {
          //     Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(
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
      body: BgContainer(
        child: Padding(
          padding: EdgeInsets.only(bottom: 3.h),
          child: ListView.builder(
            itemCount: 10,
            padding: EdgeInsets.all(4.w),
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(top: 1.h),
                padding: EdgeInsets.only(bottom: 1.h),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: dividerColor))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 25.w,
                      height: 25.w,
                      child: Image.network(
                        'https://wallpaperaccess.com/full/4565288.jpg',
                        fit: BoxFit.cover,
                      ),
                      margin: EdgeInsets.only(right: 2.w),
                    ),
                    Expanded(
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pulvinar senectus auctor mi mauris, leo nunc consectetur. Eget nibh tortor, congue arcu. Eget malesuada donec enim ut ac ac aliquam sem nunc vel non.',
                        maxLines: 6,
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
