import 'package:flutter/material.dart';
import 'package:junagadh_temple/app/providers/home_provider.dart';
import 'package:junagadh_temple/app/screens/notification/notification_screen.dart';
import 'package:junagadh_temple/app/utils/constants.dart';
import 'package:junagadh_temple/app/utils/enums.dart';
import 'package:junagadh_temple/app/utils/sizer.dart';
import 'package:junagadh_temple/app/views/bg_container.dart';
import 'package:junagadh_temple/app/views/common_images.dart';
import 'package:junagadh_temple/app/views/loading_small.dart';
import 'package:provider/provider.dart';

class TimingScreen extends StatefulWidget {
  const TimingScreen({Key? key}) : super(key: key);

  @override
  _TimingScreenState createState() => _TimingScreenState();
}

class _TimingScreenState extends State<TimingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      context.read<HomeProviderImpl>().getTiming();
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
          'Timing',
          style: kAuthTitleStyle,
        ),
        actions: [
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
          padding: EdgeInsets.all(4.w),
          child: SingleChildScrollView(
            child: timing(),
          ),
        ),
      ),
    );
  }

  Widget timing() {
    final time = context.watch<HomeProviderImpl>();
    final data = time.resTime?.data?.data;

    if (time.resTime?.state == Status.LOADING) {
      return Padding(
        padding:  EdgeInsets.only(top: 50),
        child: Center(
          child: LoadingSmall(
            color: kSecondary,
          ),
        ),
      );
    }

    return Container(
      decoration:
          BoxDecoration(color: kWhite, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: 1,
            shrinkWrap: true,
            padding: EdgeInsets.all(5.w),
            itemBuilder: (context, index) {
              return ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: (data?.morningTiming?.length ?? 0) + 2,
                shrinkWrap: true,
                //  padding: EdgeInsets.only(bottom: 3.w),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    //Header
                    return Container(
                      margin: EdgeInsets.only(bottom: 0.3.h),
                      padding:
                          EdgeInsets.only(bottom: 0.5.h, left: 2.w, right: 2.w),
                      child: Row(
                        children: [
                          Container(width: 40, height: 40, child: morningImage),
                          SizedBox(width: 2.w),
                          Expanded(
                            child: Text(
                              'Morning Timing',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18.sp,
                                  fontFamily: kRegularFonts,
                                  color: kSecondary),
                            ),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Colors.black, width: 0.1.h))),
                    );
                  } else if (index == (data?.morningTiming?.length ?? 0) + 1) {
                    // TODO:- Change the position 4 wth (item.length - 1)
                    //Footer
                    return Container(
                      padding: EdgeInsets.only(
                          bottom: 1.3.h, top: 1.3.h, left: 2.w, right: 2.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Text(
                                '${data?.darshanClosed?.darshanCloseTitel ?? '-'}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15.sp,
                                    fontFamily: kRegularFonts,
                                    color: Colors.black)),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(
                              '${data?.darshanClosed?.darshanCloseTime ?? '-'}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15.sp,
                                  fontFamily: kRegularFonts,
                                  color: Colors.black),
                              textAlign: TextAlign.right,
                            ),
                          )
                        ],
                      ),
                      decoration: const BoxDecoration(
                        color: Color(0xffFFF5D9),
                      ),
                    );
                  }

                  final morningData = data?.morningTiming?[index - 1];

                  return Container(
                    padding: EdgeInsets.only(bottom: 1.3.h, top: 1.3.h,left: 2.w, right: 2.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Text('${morningData?.aartiName ?? '-'}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.sp,
                                  fontFamily: kRegularFonts,
                                  color: Colors.black)),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            '${morningData?.aartiTime ?? '-'}',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15.sp,
                              color: Colors.black,
                              fontFamily: kRegularFonts,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(color: Colors.black, width: 0.1.h))),
                  );
                },
              );
            },
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: 1,
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 5.w, right: 5.w),
            itemBuilder: (context, index) {
              return ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: (data?.eveningTiming?.length ?? 0) + 2,
                shrinkWrap: true,
                padding: EdgeInsets.only(bottom: 3.w),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    //Header
                    return Container(
                      margin: EdgeInsets.only(bottom: 0.3.h),
                      padding:
                          EdgeInsets.only(bottom: 0.5.h, left: 2.w, right: 2.w),
                      child: Row(
                        children: [
                          Container(width: 40, height: 40, child: eveningImage),
                          SizedBox(width: 2.w),
                          Expanded(
                            child: Text(
                              'Evening Timing',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18.sp,
                                  fontFamily: kRegularFonts,
                                  color: kSecondary),
                            ),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Colors.black, width: 0.1.h))),
                    );
                  } else if (index == (data?.eveningTiming?.length ?? 0) + 1) {
                    // TODO:- Change the position 4 wth (item.length - 1)
                    //Footer
                    return Container(
                      padding: EdgeInsets.only(
                          bottom: 1.3.h, top: 1.3.h, left: 2.w, right: 2.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 4,
                            child: Text(
                                '${data?.shayanDarshanClosed?.shayanDarshanTitle ?? '-'}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15.sp,
                                    fontFamily: kRegularFonts,
                                    color: Colors.black)),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              '${data?.shayanDarshanClosed?.shayanDarshanTime ?? '-'}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15.sp,
                                  fontFamily: kRegularFonts,
                                  color: Colors.black),
                              textAlign: TextAlign.right,
                            ),
                          )
                        ],
                      ),
                      decoration: const BoxDecoration(
                        color: Color(0xffFFF5D9),
                      ),
                    );
                  }
                  return Container(
                    padding: EdgeInsets.only(bottom: 1.3.h, top: 1.3.h,left: 2.w, right: 2.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Text(
                              '${data?.eveningTiming?[index - 1].aartiName ?? '-'}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.sp,
                                  fontFamily: kRegularFonts,
                                  color: Colors.black)),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            '${data?.eveningTiming?[index - 1].aartiTime ?? '-'}',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15.sp,
                              color: Colors.black,
                              fontFamily: kRegularFonts,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(color: Colors.black, width: 0.1.h))),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
