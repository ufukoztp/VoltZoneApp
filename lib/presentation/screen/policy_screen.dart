import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_voltzone/presentation/provider/Policy_Provider.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

class PoliciyPage extends StatefulWidget {
  const PoliciyPage({Key? key}) : super(key: key);

  @override
  State<PoliciyPage> createState() => _PoliciyState();
}

class _PoliciyState extends State<PoliciyPage> with AfterLayoutMixin<PoliciyPage> {
  late PolicyProvider policyProvider;
  @override
  Widget build(BuildContext context) {
    policyProvider = Provider.of<PolicyProvider>(context);
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,elevation: 0,iconTheme: IconThemeData(color: Colors.black),),
      body: Padding(
        padding: const EdgeInsets.only(left: 16,right: 16,bottom: 25),
        child: SingleChildScrollView(
          child:policyProvider.isConnection == true ? Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: (){
                      policyProvider.index=0;
                    },
                    child: Container(
                      height: 56,
                      width: 164,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                          color: policyProvider.index==0? Colors.blue:Colors.white,
                          border: Border.all(color:policyProvider.index==0? Colors.blue:Colors.black12)
                      ),
                      child: Center(child: Text("Kullanım Koşulları",style: TextStyle(fontSize: 15,color:policyProvider.index==0? Colors.white:Colors.black, ))),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      policyProvider.index=1;
                    },
                    child: Container(
                      height: 56,
                      width: 164,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: policyProvider.index==1? Colors.blue:Colors.white,
                          border: Border.all(color:policyProvider.index==1? Colors.blue:Colors.black12)
                      ),
                      child: Center(child: Text("Gizlilik Politikası",style: TextStyle(fontSize: 15,color:policyProvider.index==1? Colors.white:Colors.black, ),)),
                    ),
                  )

                ],
              ),
              SizedBox(height: 25,),
              policyProvider.index==0?
              Text(policyProvider.policy??""
                ,textAlign: TextAlign.justify,):Text(policyProvider.pravicyPolicy??"",textAlign: TextAlign.justify)
            ],
          ):Center(child:Text('Bağlantınızı kontrol ediniz'),)
        ),
      ),
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {

   bool result = await InternetConnectionChecker().hasConnection;
   if(result == true) {
     policyProvider.isConnection=true;
   await policyProvider.getPolicy();
     await policyProvider.getPravicyPolicy();
   } else {
     policyProvider.isConnection=false;
   }
  }
}
