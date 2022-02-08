import 'package:flutter/material.dart';
import 'package:junagadh_temple/app/utils/constants.dart';
import 'package:junagadh_temple/app/utils/sizer.dart';
import 'package:junagadh_temple/app/views/common_images.dart';
import 'package:url_launcher/url_launcher.dart';

class UPIDonationScreen extends StatelessWidget {
  const UPIDonationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 3.w),
      child: InkWell(
        onTap: (){
          try {
            launch('upi://pay?pa=MAB.037322031930045@axisbank&pn=Junagadh%20Temple');
          } catch (e) {
            print(e);
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 20.w,
              height: 20.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.w)
              ),
              child: upiImg,
            ),
            Container(
              margin: EdgeInsets.only(top: 2.h),
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
    );
  }
}
