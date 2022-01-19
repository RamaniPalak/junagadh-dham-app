import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:junagadh_temple/app/providers/auth_provider.dart';
import 'package:junagadh_temple/app/screens/dashboard/dashboard_screen.dart';
import 'package:provider/provider.dart';
import 'base_state_less.dart';

class LendingPage extends BaseStateLess{
   LendingPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final auth = context.watch<AuthProviderImpl>();

    final isLogin = auth.isLogin;

    if (isLogin == null){
      return Container(color: Colors.white);
    }

    return DashboardScreen();

    // if (isLogin){
    //   return HomeScreen();
    // }else{
    //   return LoginScreen();
    // }
  }
}
