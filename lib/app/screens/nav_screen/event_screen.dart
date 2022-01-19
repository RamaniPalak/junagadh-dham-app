import 'package:flutter/material.dart';
import 'package:junagadh_temple/app/screens/notification/notification_screen.dart';
import 'package:junagadh_temple/app/screens/timing/timing_screen.dart';
import 'package:junagadh_temple/app/utils/constants.dart';
import 'package:junagadh_temple/app/utils/sizer.dart';
import 'package:junagadh_temple/app/views/bg_container.dart';
import 'package:junagadh_temple/app/views/common_images.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Event',
          style: kAuthTitleStyle,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 4.w),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => TimingScreen()));
              },
              child: Container(
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
      body: BgContainer(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
           child: ListView.builder(
              itemCount: 10,
              padding: EdgeInsets.all(4.w),
              itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(top: 1.h),
              padding: EdgeInsets.only(bottom: 1.h),
              decoration:  BoxDecoration(
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '15 Aug 2021',
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Gurupurnima, Aashadh Sud 15',
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pulvinar senectus auctor mi mauris, leo nunc consectetur. Eget nibh tortor, congue arcu. Eget malesuada donec enim ut ac ac aliquam sem nunc vel non.',
                          maxLines: 5,
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.w400),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      )),
    );
  }
}
