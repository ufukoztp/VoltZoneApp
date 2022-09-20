import 'package:flutter/material.dart';
import 'package:flutter_advanced_segment/flutter_advanced_segment.dart';
import 'package:getwidget/components/toggle/gf_toggle.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  double value=0.5;
  final _selectedSegment_00 = ValueNotifier('all');

  @override
  Widget build(BuildContext context) {
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
                    Radio(value: false, groupValue: "false", onChanged: (value){}),
                    Text("ccs",style: TextStyle(color: Colors.grey),)
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
                      Radio(value: false, groupValue: "false", onChanged: (value){}),
                      Text("ccs",style: TextStyle(color: Colors.grey),)
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
                      Radio(value: false, groupValue: "false", onChanged: (value){}),
                      Text("ccs",style: TextStyle(color: Colors.grey),)
                    ],
                  ),
                ],),
              SizedBox(height: 5,),
              Divider(color: Colors.black,endIndent: 40,),
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
                                image: AssetImage("assets/volt_logo.png")
                            ),
                            borderRadius: BorderRadius.circular(10)
                        ),                      ),
                      Radio(value: false, groupValue: "false", onChanged: (value){}),
                      Text("ccs",style: TextStyle(color: Colors.grey),)
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
                      Radio(value: false, groupValue: "false", onChanged: (value){}),
                      Text("ccs",style: TextStyle(color: Colors.grey),)
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
                                image: AssetImage("assets/esarj_logo.png")
                            ),
                            borderRadius: BorderRadius.circular(10)
                        ),                      ),
                      Radio(value: false, groupValue: "false", onChanged: (value){}),
                      Text("ccs",style: TextStyle(color: Colors.grey),)
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
                            borderRadius: BorderRadius.circular(10)
                        ),                      ),
                      Radio(value: false, groupValue: "false", onChanged: (value){}),
                      Text("ccs",style: TextStyle(color: Colors.grey),)
                    ],
                  ),
                ],),
              Divider(color: Colors.black,endIndent: 40,),
              SizedBox(height: 5,),
              Text("Şarj Gücü",style: TextStyle(color: Colors.grey.shade700,fontSize: 18,fontWeight: FontWeight.w500),),
               Slider(
                  value: value, onChanged: (value2){
                value = value2;
                setState(() {});
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                Text("3kW",style: TextStyle(color: Colors.grey),),
                Text("7kW",style: TextStyle(color: Colors.grey),),
                Text("18kW",style: TextStyle(color: Colors.grey),),
                Text("43kW",style: TextStyle(color: Colors.grey),),
                Text("100kW",style: TextStyle(color: Colors.grey),),
                Text("150kW+",style: TextStyle(color: Colors.grey),),
              ],),
              Divider(color: Colors.black,endIndent: 40,),
              SizedBox(height: 5,),
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

            ],),
        ),
      ),
    );
  }
}
