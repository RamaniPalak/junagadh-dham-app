
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:junagadh_temple/app/screens/lending_page.dart';
import 'package:junagadh_temple/app/utils/constants.dart';
import 'package:junagadh_temple/app/utils/sizer.dart';

Widget app(){

  return Sizer(builder: (context, orientation, deviceType) {
    return MaterialApp(
      title: 'Junagadh',
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      theme: ThemeData(
         fontFamily: kRegularFonts,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
            backgroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle(
            // Status bar color
            statusBarColor: kPrimaryColor,

          ),
            elevation: 0,
             foregroundColor: kPrimaryColor,
            centerTitle: true,
            backwardsCompatibility: false,
          titleTextStyle: TextStyle(
               fontFamily: kRegularFonts,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black
            ),
        ),
        // scaffoldBackgroundColor: Colors.white,
        // primarySwatch: Colors.blue,
      ),
      home: LendingPage(),
      // initialRoute: kInitialRoute,
      // routes: {
      //   kInitialRoute: (context) => LendingPage(),
      //   kLoginRoute: (context) => LoginScreen(),
      //   kHomeRoute: (context) => HomeScreen()
      // },
    );
  },);
}