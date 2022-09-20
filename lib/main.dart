 import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_voltzone/presentation/provider/filter_provider.dart';
import 'package:flutter_voltzone/presentation/provider/map_provider.dart';
import 'package:flutter_voltzone/presentation/provider/search_provider.dart';
import 'package:flutter_voltzone/presentation/screen/filter_screen.dart';
import 'package:flutter_voltzone/presentation/screen/map_screen.dart';
import 'package:flutter_voltzone/presentation/screen/search_screen.dart';
import 'package:flutter_voltzone/presentation/screen/station_detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'presentation/provider/station_detail_provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => MapProvider()),
    ChangeNotifierProvider(create: (_) => FilterProvider()),
    ChangeNotifierProvider(create: (_) => StationDetailProvider()),
    ChangeNotifierProvider(create: (_) => SearchProvider()),

  ],
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder:  (context, orientation, screenType) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home:  const MapScreen(),
        );
      }
    );
  }
}
