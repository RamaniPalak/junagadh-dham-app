import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:junagadh_temple/app/components/image_components.dart';
import 'package:junagadh_temple/app/data/datasource/home_data.dart';
import 'package:junagadh_temple/app/providers/home_provider.dart';
import 'package:junagadh_temple/app/repository/home_repo.dart';
import 'package:junagadh_temple/app/screens/imageview/darshan_view.dart';
import 'package:junagadh_temple/app/screens/notification/notification_screen.dart';
import 'package:junagadh_temple/app/screens/timing/timing_screen.dart';
import 'package:junagadh_temple/app/utils/constants.dart';
import 'package:junagadh_temple/app/utils/enums.dart';
import 'package:junagadh_temple/app/utils/no_data_found_view.dart';
import 'package:junagadh_temple/app/utils/sizer.dart';
import 'package:junagadh_temple/app/views/bg_container.dart';
import 'package:junagadh_temple/app/views/common_images.dart';
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
        builder: (BuildContext context, Widget ?child) {
          return Theme(
            data: ThemeData(
              fontFamily: kRegularFonts,
              colorScheme: ColorScheme.light(
                  primary: kSecondary,),
              dialogBackgroundColor: Colors.white,
            ),
            child: child ?? Text(""),
          );
        },
        initialDate: currentDate,
        firstDate: DateTime(currentDate.year, currentDate.month - 1, currentDate.day),
        lastDate: DateTime.now()
    );
    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        currentDate = pickedDate;
        context.read<HomeProviderImpl>().getDarshanFilter(
            date: DateFormat('yyyy-MM-dd').format(currentDate));
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      final provider = context.read<HomeProviderImpl>();

      // if(provider.resDarshanWithDate?.data == null){
        provider.getDailyDarshanDate();
      // }
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
          'Daily Darshan',
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
          child: Column(
            children: [
              darshanWidget()
            ],
          ),
        ),
      ),
    );
  }

  Widget darshanWidget() {
    final darshan = context.watch<HomeProviderImpl>();

    //final data = darshan.resDarshanWithDate?.data;

    if (darshan.resDarshanWithDate?.state == Status.LOADING) {
      return Center(
          child: CircularProgressIndicator(
        color: kSecondary,
      ));
    }

    final hasError = darshan.resDarshanWithDate?.state == Status.ERROR ||
        darshan.resDarshanWithDate?.state == Status.UNAUTHORISED;

    if (hasError) {
      return Container(
        alignment: Alignment.center,
        child: NoDataFoundView(
            retryCall: () {
              context.read<HomeProviderImpl>().getDailyDarshanDate();
            },
            title: 'No Data Found'),
      );
    }

    return Expanded(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 6.h,
                margin: EdgeInsets.only(bottom: 1.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: kSecondary,
                ),
                padding:
                EdgeInsets.symmetric(vertical: 1.w, horizontal: 2.w),
                child: Column(
                  children: [
                    Text(
                      darshan.selectedDates,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600),
                      maxLines: 2,
                    ),
                    Expanded(
                      child: Text(
                        darshan.selectedTithi,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600),
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 7.h,
                width: 40.w,
                child:  Container(
                  margin: EdgeInsets.only(bottom: 1.h),
                  decoration: BoxDecoration(
                      color: kSecondary, borderRadius: BorderRadius.circular(5)),
                  padding:
                  EdgeInsets.symmetric(vertical: 1.w, horizontal: 2.w),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      onChanged: (value) {
                        darshan.setDateForDarshan(value!);
                      },
                      value: darshan.selectedDates,
                      style: TextStyle(
                          color: kWhite,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500
                      ),
                      hint: Text(
                        "Please Select",
                        style: TextStyle(
                            color: kWhite,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      isExpanded: true,
                      iconSize: 10.w,
                      iconEnabledColor: kWhite,
                      dropdownColor: kSecondary,
                      items: darshan.darshanDates.map((String data) {
                        return DropdownMenuItem(
                          value: data,
                          child: Container(
                            color: kSecondary,
                            child: Text('${data}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600),),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            child: Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: darshan.selectedDarshan?.length ?? 0,
                padding: EdgeInsets.only(bottom: 15.h),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.6,
                    mainAxisSpacing: 4.w,
                    crossAxisSpacing: 4.w),
                itemBuilder: (context, index) {

                  final res = darshan.selectedDarshan?[index];

                  return buildColumn(
                    img: res?.thumburl,
                    title: res?.name,
                    text: res?.name1,
                    onTap: (){
                      Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(
                        builder: (context) => DarshanView(
                          url: res?.imageurl,
                        ),
                      ));
                    }
                  );

                  // if (index == 0) {
                  //   return buildColumn(
                  //       onTap: () {
                  //         Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(
                  //           builder: (context) => DarshanView(
                  //             url: data?.shreeHarikarishnaMaharajAndShreeRadharamanDev
                  //                 ?.shreeHarikarishnaMaharajAndShreeRadharamanDevImage,
                  //           ),
                  //         ));
                  //       },
                  //       img:
                  //           '${data?.shreeHarikarishnaMaharajAndShreeRadharamanDev?.shreeHarikarishnaMaharajAndShreeRadharamanDevImage}',
                  //       text: data?.shreeHarikarishnaMaharajAndShreeRadharamanDev
                  //           ?.shreeHarikarishnaMaharajHeading,
                  //       title: data?.shreeHarikarishnaMaharajAndShreeRadharamanDev
                  //           ?.shreeRadharamanDevHeading);
                  // }
                  // if (index == 1) {
                  //   return buildColumn(
                  //       onTap: () {
                  //         Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(
                  //           builder: (context) => DarshanView(
                  //             url: data?.shreeRanchhodraijiAndShreeTrikamrayji
                  //                 ?.shreeRanchhodraijiAndShreeTrikamrayjiImage,
                  //           ),
                  //         ));
                  //       },
                  //       img:
                  //           '${data?.shreeRanchhodraijiAndShreeTrikamrayji?.shreeRanchhodraijiAndShreeTrikamrayjiImage}',
                  //       text: data?.shreeRanchhodraijiAndShreeTrikamrayji
                  //           ?.shreeRanchhodraijiHeading,
                  //       title: data?.shreeRanchhodraijiAndShreeTrikamrayji
                  //           ?.shreeTrikamrayjiHeading);
                  // }
                  // if (index == 2) {
                  //   return buildColumn(
                  //       onTap: () {
                  //         Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(
                  //           builder: (context) => DarshanView(
                  //             url: data?.shreeSiddheshwarMahadevAndShreeParvatiji
                  //                 ?.shreeSiddheshwarMahadevAndShreeParvatijiImage,
                  //           ),
                  //         ));
                  //       },
                  //       img:
                  //           '${data?.shreeSiddheshwarMahadevAndShreeParvatiji?.shreeSiddheshwarMahadevAndShreeParvatijiImage}',
                  //       text:
                  //           ' ${data?.shreeSiddheshwarMahadevAndShreeParvatiji?.shreeSiddheshwarMahadevHeading} ',
                  //       title:
                  //           ' ${data?.shreeSiddheshwarMahadevAndShreeParvatiji?.shreeParvatijiHeading} ');
                  // }
                  // if (index == 3) {
                  //   return buildColumn(
                  //       onTap: () {
                  //         Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(
                  //           builder: (context) => DarshanView(
                  //             url: data
                  //                 ?.shreeGaneshjiMaharaj?.shreeGaneshjiMaharajImage,
                  //           ),
                  //         ));
                  //       },
                  //       img:
                  //           '${data?.shreeGaneshjiMaharaj?.shreeGaneshjiMaharajImage}',
                  //       text: data?.shreeGaneshjiMaharaj?.shreeGaneshjiMaharajHeading,
                  //       title: data?.shreeGaneshjiMaharaj?.shreeGaneshjiMaharaj);
                  // }
                  // if (index == 4) {
                  //   return buildColumn(
                  //       onTap: () {
                  //         Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(
                  //           builder: (context) => DarshanView(
                  //             url: data?.shreeGhanshyamjiMaharaj
                  //                 ?.shreeGhanshyamjiMaharajImage,
                  //           ),
                  //         ));
                  //       },
                  //       img:
                  //           '${data?.shreeGhanshyamjiMaharaj?.shreeGhanshyamjiMaharajImage}',
                  //       text: data
                  //           ?.shreeGhanshyamjiMaharaj?.shreeGhanshyamjiMaharajHeading,
                  //       title:
                  //           data?.shreeGhanshyamjiMaharaj?.shreeGhanshyamjiMaharaj);
                  // }
                  // if (index == 5) {
                  //   return buildColumn(
                  //       onTap: () {
                  //         Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(
                  //           builder: (context) => DarshanView(
                  //             url: data
                  //                 ?.shreeHanumanjiMaharaj?.shreeHanumanjiMaharajImage,
                  //           ),
                  //         ));
                  //       },
                  //       img:
                  //           '${data?.shreeHanumanjiMaharaj?.shreeHanumanjiMaharajImage}',
                  //       text:
                  //           ' ${data?.shreeHanumanjiMaharaj?.shreeHanumanjiMaharajHeading} ',
                  //       title:
                  //           ' ${data?.shreeHanumanjiMaharaj?.shreeHanumanjiMaharaj}');
                  // }
                  return buildColumn();
                },
              ),
            ),
          ),
        ],
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
