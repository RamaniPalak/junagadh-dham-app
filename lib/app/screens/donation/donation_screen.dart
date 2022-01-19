import 'package:flutter/material.dart';
import 'package:junagadh_temple/app/screens/notification/notification_screen.dart';
import 'package:junagadh_temple/app/screens/timing/timing_screen.dart';
import 'package:junagadh_temple/app/utils/constants.dart';
import 'package:junagadh_temple/app/utils/sizer.dart';
import 'package:junagadh_temple/app/views/bg_container.dart';
import 'package:junagadh_temple/app/views/common_images.dart';

class DonationScreen extends StatefulWidget {
  const DonationScreen({Key? key}) : super(key: key);

  @override
  _DonationScreenState createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Donation',
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
              child: Container(
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
        padding: EdgeInsets.all(4.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    children: [
                      Text('0123456789',
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w400)),
                      Container(
                        padding: EdgeInsets.only(top: 1.h, bottom: 1.h),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(11.w / 2),
                          child: Container(
                            height: 11.w,
                            width: 11.w,
                            child: phonepayBtn,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: kSecondary,
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 1.w, horizontal: 2.5.w),
                        child: Text(
                          'Donate',
                          style:
                              TextStyle(color: kWhite, fontSize: 14.sp),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Text('0123456789',
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w400)),
                      Container(
                        padding: EdgeInsets.only(top: 1.h, bottom: 1.h),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(11.w / 2),
                          child: Container(
                            height: 11.w,
                            width: 11.w,
                            child: paytmBtn,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: kSecondary,
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 1.w, horizontal: 2.5.w),
                        child: Text(
                          'Donate',
                          style:
                              TextStyle(color: Colors.white, fontSize: 14.sp),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Text('0123456789',
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w400)),
                      Container(
                        padding: EdgeInsets.only(top: 1.h, bottom: 1.h),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(11.w / 2),
                          child: Container(
                            height: 11.w,
                            width: 11.w,
                            child: googlepayBtn,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: kSecondary,
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 1.w, horizontal: 2.5.w),
                        child: Text(
                          'Donate',
                          style:
                          kDonateButton,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 2.h),
              decoration: BoxDecoration(
                  color: kWhite, borderRadius: BorderRadius.circular(2)),
              padding: EdgeInsets.only(top: 0.5.h, bottom: 0.5.h, left: 2.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sarve Devone Shreethaal',
                    style: TextStyle(color: kSecondary, fontSize: 18.sp),
                  ),
                  Icon(
                    Icons.arrow_drop_down_rounded,
                    size: 10.w,
                    color: kSecondary,
                  )
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.15,
                    crossAxisSpacing: 4.w,
                    mainAxisSpacing: 5.w),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.yellow.withOpacity(0.1), width: 1.w),
                        color: kLightYellow),
                    child: Container(
                      margin: EdgeInsets.all(1.w),
                      decoration:
                          BoxDecoration(border: Border.all(color: kSecondary)),
                      child: Container(
                        margin: EdgeInsets.all(1.w),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: kSecondary, width: 1.5.w)),
                        padding: EdgeInsets.all(1.5.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 14.w,
                              height: 14.w,
                              decoration: BoxDecoration(
                                  color: kSecondary,
                                  borderRadius: BorderRadius.circular(14.w / 2),
                                  border: Border.all(
                                      color: Colors.white, width: 3)),
                              child: Center(
                                child: Text(
                                  '₹\n1.5k',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Text(
                              'Magaj',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: kSecondary),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: kSecondary,
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 1.w, horizontal: 2.5.w),
                              child: Text(
                                'Donate',
                                style: kDonateButton,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}
