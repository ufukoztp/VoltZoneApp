import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_voltzone/presentation/provider/search_provider.dart';
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
    await searchProvider.getChargeZones();
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
      body: SingleChildScrollView(
        child: Column(
           children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top:16.0),
              child: Container(
                width: 280,
                height: 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: [BoxShadow(color: Colors.black26,blurRadius: 5)]
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top:6),
                  child: TextFormField(
                    onChanged: (value)async{
                      print(searchProvider.chargeList.length);
                      print(value);
                    searchProvider.chargeListView =  searchProvider.chargeList.where((element) {
                      if(element.nameCode!.contains(value.toUpperCase())) {
                        return true;
                      }else{
                        return false;
                      }

                    }).toList();
                   print(searchProvider.chargeListView.length);
                    },
                    controller: searchProvider.textEditingController,
                   decoration: InputDecoration(
                     prefixIcon: GestureDetector(
                         onTap: ()async{
                            searchProvider.textEditingController.clear();
                         },
                         child: Icon(Icons.clear,size: 20,)),
                   border: InputBorder.none
                   ),
                   ),
                ),
              ),
            ),
          ),
             SizedBox(height:24 ,),
             Column(children: List.generate(searchProvider.chargeListView.length, (index) =>searchWidget(name:searchProvider.chargeListView[index].name!,address: searchProvider.chargeListView[index].trf!,iconCode: searchProvider.chargeListView[index].shb! ),
             ),),



        ],),
      ),
    );
  }

  Column searchWidget({required String name,required String address,required int iconCode}) {
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
                 Padding(
                   padding: const EdgeInsets.only(left:16.0),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(name,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700),),
                       SizedBox(height:10 ,),
                       Text(address,style: TextStyle(fontSize: 8,color: Colors.grey),),
                       SizedBox(height:10 ,),
                     //  Text("Kullanım Saatleri: 00:00 - 24:00",style: TextStyle(fontSize: 8,color: Colors.grey),),
                     ],
                   ),
                 )
               ],
             ),
           ),
         ],);
  }


}
