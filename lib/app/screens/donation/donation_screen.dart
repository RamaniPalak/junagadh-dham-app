import 'package:flutter/material.dart';
import 'package:junagadh_temple/app/data/entity/res_donation.dart';
import 'package:junagadh_temple/app/providers/home_provider.dart';
import 'package:junagadh_temple/app/screens/donation/donation_webview.dart';
import 'package:junagadh_temple/app/screens/notification/notification_screen.dart';
import 'package:junagadh_temple/app/screens/timing/timing_screen.dart';
import 'package:junagadh_temple/app/utils/constants.dart';
import 'package:junagadh_temple/app/utils/enums.dart';
import 'package:junagadh_temple/app/utils/no_data_found_view.dart';
import 'package:junagadh_temple/app/utils/sizer.dart';
import 'package:junagadh_temple/app/views/bg_container.dart';
import 'package:junagadh_temple/app/views/common_images.dart';
import 'package:junagadh_temple/app/views/custom_popup_view.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DonationScreen extends StatefulWidget {
  const DonationScreen({Key? key}) : super(key: key);

  @override
  _DonationScreenState createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      context.read<HomeProviderImpl>().getDonation();
    });
  }

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
                          style: TextStyle(color: kWhite, fontSize: 14.sp),
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
                          style: kDonateButton,
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
            donation()
          ],
        ),
      )),
    );
  }

  Widget donation() {
    final donation = context.watch<HomeProviderImpl>();
    final data = donation.resDonation?.data?.data;


    final hasError = donation.resDonation?.state == Status.ERROR ||
        donation.resDonation?.state == Status.UNAUTHORISED;

    if (hasError) {
      return Center(
          child: Container(
            child: NoDataFoundView(
                retryCall: () {
                  context.read<HomeProviderImpl>().getDonation();
                },
                title: 'No Data Found'),
          ));
    }


    print('donation${data?.length}');

    return Container(
      child: Expanded(
        child: ListView.builder(
          itemCount: data?.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Container(
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
                        border: Border.all(color: kSecondary, width: 1.5.w)),
                    padding:
                        EdgeInsets.only(left: 1.w, right: 1.w, bottom: 1.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  '${data?[index].name}',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                      color: kSecondary),
                                  maxLines: 4,
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  data?[index].donationPrice?.isEmpty == true
                                      ? CustomPopup(
                                          context,
                                          title: 'Donation',
                                          primaryBtnTxt: 'OK',
                                          secondaryBtnTxt: 'Cancel',
                                          primaryAction: (p0) {
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(
                                              builder: (context) =>
                                                  DonationWebViewScreen(
                                                url: (data?[index].url ?? '')  + p0,
                                              ),
                                            ));
                                            print((data?[index].url ?? '')  + p0);
                                          },
                                        )
                                      : Navigator.of(context)
                                          .push(MaterialPageRoute(
                                          builder: (context) =>
                                              DonationWebViewScreen(
                                            url: data?[index].url,
                                          ),
                                        ));
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(top: 1.h),
                                  child: Container(
                                    width: 23.w,
                                    height: 6.h,
                                    decoration: BoxDecoration(
                                      color: kSecondary,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(top: 10),
                                          child: Text(
                                            'Donate',
                                            style: kDonateButton,
                                          ),
                                        ),
                                        Center(
                                          child: Text(
                                            '₹${data?[index].donationPrice ?? '-'}',
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
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
