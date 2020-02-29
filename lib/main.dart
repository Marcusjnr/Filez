import 'dart:io';

import 'package:filez/providers/app_provider.dart';
import 'package:filez/providers/core_provider.dart';
import 'package:filez/providers/category_provider.dart';
import 'package:filez/screens/ios_error.dart';
import 'package:filez/screens/splash.dart';
import 'package:filez/util/consts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
        ChangeNotifierProvider(create: (_) => CoreProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (BuildContext context, AppProvider appProvider, Widget child) {
        return MaterialApp(
          key: appProvider.key,
          debugShowCheckedModeBanner: false,
          navigatorKey: appProvider.navigatorKey,
          title: Constants.appName,
          theme: appProvider.theme,
          darkTheme: Constants.darkTheme,
          home: Platform.isIOS?IosError():Splash(),
        );
      },
    );
  }
}