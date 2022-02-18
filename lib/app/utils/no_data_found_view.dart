import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:junagadh/app/utils/constants.dart';
import 'package:junagadh/app/utils/sizer.dart';
import 'package:junagadh/app/views/base_button.dart';

class NoDataFoundView extends StatelessWidget {
  const NoDataFoundView({Key? key, this.retryCall, this.title})
      : super(key: key);

  final Function? retryCall;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 150,
      decoration: BoxDecoration(
          color: kSecondary,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text(
              title ?? 'No Data Found',
              style: TextStyle(color: Colors.white, fontSize: 18.sp),
            ),
          ),
          if (retryCall != null)
            Padding(
              padding:  EdgeInsets.only(top: 10),
              child: ButtonBorder(
                text: 'RETRY',
                onTap: () {
                  retryCall!();
                },
              ),
            )
        ],
      ),
    );
  }
}
