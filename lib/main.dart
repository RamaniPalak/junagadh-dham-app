import 'package:flutter/material.dart';
import 'package:junagadh/app.dart';
import 'package:junagadh/providers_list.dart';
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

