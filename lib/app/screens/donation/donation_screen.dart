import 'package:flutter/material.dart';
import 'package:junagadh_temple/app/data/entity/res_donation.dart';
import 'package:junagadh_temple/app/providers/home_provider.dart';
import 'package:junagadh_temple/app/screens/donation/donation_webview.dart';
import 'package:junagadh_temple/app/screens/notification/notification_screen.dart';
import 'package:junagadh_temple/app/screens/timing/timing_screen.dart';
import 'package:junagadh_temple/app/utils/constants.dart';
import 'package:junagadh_temple/app/utils/enums.dart';
import 'package:junagadh_temple/app/utils/no_data_found_view.dart';
import 'package:junagadh_temple/app/utils/show_snack_bar.dart';
import 'package:junagadh_temple/app/utils/sizer.dart';
import 'package:junagadh_temple/app/views/bg_container.dart';
import 'package:junagadh_temple/app/views/common_images.dart';
import 'package:junagadh_temple/app/views/custom_popup_view.dart';
import 'package:junagadh_temple/app/views/loading_small.dart';
import 'package:junagadh_temple/app/views/upi_donation.dart';
import 'package:provider/provider.dart';

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
      final provider = context.read<HomeProviderImpl>();

      if(provider.resDonation?.data == null){
        provider.getDonation();
      }

    });
  }

  List<String> getData = <String>[];

  String? selectValue;

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
          InkWell(
            onTap: () {
              Navigator.of(context,rootNavigator: true).push(
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
          InkWell(
            onTap: () {
              Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(
                  builder: (context) => NotificationScreen()));
            },
            child: Padding(
              padding: EdgeInsets.all(3.5.w),
              child: Center(
                child: SizedBox(
                  width: 5.w,
                  height: 5.h,
                  child: notificationImage,
                ),
              ),
            ),
          ),
        ],
      ),
      body: BgContainer(
          child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: Column(
            children: [
              UPIDonationScreen(),
              donation()
            ],
          ),
        ),
      )),
    );
  }

  Widget donation() {
    final donation = context.watch<HomeProviderImpl>();
    final data = donation.donationList;

    final hasError = donation.resDonation?.state == Status.ERROR ||
        donation.resDonation?.state == Status.UNAUTHORISED;

    final isLoading = donation.resDonation?.state == Status.LOADING;

    if (isLoading){
      return Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Center(child: LoadingSmall()),
      );
    }

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

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 2.h),
            decoration: BoxDecoration(
                color: kWhite, borderRadius: BorderRadius.circular(2)),
            padding: EdgeInsets.only(top: 0.5.h, bottom: 0.5.h, left: 2.w),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                onChanged: (value) {
                  donation.setDonationList(value!);
                },
                value: donation.selectedValueDonation,
                hint: const Text(
                  "Please Select",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                style: TextStyle(
                    color: kSecondary,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600),
                isExpanded: true,
                iconSize: 10.w,
                iconEnabledColor: kSecondary,
                items: donation.donationCatList.map((String data) {
                  return DropdownMenuItem(
                    value: data,
                    child: Text('${data}'),
                  );
                }).toList(),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
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
                              border:
                              Border.all(color: kSecondary, width: 1.5.w)),
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
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:  EdgeInsets.only(left: 2.w,top: 3.w),
                                            child: Text(
                                              'Custom Amount',
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: kSecondary),
                                              maxLines: 4,
                                              textAlign: TextAlign.left,
                                              overflow: TextOverflow.clip,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsets.only(left: 2.w,right: 2.w),
                                                  child: Container(
                                                    height: 12.w,
                                                    margin: EdgeInsets.symmetric(vertical: 2.h),
                                                    decoration: BoxDecoration(
                                                        color: kWhite, borderRadius: BorderRadius.circular(2)),
                                                    padding: EdgeInsets.only(top: 0.5.h, bottom: 0.5.h, left: 2.w),
                                                    child: DropdownButtonHideUnderline(
                                                      child: DropdownButton<DonationData?>(
                                                        onChanged: (value) {
                                                          donation.setDonationType(value!);
                                                        },
                                                        value: donation.selectedDonationListForCustomDonation,
                                                        hint: const Text(
                                                          "Please Select",
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 14,
                                                              fontWeight: FontWeight.w500),
                                                        ),
                                                        style: TextStyle(
                                                            color: kSecondary,
                                                            fontSize: 18.sp,
                                                            fontWeight: FontWeight.w600),
                                                        isExpanded: true,
                                                        iconSize: 10.w,
                                                        iconEnabledColor: kSecondary,
                                                        items: donation.donationList?.map((DonationData data) {
                                                          print(data.name);
                                                          return DropdownMenuItem(
                                                            value: data,
                                                            child: Text('${data.name}'),
                                                          );
                                                        }).toList(),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  if(donation.selectedDonationListForCustomDonation == null){
                                                    ShowSnackBar(
                                                        context: this.context,
                                                        message: 'Please select type of donation.');
                                                    return;
                                                  }
                                                  CustomPopup(
                                                    this.context,
                                                    title: 'Donation',
                                                    primaryBtnTxt: 'OK',
                                                    secondaryBtnTxt: 'Cancel',
                                                    primaryAction: (p0) {
                                                      try {
                                                        print((donation.selectedDonationListForCustomDonation?.url1 ?? '') + p0);

                                                        if(p0.length > 6 )
                                                        {
                                                          throw 'Enter Valid Amount';
                                                        }

                                                        if(p0.isEmpty == true ||
                                                            int.parse(p0) <= 0){
                                                          throw 'Enter Amount';
                                                        }

                                                        Navigator.of(context)
                                                            .push(MaterialPageRoute(
                                                          builder: (context) =>
                                                              DonationWebViewScreen(
                                                                url: (donation.selectedDonationListForCustomDonation?.url1 ?? '') + p0,
                                                              ),
                                                        ));
                                                      } catch (e) {
                                                        ShowSnackBar(
                                                            context: this.context,
                                                            message: e.toString());
                                                      }
                                                    },
                                                  );
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    width: 20.w,
                                                    height: 5.h,
                                                    decoration: BoxDecoration(
                                                      color: kSecondary,
                                                      borderRadius:
                                                      BorderRadius.circular(5),
                                                    ),
                                                    child: Container(
                                                      child: Center(
                                                        child: Text(
                                                          'Donate',
                                                          style: kDonateButton,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
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
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.only(bottom: 10.h),
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
                                  border:
                                      Border.all(color: kSecondary, width: 1.5.w)),
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
                                            try {
                                              data?[index].donationPrice?.isEmpty ==
                                                          true ||
                                                      (int.parse(data?[index]
                                                                  .donationPrice ??
                                                              '0') <=
                                                          0)
                                                  ? CustomPopup(
                                                      this.context,
                                                      title: 'Donation',
                                                      primaryBtnTxt: 'OK',
                                                      secondaryBtnTxt: 'Cancel',
                                                      primaryAction: (p0) {
                                                        try {
                                                          print(p0);
                                                          print(p0.length);

                                                          if (p0.length > 6) {
                                                            throw 'Enter Valid Amount';
                                                          }

                                                          if (p0.isEmpty ==  true || int.parse(p0) <= 0) {
                                                            throw 'Enter Amount';
                                                          }

                                                          Navigator.of(context)
                                                              .push(
                                                                  MaterialPageRoute(
                                                            builder: (context) =>
                                                                DonationWebViewScreen(
                                                              url: (data?[index]
                                                                          .url ??
                                                                      '') +
                                                                  p0,
                                                            ),
                                                          ));
                                                          print((data?[index]
                                                                      .url ??
                                                                  '') +
                                                              p0);
                                                        } catch (e) {
                                                          ShowSnackBar(
                                                              context:
                                                                  this.context,
                                                              message:
                                                                  e.toString());
                                                        }
                                                      },
                                                    )
                                                  : Navigator.of(context)
                                                      .push(MaterialPageRoute(
                                                      builder: (context) =>
                                                          DonationWebViewScreen(
                                                        url: data?[index].url,
                                                      ),
                                                    ));
                                            } catch (e) {
                                              ShowSnackBar(
                                                  context: context,
                                                  message: e.toString());
                                            }
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.only(top: 1.h,bottom: 1.h),
                                            child: Container(
                                              width: 20.w,
                                              height: 6.h,
                                              decoration: BoxDecoration(
                                                color: kSecondary,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.only(top: 6),
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
