import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_voltzone/presentation/provider/station_detail_provider.dart';
import 'package:getwidget/components/rating/gf_rating.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class StationDetail extends StatefulWidget {
 final String name;
 final String address;
 final int point;
 final String photo;
 final int shb;
 final double lat;
 final double long;
 final List sicon;
 final List stipi;
  const StationDetail({Key? key, required this.name, required this.address, required this.point, required this.photo, required this.shb, required this.lat, required this.long, required this.sicon, required this.stipi}) : super(key: key);

  @override
  State<StationDetail> createState() => _StationDetailState();
}

class _StationDetailState extends State<StationDetail> with AfterLayoutMixin<StationDetail> {
 late StationDetailProvider stationDetailProvider;

  @override
  Widget build(BuildContext context) {
    stationDetailProvider = Provider.of<StationDetailProvider>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        body:stationDetailProvider.isConnection==true ? Padding(
          padding:  EdgeInsets.only(left: 9.0.w,right:9.w ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width:340 ,
                height:204 ,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage("assets/no_photo.png")
                    ),
                    borderRadius: BorderRadius.circular(20)
                ),
              ),
              SizedBox(height:39 ,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Expanded(child: Text(stationDetailProvider.name ?? "",style: TextStyle(fontSize: 21,fontWeight: FontWeight.w700),)),
                  if(stationDetailProvider.shb==1) Container(width: 42,height: 42,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/esarj_logo.png")
                    )
                  ),
                  ),
                  if(stationDetailProvider.shb==2) Container(width: 42,height: 42,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/zes_logo.png")
                        )
                    ),
                  ),
                  if(stationDetailProvider.shb==3) Container(width: 42,height: 42,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/volt_logo.png")
                        )
                    ),
                  ),
                  if(stationDetailProvider.shb==4) Container(width: 42,height: 42,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/sharz_logo.png")
                        )
                    ),
                  ),

                ],
              ),
              SizedBox(height:16 ,),
              Text(stationDetailProvider.address ?? "",style: TextStyle(fontSize: 10),),
              SizedBox(height:8 ,),
              //Text("Kapalı otopark, -2. Kat, E14",style: TextStyle(fontSize: 10),),
              SizedBox(height:12 ,),
              /*
              Row(
                children: [
                  Text("4.0",style: TextStyle(fontSize: 25,color: Colors.grey.shade600,fontWeight: FontWeight.w600),),
                  SizedBox(width:8,),
                  GFRating(
                    size: 25,
                    value: 3,
                    onChanged: (value) {
                      setState(() {
                       });
                    },
                  )
                ],
              ),
              SizedBox(height:39 ,),
               */
              TabBar(
                tabs:[
                  Tab(child: Text("Prizler",style: TextStyle(color: Colors.grey,fontSize: 10),),),
                  Tab(child: Text("Detaylar",style: TextStyle(color: Colors.grey,fontSize: 10),),),
                ],
              ),
              SizedBox(height:39 ,),
              Expanded(
                child: TabBarView(children: [
                  SingleChildScrollView(
                    child: Column(children: List.generate(widget.sicon.length, (index)  {
                      return Padding(
                        padding: const EdgeInsets.only(top:24.0),
                        child: Row(
                          children: [
                               Stack(children: [
                                if(widget.sicon[index] ==1)Container(
                                  width: 48,
                                  height:48 ,
                                  decoration:   const BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage("assets/chademoplug1.png")
                                      )
                                  ),
                                ),
                                if(widget.sicon[index] ==2)Container(
                                  width: 48,
                                  height:48 ,
                                  decoration:   const BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage("assets/type2plug2.png")
                                      )
                                  ),
                                ),
                                if( widget.sicon[index] ==3)Container(
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
                               Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  children: [
                                    Text(widget.stipi[index] ?? "",style: TextStyle(fontSize: 12),),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("",style: TextStyle(fontSize: 12),),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      );
                    }),),
                  ),
               Container(),


                ]),
              ),
              /*
              ///commend  card
              Column(
                children: [
                  Container(
                     height: 90,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child:Padding(
                      padding: const EdgeInsets.only(top:12.0,left: 10,bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ///header
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                 Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(100)
                                  ),
                                ),
                                  SizedBox(width:7 ,),
                                  Column(
                                    children: [
                                      Text("Erkan Akat",style: TextStyle(fontSize:10,fontWeight: FontWeight.w700 ),),
                                      SizedBox(height:7 ,),
                                      Text("BMW İ4 M50",style: TextStyle(fontSize:8),),
                                    ],
                                  )
                              ],),
                              SizedBox(height:4 ,),
                              GFRating(
                                size: 20,
                                value: 3,
                                onChanged: (value) {
                                  setState(() {
                                  });
                                },
                              )
                            ],
                          ),
                          SizedBox(width: 15,),
                          Container(color: Colors.grey.shade400,height: 60,width: 1,),
                          SizedBox(width: 15,),
                          Expanded(child: Column(
                            children: [
                              Text("Benzinli araçlar park etmiş, çıkmalarını bekledik.Görevlilerin daha dikkatli olması gerekiyor.",style: TextStyle(
                                fontSize: 10
                              ),
                              ),
                            ],
                          )),


                        ],
                      ),
                    ) ,
                  )
                ],
              )

               */
            ],
          ),
        ): Container(),
        bottomNavigationBar: stationDetailProvider.isConnection==true ? Padding(
          padding:   EdgeInsets.only(bottom:25.0,left: 15,right: 15),
          child: GestureDetector(
            onTap: ()=>openMapsSheet(context),

            child: Container(height: 6.4.h,decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              color:Colors.blue,),
            child: Center(child:Text("Rota Oluştur",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 20),)),),
          ),
        ): Center(child:Text('Bağlantınızı kontrol ediniz'),),
      ),
    );
  }

 openMapsSheet(context) async {
   try {
     final coords = Coords(37.759392, -122.5107336);
     final title = "Ocean Beach";
     final availableMaps = await MapLauncher.installedMaps;

     showModalBottomSheet(
       context: context,
       builder: (BuildContext context) {
         return SafeArea(
           child: SingleChildScrollView(
             child: Container(
               child: Wrap(
                 children: <Widget>[
                   for (var map in availableMaps)
                     ListTile(
                       onTap: () => map.showMarker(
                         coords: Coords(widget.lat, widget.long),
                         title: widget.name,
                       ),
                       title: Text(map.mapName),
                       leading: SvgPicture.asset(
                         map.icon,
                         height: 30.0,
                         width: 30.0,
                       ),
                     ),
                 ],
               ),
             ),
           ),
         );
       },
     );
   } catch (e) {
     print(e);
   }
 }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    // TODO: implement afterFirstLayout
    stationDetailProvider.shb = widget.shb;
    stationDetailProvider.name = widget.name;
    stationDetailProvider.point = widget.point;
    stationDetailProvider.address = widget.address;
    stationDetailProvider.photo = widget.photo;

    bool result = await InternetConnectionChecker().hasConnection;
    if(result == true) {
      stationDetailProvider.isConnection=true;
    } else {
      stationDetailProvider.isConnection=false;
    }
  }
}
