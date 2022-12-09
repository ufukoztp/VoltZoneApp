import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_voltzone/presentation/provider/search_provider.dart';
import 'package:flutter_voltzone/presentation/screen/station_detail_screen.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> with AfterLayoutMixin<SearchScreen> {
  late SearchProvider searchProvider;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async{
    bool result = await InternetConnectionChecker().hasConnection;
     if(result == true) {
       searchProvider.isConnection=true;
       searchProvider.getChargeZones();
    } else {
       searchProvider.isConnection=false;
    }
  }
  @override
  Widget build(BuildContext context) {
    searchProvider =Provider.of<SearchProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black
        ),
      ),
      body:searchProvider.isConnection==true ? SingleChildScrollView(
        child: Column(
            children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top:7.0,left: 48,right: 48),
              child: Card(
                 shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black12),
                   borderRadius: BorderRadius.circular(8)
                ),
                child: TextFormField(
                  onChanged: (value)async{
                    searchProvider.chargeListView =  searchProvider.chargeList.where((element) {
                      if(element.name != null&&element.trf != null){
                        if(element.name!.toUpperCase().contains(value.toUpperCase())||element.trf!.toUpperCase().contains(value.toUpperCase())) {
                          return true;
                        }else{
                          return false;
                        }
                      }else{
                        return false;
                      }
                    }).toList();
                   },
                  controller: searchProvider.textEditingController,
                 decoration: InputDecoration(
                   prefixIcon: GestureDetector(
                       onTap: ()async{
                          searchProvider.textEditingController.clear();
                          searchProvider.chargeListView =  searchProvider.chargeList;
                       },
                       child: Icon(Icons.clear,size: 20,)),
                 border: InputBorder.none
                 ),
                 ),
              ),
            ),
          ),
             SizedBox(height:24 ,),
            ListView.builder(
              physics:NeverScrollableScrollPhysics() ,
              itemBuilder: (context,index){
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StationDetail(name: searchProvider.chargeListView[index].name??"", address: searchProvider.chargeListView[index].trf??"", point: 0, photo: "photo", shb: searchProvider.chargeListView[index].shb??0, lat: double.parse(searchProvider.chargeListView[index].lat!), long: double.parse(searchProvider.chargeListView[index].long!), sicon:searchProvider.chargeListView[index].sicon??[] , stipi: searchProvider.chargeListView[index].stip??[])));
                },
                child: searchWidget(name:searchProvider.chargeListView[index].name??"",address: searchProvider.chargeListView[index].trf??"",iconCode: searchProvider.chargeListView[index].shb!),
              );
            },shrinkWrap: true,itemCount:searchProvider.chargeListView !=null ?searchProvider.chargeListView.length :0 ,),



        ],),
      ):Center(child:Text('Bağlantınızı kontrol ediniz'),)
    );
  }

   searchWidget({required String name,required String address,required int iconCode}) {
    return Column(children: [
           Divider(color: Colors.black54,endIndent: 15,indent: 15,),
           Padding(
             padding: const EdgeInsets.only(left:24.0,top: 24,bottom: 24),
             child: Row(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 if(iconCode==1)Container(
                   width: 48,
                   height: 48,
                   decoration: BoxDecoration(
                       image: const DecorationImage(
                           fit: BoxFit.contain,
                           image: AssetImage("assets/esarj_logo.png")
                       ),
                       borderRadius: BorderRadius.circular(10)
                   ),
                 ),
                 if(iconCode==2)Container(
                   width: 48,
                   height: 48,
                   decoration: BoxDecoration(
                       image: const DecorationImage(
                           fit: BoxFit.contain,
                           image: AssetImage("assets/zes_logo.png")
                       ),
                       borderRadius: BorderRadius.circular(10)
                   ),
                 ),
                 if(iconCode==3)Container(
                   width: 48,
                   height: 48,
                   decoration: BoxDecoration(
                       image: const DecorationImage(
                           fit: BoxFit.contain,
                           image: AssetImage("assets/volt_logo.png")
                       ),
                       borderRadius: BorderRadius.circular(10)
                   ),
                 ),
                 if(iconCode==4)Container(
                   width: 48,
                   height: 48,
                   decoration: BoxDecoration(
                       image: const DecorationImage(
                           fit: BoxFit.contain,
                           image: AssetImage("assets/sharz_logo.png")
                       ),
                       borderRadius: BorderRadius.circular(10)
                   ),
                 ),
                 SizedBox(width: 10,),
                 Expanded(
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
                       SizedBox(height:10 ,),
                       Text(address,style: TextStyle(fontSize: 13,color: Colors.grey),),
                       SizedBox(height:10 ,),
                     //Text("Kullanım Saatleri: 00:00 - 24:00",style: TextStyle(fontSize: 8,color: Colors.grey),),
                     ],
                   ),
                 )
               ],
             ),
           ),
         ],);
  }


}
