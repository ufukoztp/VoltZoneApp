import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_voltzone/presentation/provider/station_detail_provider.dart';
import 'package:getwidget/components/rating/gf_rating.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class StationDetail extends StatefulWidget {
 final String name;
 final String address;
 final int point;
 final String photo;
 final int shb;
  const StationDetail({Key? key, required this.name, required this.address, required this.point, required this.photo, required this.shb}) : super(key: key);

  @override
  State<StationDetail> createState() => _StationDetailState();
}

class _StationDetailState extends State<StationDetail> with AfterLayoutMixin<StationDetail> {
 late StationDetailProvider stationDetailProvider;

  @override
  Widget build(BuildContext context) {
    stationDetailProvider = Provider.of<StationDetailProvider>(context);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        body: Padding(
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
                   Text(stationDetailProvider.name ?? "",style: TextStyle(fontSize: 21,fontWeight: FontWeight.w700),),

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
            //  Text("Kapalı otopark, -2. Kat, E14",style: TextStyle(fontSize: 10),),
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
              const TabBar(

                tabs:[
                  Tab(child: Text("Yorumlar",style: TextStyle(color: Colors.grey,fontSize: 12),),),
                  Tab(child: Text("Prizler",style: TextStyle(color: Colors.grey,fontSize: 12),),),
                  Tab(child: Text("Fotoğraf",style: TextStyle(color: Colors.grey,fontSize: 12),),),
                  Tab(child: Text("Detaylar",style: TextStyle(color: Colors.grey,fontSize: 12),),),

                ],
              ),
              SizedBox(height:39 ,),
              Expanded(
                child: TabBarView(children: [
                  Center(child: Text("Henüz yorum yok",style: TextStyle(color: Colors.grey),),),
               Container(),
               Container(),
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
        ),
      ),
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    // TODO: implement afterFirstLayout
    stationDetailProvider.shb = widget.shb;
    stationDetailProvider.name = widget.name;
    stationDetailProvider.point = widget.point;
    stationDetailProvider.address = widget.address;
    stationDetailProvider.photo = widget.photo;
  }
}
