import 'package:flutter/material.dart';
import 'package:junagadh_temple/app/utils/constants.dart';

class BgContainer extends StatelessWidget {
  BgContainer({Key? key, this.child}) : super(key: key);

  Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              tileMode: TileMode.clamp,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [bg1, bg2, bg1])),
      child: child,
    );
  }
}

class BgButton extends StatelessWidget {
  BgButton({Key? key, this.child}) : super(key: key);

  Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            tileMode: TileMode.clamp,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xffd59c28), Color(0xffFFECB3)]),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          border: Border.all(color: kSecondary, width: 1.5),
          borderRadius: BorderRadius.circular(22),
        ),
        child: child,
      ),
    );
  }
}
