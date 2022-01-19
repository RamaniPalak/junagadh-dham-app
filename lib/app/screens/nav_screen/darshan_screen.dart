import 'package:flutter/material.dart';
import 'package:junagadh_temple/app/components/image_components.dart';
import 'package:junagadh_temple/app/screens/nav_screen/gallery_screen.dart';
import 'package:junagadh_temple/app/screens/nav_screen/home_screen.dart';
import 'package:junagadh_temple/app/screens/notification/notification_screen.dart';
import 'package:junagadh_temple/app/screens/timing/timing_screen.dart';
import 'package:junagadh_temple/app/utils/constants.dart';
import 'package:junagadh_temple/app/utils/sizer.dart';
import 'package:junagadh_temple/app/views/bg_container.dart';
import 'package:junagadh_temple/app/views/common_images.dart';


class DarshanScreen extends StatefulWidget {
  const DarshanScreen({Key? key}) : super(key: key);

  @override
  _DarshanScreenState createState() => _DarshanScreenState();
}

class _DarshanScreenState extends State<DarshanScreen> {


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
          Padding(
            padding: EdgeInsets.only(right: 4.w),
            child: InkWell(
              onTap: (){
                Navigator.of(context)
                    .push(MaterialPageRoute(
                    builder: (context) =>
                        TimingScreen()));
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
              onTap: (){
                Navigator.of(context)
                    .push(MaterialPageRoute(
                    builder: (context) =>
                        NotificationScreen()));
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
                    padding: EdgeInsets.symmetric(
                        vertical: 1.w, horizontal: 2.5.w),
                    child: Text(
                      '22-12-2022 \n(Posh Sud 4)',
                      style:
                      TextStyle(color: Colors.white, fontSize: 16.sp,fontWeight: FontWeight.w600),
                      maxLines: 2,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 1.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: kSecondary,
                    ),
                    padding: EdgeInsets.only(
                        left: 2.w, right: 1.w,
                        top: 1.w,bottom: 1.w
                    ),
                    child: Row(
                      children: [
                        Text(
                          '22-12-2022',
                          style:
                          TextStyle(color: kWhite, fontSize: 16.sp,fontWeight: FontWeight.w600),
                        ),
                        Icon(Icons.keyboard_arrow_down_rounded,color: kWhite,size: 7.w)
                      ],
                    ),
                  )
                ],
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: 10,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.57,
                      mainAxisSpacing: 4.w,
                      crossAxisSpacing: 4.w),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Expanded(
                          child: SizedBox(
                            width: 40.w,
                            child: MaskedImage(
                                mask: 'assets/images/bg_mask.png',
                                asset: 'https://wallpaperaccess.com/full/6787843.jpg'),
                          ),
                        ),
                        SizedBox(height: 1.5.w,),
                        Text('|| Shree Harikarishna Maharaj ||',style: kDarshanImg,textAlign: TextAlign.center,),
                        SizedBox(height: 1.w,),
                        Text('|| Shree RadhaRaman Dev ||',style: kDarshanImg,textAlign: TextAlign.center,),
                        SizedBox(height: 2.w,),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


