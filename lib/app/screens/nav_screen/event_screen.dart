import 'package:flutter/material.dart';
import 'package:junagadh_temple/app/providers/home_provider.dart';
import 'package:junagadh_temple/app/screens/notification/notification_screen.dart';
import 'package:junagadh_temple/app/screens/timing/timing_screen.dart';
import 'package:junagadh_temple/app/utils/constants.dart';
import 'package:junagadh_temple/app/utils/enums.dart';
import 'package:junagadh_temple/app/utils/no_data_found_view.dart';
import 'package:junagadh_temple/app/utils/sizer.dart';
import 'package:junagadh_temple/app/views/bg_container.dart';
import 'package:junagadh_temple/app/views/common_images.dart';
import 'package:junagadh_temple/app/views/network_image.dart';
import 'package:provider/provider.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      context.read<HomeProviderImpl>().getEvent();
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
        child: event(),
      ),
    );
  }

  Widget event() {
    final event = context.watch<HomeProviderImpl>();

    if (event.resEvent?.state == Status.LOADING) {
      return CircularProgressIndicator(
        color: kSecondary,
      );
    }

    final hasError = event.resEvent?.state == Status.ERROR ||
        event.resEvent?.state == Status.UNAUTHORISED;

    if (hasError) {
      return Center(
          child: Container(
            child: NoDataFoundView(
            retryCall: () {
              context.read<HomeProviderImpl>().getEvent();
            },
            title: 'No Data Found'),
      ));
    }

    final data = event.resEvent?.data;

    return Container(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: ListView.builder(
          itemCount: data?.length,
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
                    child: CustomNetWorkImage(
                      url: '${data?[index].data?.first.blogImage}',
                      fit: BoxFit.cover,
                    ),
                    margin: EdgeInsets.only(right: 2.w),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data?[index].data?.first.eventTitle ?? '-',
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          data?[index].data?.first.eventTitle ?? '-',
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          data?[index].data?.first.eventDescription ?? '-',
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
      ),
    );
  }
}
