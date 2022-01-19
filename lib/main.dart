import 'package:flutter/material.dart';
import 'package:junagadh_temple/app.dart';
import 'package:junagadh_temple/app/screens/nav_screen/home_screen.dart';
import 'package:junagadh_temple/providers_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return multiProvider();
  }
}


Widget multiProvider(){
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => authProvider),
      ChangeNotifierProvider(create: (_) => homeProvider),
    ],
    child: app(),
  );
}

