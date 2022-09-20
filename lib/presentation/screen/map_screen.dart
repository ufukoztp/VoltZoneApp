
import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter_voltzone/presentation/screen/filter_screen.dart';
import 'package:flutter_voltzone/presentation/screen/search_screen.dart';
import 'package:flutter_voltzone/presentation/screen/station_detail_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../provider/map_provider.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> with AfterLayoutMixin {


  @override
  FutureOr<void> afterFirstLayout(BuildContext context)async {
    // TODO: implement afterFirstLayout
   await mapProvider.getChargeZones();
  }

  late MapProvider mapProvider;
  @override
  Widget build(BuildContext context) {
    mapProvider = Provider.of<MapProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          mapProvider.isLoading ==true?
          Stack(
            alignment: Alignment.center,
            children: [
            GoogleMap(
              myLocationButtonEnabled: false,
            mapType: MapType.normal,
            initialCameraPosition: mapProvider.kGooglePlex,
            onMapCreated: mapProvider.onMapCreated,
              markers: mapProvider.markers.values.toSet(),
            ),
            Positioned(
              top: 55,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,     MaterialPageRoute(builder: (context) => const SearchScreen()),);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)
                      ),
                      height: 32,
                      width: 240,
                      child: Row(
                         children: [
                           SizedBox(width: 10,),
                           Icon(Icons.search,size: 22,),
                          SizedBox(width: 16,),
                          Text("Şarj istasyonu ara",style: TextStyle(fontSize: 13,color: Colors.grey),),
                         ],
                      ),
                    ),
                  ),
                  SizedBox(width: 8,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,     MaterialPageRoute(builder: (context) => const FilterScreen()),);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: AssetImage("assets/setting.png")
                        )
                      ),
                      height: 32,
                      width: 32,
                     ),
                  ),

                ],
              ),
            ),
              Visibility(
                visible: mapProvider.stationInfoVisibility,
                child: Positioned(
                    bottom: 35,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>   StationDetail(name: mapProvider.zoneName!, address:  mapProvider.zoneAddress!, point: 4, photo:  "", shb:  mapProvider.shb!)),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24)
                        ),
                        width:336 ,
                        height: 184,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:16.0,top: 8),
                              child: Row(
                                children: [
                                  GestureDetector(
                                      onTap: (){
                                        mapProvider.stationInfoVisibility = !mapProvider.stationInfoVisibility;
                                      },
                                      child: const Icon(Icons.clear,size: 22,)),
                                  SizedBox(width: 97,),
                                  Container(
                                    width: 72,
                                    height: 5,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(15)

                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0,top: 13),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(mapProvider.zoneName??"",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15.0),
                                    child: Row(
                                      children: [
                                        Stack(
                                          children: [
                                            if(mapProvider.shb==1)Container(
                                              width: 32,
                                              height: 32,
                                              decoration: BoxDecoration(
                                                  image: const DecorationImage(
                                                    fit: BoxFit.contain,
                                                    image: AssetImage("assets/esarj_logo.png")
                                                  ),
                                                  borderRadius: BorderRadius.circular(10)
                                              ),
                                            ),
                                            if(mapProvider.shb==2)Container(
                                              width: 32,
                                              height: 32,
                                              decoration: BoxDecoration(
                                                  image: const DecorationImage(
                                                      fit: BoxFit.contain,
                                                      image: AssetImage("assets/zes_logo.png")
                                                  ),
                                                  borderRadius: BorderRadius.circular(10)
                                              ),
                                            ),
                                            if(mapProvider.shb==3)Container(
                                              width: 32,
                                              height: 32,
                                              decoration: BoxDecoration(
                                                  image: const DecorationImage(
                                                      fit: BoxFit.contain,
                                                      image: AssetImage("assets/volt_logo.png")
                                                  ),
                                                  borderRadius: BorderRadius.circular(10)
                                              ),
                                            ),
                                            if(mapProvider.shb==4)Container(
                                              width: 32,
                                              height: 32,
                                              decoration: BoxDecoration(
                                                  image: const DecorationImage(
                                                      fit: BoxFit.contain,
                                                      image: AssetImage("assets/sharz_logo.png")
                                                  ),
                                                  borderRadius: BorderRadius.circular(10)
                                              ),
                                            ),

                                          ],
                                        ),
                                        /*
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0,right: 4),
                                          child: Container(
                                            width: 15,
                                            height: 15,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.contain,
                                                  image: AssetImage("assets/right_arrow.png")
                                                ),
                                                borderRadius: BorderRadius.circular(10)
                                            ),
                                          ),
                                        ),

                                         */
                                       // Text("2,2 km")
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0,top: 8),
                              child: Text(mapProvider.zoneAddress ??"",style: TextStyle(fontSize: 8),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 36.0,top:13),
                              child: Row(
                                children: [
                                  if(mapProvider.sicon1 ==1)Container(
                                    width: 48,
                                    height:48 ,
                                    decoration:   const BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                            image: AssetImage("assets/chademoplug1.png")
                                        )
                                    ),
                                  ),
                                  if(mapProvider.sicon1 ==2)Container(
                                    width: 48,
                                    height:48 ,
                                    decoration:   const BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage("assets/type2plug2.png")
                                        )
                                    ),
                                  ),
                                  if(mapProvider.sicon1 ==3)Container(
                                    width: 48,
                                    height:48 ,
                                    decoration:   const BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage("assets/ccsplug1.png")
                                        )
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Column(
                                       children: [
                                        Text(mapProvider.stipi1 ?? "",style: TextStyle(fontSize: 12),),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text("",style: TextStyle(fontSize: 12),),
                                       ],
                                    ),
                                  ),
                                  SizedBox(width: 32,),
                                  if(mapProvider.sicon2 ==1)Container(
                                    width: 48,
                                    height:48 ,
                                    decoration:   const BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage("assets/chademoplug1.png")
                                        )
                                    ),
                                  ),
                                  if(mapProvider.sicon2 ==2)Container(
                                    width: 48,
                                    height:48 ,
                                    decoration:   const BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage("assets/type2plug2.png")
                                        )
                                    ),
                                  ),
                                  if(mapProvider.sicon2 ==3)Container(
                                    width: 48,
                                    height:48 ,
                                    decoration:   const BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage("assets/ccsplug1.png")
                                        )
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Column(
                                      children: [
                                        Text(mapProvider.stipi2 ?? "",style: TextStyle(fontSize: 12),),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text("",style: TextStyle(fontSize: 12),),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
              )

          ],):Center(child: CircularProgressIndicator(),)
        ],
      ),
    );
  }


}
