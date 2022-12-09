
import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter_voltzone/presentation/screen/filter_screen.dart';
import 'package:flutter_voltzone/presentation/screen/policy_screen.dart';
import 'package:flutter_voltzone/presentation/screen/route_planner.dart';
import 'package:flutter_voltzone/presentation/screen/search_screen.dart';
import 'package:flutter_voltzone/presentation/screen/station_detail_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../data/model/charge_zone.dart';
import '../provider/map_provider.dart';
import '../widget/map_widget.dart';

class MapScreen extends StatefulWidget {
   const MapScreen({Key? key,  this.chargeZone}) : super(key: key);
  final List<ChargeZone>? chargeZone;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> with AfterLayoutMixin {


  @override
  FutureOr<void> afterFirstLayout(BuildContext context)async {
     // TODO: implement afterFirstLayout
    mapProvider.isLoading=false;

    if(widget.chargeZone == null||widget.chargeZone?.length == 0){
      bool result = await InternetConnectionChecker().hasConnection;

      if(result == true) {
        print('girdi');
        mapProvider.isConnection = true;
        await mapProvider.getChargeZones();
        mapProvider.getLocation();
        mapProvider.isLoading=true;
        Future.delayed(Duration(seconds: 10)).then((value) => mapProvider.isLocationPermission=true);
      } else {

        mapProvider.isConnection = false;
      }
    }else{
      mapProvider.chargeList=widget.chargeZone!;
      mapProvider.isLoading=true;
    }




  }
  @override
  void initState() {
    // TODO: implement initState
     super.initState();
  }

  late MapProvider mapProvider;

  @override
  Widget build(BuildContext context) {
    mapProvider = Provider.of<MapProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          mapProvider.isConnection == true?
         mapProvider.chargeList.length!=0&&mapProvider.isLocationPermission!=null? MapWidget(mapProvider: mapProvider):Center(child:Lottie.asset(
           'assets/lottie/splash_loader.json',
           fit: BoxFit.fill,
         ),): Center(child:Text('Bağlantınızı kontrol ediniz'),)
        ],
      ),
     );
  }


}

