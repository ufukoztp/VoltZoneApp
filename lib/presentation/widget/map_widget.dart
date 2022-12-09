import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import'dart:io' show Platform;

import '../provider/map_provider.dart';
import '../screen/filter_screen.dart';
import '../screen/policy_screen.dart';
import '../screen/route_planner.dart';
import '../screen/search_screen.dart';
import '../screen/station_detail_screen.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({
    Key? key,
    required this.mapProvider,
  }) : super(key: key);

  final MapProvider mapProvider;

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  @override
  void initState() {
    // TODO: implement initState
    print(widget.mapProvider.chargeList.length.toString()+"widget");

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Visibility(
          visible: widget.mapProvider.currentIndex==0,
          child: Stack(
            alignment: Alignment.center,
            children: [
              GoogleMap(
                padding:Platform.isIOS==true? EdgeInsets.only(bottom:23.h):EdgeInsets.only(top:70.h),
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                zoomControlsEnabled: false,
                mapType: MapType.normal,
                initialCameraPosition: widget.mapProvider.kGooglePlex??CameraPosition(
                  target: LatLng(double.parse("41.011316"), double.parse("29.013228")), zoom: 12,),
                onMapCreated:(controller){
                  widget.mapProvider.onMapCreated(controller);
                  setState(() {});

                },
                markers: widget.mapProvider.markers.values.toSet(),
              ),
              Positioned(
                top: 75,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen()),);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)
                        ),
                        height: 41,
                        width: 240,
                        child: Row(
                          children: const [
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
                        Navigator.push(context,MaterialPageRoute(builder: (context) => const FilterScreen()));

                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image: AssetImage("assets/setting.png")
                            )
                        ),
                        height: 41,
                        width: 41,
                      ),
                    ),

                  ],
                ),
              ),
              Visibility(
                visible: widget.mapProvider.stationInfoVisibility,
                child: Positioned(
                    bottom: 35,
                    child: GestureDetector(
                      onTap: ()async{
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>   StationDetail(name: widget.mapProvider.zoneName!, address:  widget.mapProvider.zoneAddress!, point: 4, photo:  "", shb:  widget.mapProvider.shb!,lat: double.parse(widget.mapProvider.lat!),long:double.parse(widget.mapProvider.long!), sicon:widget.mapProvider.sicon??[]  ,stipi: widget.mapProvider.stipi??[],)),
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
                                        widget.mapProvider.stationInfoVisibility = !widget.mapProvider.stationInfoVisibility;
                                      },
                                      child: const Icon(Icons.clear,size: 22,)),
                                  SizedBox(width: 97,),
                                 ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0,top: 13),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(child: Text(widget.mapProvider.zoneName??"",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),)),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15.0),
                                    child: Row(
                                      children: [
                                        Stack(
                                          children: [
                                            if(widget.mapProvider.shb==1)Container(
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
                                            if(widget.mapProvider.shb==2)Container(
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
                                            if(widget.mapProvider.shb==3)Container(
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
                                            if(widget.mapProvider.shb==4)Container(
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
                              child: Text(widget.mapProvider.zoneAddress ??"",style: TextStyle(fontSize: 8),),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 36.0,top:13),
                              child: Row(
                                children: [
                                  if(widget.mapProvider.stipi?.length !=0 )
                                    Stack(children: [
                                      if(widget.mapProvider.sicon?[0] ==1)Container(
                                        width: 48,
                                        height:48 ,
                                        decoration:   const BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: AssetImage("assets/chademoplug1.png")
                                            )
                                        ),
                                      ),
                                      if(widget.mapProvider.sicon?[0] ==2)Container(
                                        width: 48,
                                        height:48 ,
                                        decoration:   const BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: AssetImage("assets/type2plug2.png")
                                            )
                                        ),
                                      ),
                                      if( widget.mapProvider.sicon?[0] ==3)Container(
                                        width: 48,
                                        height:48 ,
                                        decoration:   const BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: AssetImage("assets/ccsplug1.png")
                                            )
                                        ),
                                      ),
                                    ],
                                    ),

                                  if(widget.mapProvider.stipi?.length !=0 )
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Column(
                                        children: [
                                          Text(widget.mapProvider.stipi?[0] ?? "",style: TextStyle(fontSize: 11),),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text("",style: TextStyle(fontSize: 12),),
                                        ],
                                      ),
                                    ),


                                  SizedBox(width: 15,),
                                  if(widget.mapProvider.stipi?.length !=0&&widget.mapProvider.stipi?.length !=1 )
                                    Stack(
                                      children: [
                                        if(widget.mapProvider.sicon?.length!=0&& widget.mapProvider.sicon?[1] ==1)Container(
                                          width: 48,
                                          height:48 ,
                                          decoration:   const BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage("assets/chademoplug1.png")
                                              )
                                          ),
                                        ),
                                        if(widget.mapProvider.sicon?.length!=0&& widget.mapProvider.sicon?[1] ==2)Container(
                                          width: 48,
                                          height:48 ,
                                          decoration:   const BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage("assets/type2plug2.png")
                                              )
                                          ),
                                        ),
                                        if(widget.mapProvider.sicon?.length!=0&& widget.mapProvider.sicon?[1] ==3)Container(
                                          width: 48,
                                          height:48 ,
                                          decoration:   const BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage("assets/ccsplug1.png")
                                              )
                                          ),
                                        ),
                                      ],
                                    ),

                                  if(widget.mapProvider.stipi?.length !=0&&widget.mapProvider.stipi?.length !=1)
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Column(
                                        children: [
                                          Text(widget.mapProvider.stipi?[1] ?? "",style: TextStyle(fontSize: 11),),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text("",style: TextStyle(fontSize: 12),),
                                        ],
                                      ),
                                    ),

                                ],
                              ),
                            ),
                            SizedBox(height: 5,),
                            if(widget.mapProvider.stipi?.length !=0&&widget.mapProvider.stipi?.length !=1&&widget.mapProvider.stipi?.length !=2)
                              Align(
                                alignment: Alignment.centerRight,
                                   child: Padding(
                                     padding: const EdgeInsets.only(right: 30.0),
                                     child: Text("+${widget.mapProvider.stipi!.length - 2} Soket Daha",style: TextStyle(color: Colors.grey,fontSize: 10),),
                                   ))

                          ],
                        ),
                      ),
                    )),
              ),

              Visibility(
                visible: !widget.mapProvider.stationInfoVisibility,
                child: Positioned(
                  left: 20,
                  bottom: 17.h,
                  child: GestureDetector(
                    onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen()),);

                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                              image: AssetImage("assets/menu.png")
                          )
                      ),
                      width: 40,
                      height: 40,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: !widget.mapProvider.stationInfoVisibility,
                child: Positioned(
                  left: 20,
                  bottom: 23.h,
                  child: GestureDetector(
                    onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const PoliciyPage()),);

                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      width: 40,
                      height: 40,
                      child: Icon(Icons.info,color: Colors.grey.shade600,),
                    ),
                  ),
                ),
              ),

              //bottom Bar
            ],),
        ),
        ///tab bar & route planner
        /*
        Visibility(
            visible: widget.mapProvider.currentIndex==1,
            child: RoutePlanner()),
        //bottom bar
        Visibility(
          visible:!widget.mapProvider.stationInfoVisibility ,
          child: Positioned(
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.only(bottom:36.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.white,
                ),
                height: 10.h,
                width: 48.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                        onTap: (){
                          widget.mapProvider.currentIndex=0;
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                color: widget.mapProvider.currentIndex!=0?null:Colors.blue.shade50,
                                border:widget.mapProvider.currentIndex!=0?null: Border.all(color: Colors.blue),
                                borderRadius:widget.mapProvider.currentIndex!=0?null:BorderRadius.circular(16)
                            ),
                            width: 50,
                            height: 50,
                            child: Icon(Icons.map,size: 35,color: widget.mapProvider.currentIndex!=0?Colors.grey.shade600:Colors.blue))),
                    GestureDetector(
                      onTap: (){
                        widget.mapProvider.currentIndex=1;

                      },
                      child: Container(
                          decoration: BoxDecoration(
                              color: widget.mapProvider.currentIndex!=1?null:Colors.blue.shade50,
                              border: widget.mapProvider.currentIndex!=1?null:Border.all(color: Colors.blue),
                              borderRadius:widget.mapProvider.currentIndex!=1?null:BorderRadius.circular(16)
                          ),
                          width: 50,
                          height: 50,
                          child: Image.asset("assets/Bolt.png",color: widget.mapProvider.currentIndex!=1?Colors.grey.shade600:Colors.blue,)),
                    )
                  ],),
              ),
            ),
          ),
        ),
         */
      ],
    );
  }
}
