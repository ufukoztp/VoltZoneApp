import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_voltzone/presentation/provider/Policy_Provider.dart';
import 'package:flutter_voltzone/presentation/provider/filter_provider.dart';
import 'package:flutter_voltzone/presentation/provider/map_provider.dart';
import 'package:flutter_voltzone/presentation/provider/search_provider.dart';
import 'package:flutter_voltzone/presentation/screen/filter_screen.dart';
import 'package:flutter_voltzone/presentation/screen/map_screen.dart';
import 'package:flutter_voltzone/presentation/screen/search_screen.dart';
import 'package:flutter_voltzone/presentation/screen/station_detail_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'presentation/provider/station_detail_provider.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp();
  runApp( MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => MapProvider()),
    ChangeNotifierProvider(create: (_) => FilterProvider()),
    ChangeNotifierProvider(create: (_) => StationDetailProvider()),
    ChangeNotifierProvider(create: (_) => SearchProvider()),
    ChangeNotifierProvider(create: (_) => PolicyProvider()),

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
          title: 'VoltZones',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MapScreen(),
        );
      }
    );
  }
}

///loader section

Loader? loader;

void showLoader(cxt){
  Loader.show(cxt,
      isSafeAreaOverlay: true,
      isBottomBarOverlay: true,
      overlayFromBottom: 80,
      overlayColor: Colors.black26,
      progressIndicator: Container(
        width: 45.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white
        ),
        child:Container(
          width: double.infinity,
          child: Center(child:Lottie.asset(
            'assets/lottie/splash_loader.json',
            fit: BoxFit.fill,
          ),),
        )
      ),
      themeData: Theme.of(cxt)
          .copyWith(colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.green))

  );
}

void hideLoader(){
  Loader.hide();
}
