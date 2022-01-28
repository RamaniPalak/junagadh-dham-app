import 'package:flutter/material.dart';
import 'package:junagadh_temple/app/providers/auth_provider.dart';
import 'package:junagadh_temple/app/utils/api_response.dart';
import 'package:junagadh_temple/app/utils/constants.dart';
import 'package:junagadh_temple/app/utils/enums.dart';
import 'package:junagadh_temple/app/views/custom_popup_view.dart';
import 'package:junagadh_temple/app/views/loading_small.dart';
import 'package:provider/provider.dart';

abstract class BaseScreen {
  bool handleRes(
      {required ApiResponse res,
      required BuildContext context,
      Function? retryCall}) {
    if (res.state == Status.UNAUTHORISED) {
      // CustomPopup(context,
      //     title: 'Un-Authorised',
      //     message: '${res.msg}',
      //     primaryBtnTxt: 'Re-try', primaryAction: () {
      //   context.read<AuthProviderImpl>().unAuthorizeUser();
      // });
      return false;
    } else if (res.state == Status.ERROR) {
      if (retryCall == null) {
        CustomPopup(context,
            title: 'Sorry!', message: '${res.msg}', primaryBtnTxt: 'OK');
      } else {
        CustomPopup(context,
            title: 'Sorry!',
            message: '${res.msg}',
            primaryBtnTxt: 'Re-try',
            secondaryBtnTxt: 'Cancel'
          //  primaryAction: retryCall
        );
      }
      return false;
    } else {
      return true;
    }
  }

  Widget resContainer(
      {required ApiResponse res,
      required Widget successWidget,
      Function? retryCall}) {
    switch (res.state) {
      case Status.LOADING:
        return Center(
            child: LoadingSmall(
          color: kPrimaryColor,
          size: 44,
        ));
      case Status.COMPLETED:
        return successWidget;
      case Status.ERROR:
        return Container(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(res.msg ?? ""),
              TextButton(
                  onPressed: () {
                    if (retryCall != null) {
                      retryCall();
                    }
                  },
                  child: Text('ReTry'))
            ],
          )),
        );
      default:
        return Container(
          child: Text('Something Went Wrong.'),
        );
    }
  }
}
