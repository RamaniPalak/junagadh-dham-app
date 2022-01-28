import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:junagadh_temple/app/components/image_components.dart';
import 'package:junagadh_temple/app/data/entity/res_darshanfilter.dart';
import 'package:junagadh_temple/app/providers/home_provider.dart';
import 'package:junagadh_temple/app/screens/imageview/darshan_view.dart';
import 'package:junagadh_temple/app/screens/notification/notification_screen.dart';
import 'package:junagadh_temple/app/screens/timing/timing_screen.dart';
import 'package:junagadh_temple/app/utils/constants.dart';
import 'package:junagadh_temple/app/utils/enums.dart';
import 'package:junagadh_temple/app/utils/no_data_found_view.dart';
import 'package:junagadh_temple/app/utils/sizer.dart';
import 'package:junagadh_temple/app/views/bg_container.dart';
import 'package:junagadh_temple/app/views/common_images.dart';
import 'package:junagadh_temple/app/views/loading_small.dart';
import 'package:provider/provider.dart';

class DarshanScreen extends StatefulWidget {
  const DarshanScreen({Key? key}) : super(key: key);

  @override
  _DarshanScreenState createState() => _DarshanScreenState();
}

class _DarshanScreenState extends State<DarshanScreen> {
  DateTime currentDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate:
            DateTime(currentDate.year, currentDate.month - 1, currentDate.day),
        lastDate: DateTime.now());
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
        context.read<HomeProviderImpl>().getDarshanFilter(
            date: DateFormat('yyyy-MM-dd').format(currentDate));
      });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      context
          .read<HomeProviderImpl>()
          .getDarshanFilter(date: DateFormat('yyyy-MM-dd').format(currentDate));
    });
  }

  @override
  Widget build(BuildContext context) {
    final darshan = context.watch<HomeProviderImpl>();
    final data = darshan.resDarshanFilter?.data?.response?.data;

    print(data?.dailyDarshanTithi?.length);

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Daily Darshan',
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
                    margin: EdgeInsets.only(bottom: 1.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: kSecondary,
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 1.w, horizontal: 2.5.w),
                    child: Column(
                      children: [
                        Text(
                          '${data?.dailyDarshanDate ?? '-'}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600),
                          maxLines: 2,
                        ),
                        Text(
                          '${data?.dailyDarshanTithi ?? '-'}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600),
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.only(bottom: 1.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: kSecondary,
                      ),
                      padding: EdgeInsets.only(
                          left: 2.w, right: 1.w, top: 1.w, bottom: 1.w),
                      child: Row(
                        children: [
                          Text(
                            '${DateFormat.yMd().format(currentDate)}',
                            style: TextStyle(
                                color: kWhite,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          Icon(Icons.keyboard_arrow_down_rounded,
                              color: kWhite, size: 7.w)
                        ],
                      ),
                    ),
                  )
                ],
              ),
              darshanWidget()
            ],
          ),
        ),
      ),
    );
  }

  Widget darshanWidget() {
    final darshan = context.watch<HomeProviderImpl>();
    final data = darshan.resDarshanFilter?.data?.response?.data;

    if (darshan.resDarshanFilter?.state == Status.LOADING) {
      return Center(
          child: CircularProgressIndicator(
        color: kSecondary,
      ));
    }

    final hasError = darshan.resDarshanFilter?.state == Status.ERROR ||
        darshan.resDarshanFilter?.state == Status.UNAUTHORISED;

    if (hasError) {
      return Center(
          child: Container(
        child: NoDataFoundView(
            retryCall: () {
              context.read<HomeProviderImpl>().getDarshanFilter(
                  date: DateFormat('yyyy-MM-dd').format(currentDate));
            },
            title: 'No Data Found'),
      ));
    }

    return Container(
      child: Expanded(
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: 6,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.6,
              mainAxisSpacing: 4.w,
              crossAxisSpacing: 4.w),
          itemBuilder: (context, index) {
            if (index == 0) {
              return buildColumn(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DarshanView(
                        url: data?.shreeHarikarishnaMaharajAndShreeRadharamanDev
                            ?.shreeHarikarishnaMaharajAndShreeRadharamanDevImage,
                      ),
                    ));
                  },
                  img:
                      '${data?.shreeHarikarishnaMaharajAndShreeRadharamanDev?.shreeHarikarishnaMaharajAndShreeRadharamanDevImage}',
                  text: data?.shreeHarikarishnaMaharajAndShreeRadharamanDev
                      ?.shreeHarikarishnaMaharajHeading,
                  title: data?.shreeHarikarishnaMaharajAndShreeRadharamanDev
                      ?.shreeRadharamanDevHeading);
            }
            if (index == 1) {
              return buildColumn(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DarshanView(
                        url: data?.shreeRanchhodraijiAndShreeTrikamrayji
                            ?.shreeRanchhodraijiAndShreeTrikamrayjiImage,
                      ),
                    ));
                  },
                  img:
                      '${data?.shreeRanchhodraijiAndShreeTrikamrayji?.shreeRanchhodraijiAndShreeTrikamrayjiImage}',
                  text: data?.shreeRanchhodraijiAndShreeTrikamrayji
                      ?.shreeRanchhodraijiHeading,
                  title: data?.shreeRanchhodraijiAndShreeTrikamrayji
                      ?.shreeTrikamrayjiHeading);
            }
            if (index == 2) {
              return buildColumn(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DarshanView(
                        url: data?.shreeSiddheshwarMahadevAndShreeParvatiji
                            ?.shreeSiddheshwarMahadevAndShreeParvatijiImage,
                      ),
                    ));
                  },
                  img:
                      '${data?.shreeSiddheshwarMahadevAndShreeParvatiji?.shreeSiddheshwarMahadevAndShreeParvatijiImage}',
                  text:
                      ' ${data?.shreeSiddheshwarMahadevAndShreeParvatiji?.shreeSiddheshwarMahadevHeading} ',
                  title:
                      ' ${data?.shreeSiddheshwarMahadevAndShreeParvatiji?.shreeParvatijiHeading} ');
            }
            if (index == 3) {
              return buildColumn(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DarshanView(
                        url: data
                            ?.shreeGaneshjiMaharaj?.shreeGaneshjiMaharajImage,
                      ),
                    ));
                  },
                  img:
                      '${data?.shreeGaneshjiMaharaj?.shreeGaneshjiMaharajImage}',
                  text: data?.shreeGaneshjiMaharaj?.shreeGaneshjiMaharajHeading,
                  title: data?.shreeGaneshjiMaharaj?.shreeGaneshjiMaharaj);
            }
            if (index == 4) {
              return buildColumn(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DarshanView(
                        url: data?.shreeGhanshyamjiMaharaj
                            ?.shreeGhanshyamjiMaharajImage,
                      ),
                    ));
                  },
                  img:
                      '${data?.shreeGhanshyamjiMaharaj?.shreeGhanshyamjiMaharajImage}',
                  text: data
                      ?.shreeGhanshyamjiMaharaj?.shreeGhanshyamjiMaharajHeading,
                  title:
                      data?.shreeGhanshyamjiMaharaj?.shreeGhanshyamjiMaharaj);
            }
            if (index == 5) {
              return buildColumn(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DarshanView(
                        url: data
                            ?.shreeHanumanjiMaharaj?.shreeHanumanjiMaharajImage,
                      ),
                    ));
                  },
                  img:
                      '${data?.shreeHanumanjiMaharaj?.shreeHanumanjiMaharajImage}',
                  text:
                      ' ${data?.shreeHanumanjiMaharaj?.shreeHanumanjiMaharajHeading} ',
                  title:
                      ' ${data?.shreeHanumanjiMaharaj?.shreeHanumanjiMaharaj}');
            }
            return buildColumn();
          },
        ),
      ),
    );
  }

  InkWell buildColumn(
      {String? title, String? img, String? text, Function? onTap}) {
    return InkWell(
      onTap: () {
        onTap!();
      },
      child: Column(
        children: [
          CustomShapedImage(
            width: 35.w,
            url: img ?? '',
          ),
          SizedBox(
            height: 1.5.w,
          ),
          Text(
            title ?? '-',
            style: kDarshanImg,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 1.w,
          ),
          Text(
            text ?? '-',
            style: kDarshanImg,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 2.w,
          ),
        ],
      ),
    );
  }
}
