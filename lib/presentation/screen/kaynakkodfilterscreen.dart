

/*
import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_segment/flutter_advanced_segment.dart';
import 'package:flutter_voltzone/presentation/provider/filter_provider.dart';
import 'package:flutter_voltzone/presentation/screen/map_screen.dart';
import 'package:getwidget/components/toggle/gf_toggle.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> with AfterLayoutMixin<FilterScreen> {
  double value=0.5;
  late FilterProvider filterProvider;

  @override
  Widget build(BuildContext context) {
    filterProvider = Provider.of<FilterProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Filtreler",style: TextStyle(color: Colors.black),),
        elevation: 0,
        iconTheme: IconThemeData(
            color: Colors.black
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 40.0,top: 5,right: 40),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Soket Tipi",style: TextStyle(color: Colors.grey.shade700,fontSize: 18,fontWeight: FontWeight.w500),),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [

                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage("assets/chademoplug1.png")
                            ),
                            borderRadius: BorderRadius.circular(10)
                        ),                       ),
                      Radio(value: "CHAdeMO", groupValue: filterProvider.socketType, onChanged: (value){
                        filterProvider.sicon=1;
                        filterProvider.socketType = value.toString();

                      }),
                      Text("CHAdeMO",style: TextStyle(color: Colors.grey),)
                    ],
                  ),
                  Column(
                    children: [

                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage("assets/type2plug2.png")
                            ),
                            borderRadius: BorderRadius.circular(10)
                        ),                         ),
                      Radio(value: "Type 2", groupValue: filterProvider.socketType, onChanged: (value){
                        filterProvider.sicon=2;
                        filterProvider.socketType = value.toString();
                      }),
                      Text("TYPE 2",style: TextStyle(color: Colors.grey),)
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage("assets/ccsplug1.png")
                            ),
                            borderRadius: BorderRadius.circular(10)
                        ),                         ),
                      Radio(value: "ccs", groupValue: filterProvider.socketType, onChanged: (value){
                        filterProvider.sicon=3;
                        filterProvider.socketType = value.toString();
                      }),
                      Text("CCS",style: TextStyle(color: Colors.grey),)
                    ],
                  ),
                ],),
              SizedBox(height: 5,),
              Divider(color: Colors.black),
              SizedBox(height: 15,),
              Text("İstasyon Sahibi",style: TextStyle(color: Colors.grey.shade700,fontSize: 18,fontWeight: FontWeight.w500),),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [

                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage("assets/esarj_logo.png")
                            ),
                            borderRadius: BorderRadius.circular(10)
                        ),                      ),
                      Radio(value: "EŞarj", groupValue: filterProvider.station_owner, onChanged: (value){
                        filterProvider.shb=1;
                        filterProvider.station_owner = value.toString();
                      }),
                      Text("EŞarj",style: TextStyle(color: Colors.grey),)
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage("assets/zes_logo.png")
                            ),
                            borderRadius: BorderRadius.circular(10)
                        ),                      ),
                      Radio(value: "ZES", groupValue: filterProvider.station_owner, onChanged: (value){
                        filterProvider.shb=2;
                        filterProvider.station_owner = value.toString();

                      }),
                      Text("ZES",style: TextStyle(color: Colors.grey),)
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage("assets/sharz_logo.png")
                            ),
                            borderRadius: BorderRadius.circular(10)),),
                      Radio(value: "Sharz", groupValue: filterProvider.station_owner, onChanged: (value){
                        filterProvider.shb=4;
                        filterProvider.station_owner = value.toString();

                      }),
                      Text("Sharz",style: TextStyle(color: Colors.grey),)
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage("assets/volt_logo.png")
                            ),
                            borderRadius: BorderRadius.circular(10)
                        ),                      ),
                      Radio(value: "VoltRUN", groupValue: filterProvider.station_owner, onChanged: (value){
                        filterProvider.shb=3;
                        filterProvider.station_owner = value.toString();
                      }),
                      Text("VoltRUN",style: TextStyle(color: Colors.grey),)
                    ],
                  ),
                ],),
              Divider(color: Colors.black,endIndent: 40,),
              SizedBox(height: 5,),
              Text("Şarj Gücü",style: TextStyle(color: Colors.grey.shade700,fontSize: 18,fontWeight: FontWeight.w500),),
              SizedBox(height: 23,),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Row(
                  children: [
                    powerFilterButton(text: filterProvider.filterButtonItem[0],value:filterProvider.filterButtonItemValue[0],
                      onTap: (){
                        filterProvider.filterButtonItemValue[0]=!filterProvider.filterButtonItemValue[0];
                        print(filterProvider.filterButtonItemValue[0]);
                        filterProvider.notifyListeners();
                      },
                    ),
                    SizedBox(width: 8,),
                    powerFilterButton(text: filterProvider.filterButtonItem[1],value:filterProvider.filterButtonItemValue[1],
                      onTap: (){
                        filterProvider.filterButtonItemValue[1]=!filterProvider.filterButtonItemValue[1];
                        print(filterProvider.filterButtonItemValue[1]);
                        filterProvider.notifyListeners();
                      },),
                    SizedBox(width: 8,),
                    powerFilterButton(text: filterProvider.filterButtonItem[2],value:filterProvider.filterButtonItemValue[2],
                      onTap: (){
                        filterProvider.filterButtonItemValue[2]=!filterProvider.filterButtonItemValue[2];
                        print(filterProvider.filterButtonItemValue[2]);
                        filterProvider.notifyListeners();
                      },),
                  ],
                ),
              ),
              SizedBox(height: 16,),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Row(
                  children: [
                    powerFilterButton(text: filterProvider.filterButtonItem[3],value:filterProvider.filterButtonItemValue[3],
                      onTap: (){
                        filterProvider.filterButtonItemValue[3]=!filterProvider.filterButtonItemValue[3];
                        print(filterProvider.filterButtonItemValue[3]);
                        filterProvider.notifyListeners();
                      },
                    ),
                    SizedBox(width: 8,),
                    powerFilterButton(text: filterProvider.filterButtonItem[4],value:filterProvider.filterButtonItemValue[4],
                      onTap: (){
                        filterProvider.filterButtonItemValue[4]=!filterProvider.filterButtonItemValue[4];
                        print(filterProvider.filterButtonItemValue[4]);
                        filterProvider.notifyListeners();
                      },),
                    SizedBox(width: 8,),
                    powerFilterButton(text: filterProvider.filterButtonItem[5],value:filterProvider.filterButtonItemValue[5],
                      onTap: (){
                        filterProvider.filterButtonItemValue[5]=!filterProvider.filterButtonItemValue[5];
                        print(filterProvider.filterButtonItemValue[5]);
                        filterProvider.notifyListeners();
                      },),
                  ],
                ),
              ),
              Divider(color: Colors.black,endIndent: 40,),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: ()async{
                      await filterProvider.getChargeStationWithFilter();
                    },
                    child: Container(
                      width: 96,
                      height: 32,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: Center(
                        child: Text("Uygula",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),),
                      ),
                    ),
                  ),
                  SizedBox(width: 8,),
                  GestureDetector(
                    onTap: (){
                      for(var i=0;i<filterProvider.filterButtonItemValue.length;i++){
                        filterProvider.filterButtonItemValue[i]=false;
                      }
                      filterProvider.notifyListeners();
                    },
                    child: Container(
                      width: 96,
                      height: 32,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: Center(
                        child: Text("Temizle",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
                      ),
                    ),
                  ),
                ],)
              /*
              Text("Puan",style: TextStyle(color: Colors.grey.shade700,fontSize: 18,fontWeight: FontWeight.w500),),
              SizedBox(height: 15,),
              Center(
                child: AdvancedSegment(
                  controller: _selectedSegment_00,
                  backgroundColor: Colors.grey.shade300,
                  segments: const{
                  'hepsi': 'Hepsi',
                  '3üzeri': '3 Üzeri',
                  '4üzeri': '4 Üzeri',
                },

                ),
              ),
              SizedBox(height: 5,),
              Divider(color: Colors.black,endIndent: 40,),
              Text("Diğer filtreler",style: TextStyle(color: Colors.grey.shade700,fontSize: 18,fontWeight: FontWeight.w500),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
               Text("Sadece 7/24 hizmet veren istasyonlar"),
                GFToggle(onChanged: (response){}, value: true)
              ],),
              SizedBox(height: 24,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 96,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: Center(
                      child: Text("Uygula",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),),
                    ),
                  ),
                ),
                SizedBox(width: 8,),
                Container(
                  width: 96,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: Center(
                    child: Text("Temizle",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
                  ),
                ),
              ],)

               */
            ],),
        ),
      ),
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async{
    filterProvider.context = context;
    await filterProvider.getChargeStation();
  }
}

class powerFilterButton extends StatefulWidget {
  powerFilterButton({
    Key? key, required this.text,required this.value,  this.onTap
  }) : super(key: key);

  final String text;
  bool value;
  VoidCallback? onTap;

  @override
  State<powerFilterButton> createState() => _powerFilterButtonState();
}

class _powerFilterButtonState extends State<powerFilterButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap??(){

      },
      child: Container(
          height: 4.h,
          decoration: BoxDecoration(
              color: widget.value ==true?Colors.blue:Colors.white,
              border: Border.all(color: widget.value ==false?Colors.black:Colors.blue),
              borderRadius: BorderRadius.circular(8)
          ),
          child: Center(child: Padding(
            padding: const EdgeInsets.only(left:8.0,right: 8.0),
            child: Row(
              children: [
                widget.value==true?Icon(Icons.check,color: Colors.white,size: 4.w,):Container(),
                SizedBox(width: 10,),
                Text(widget.text,style: TextStyle(color:widget.value==true? Colors.white:Colors.black,fontSize: 3.w),),
              ],
            ),
          ),)),
    );
  }
}
*/