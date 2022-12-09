import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_voltzone/data/model/charge_zone.dart';

import '../../domain/repositories/repository.dart';

class RemoteDataSources implements RepositoryAbs{
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<List<ChargeZone>> getChargeZones() async{
    List<ChargeZone> chargeZones =[];
   var response = await  firebaseFirestore.collection("Charge Zones").get();
  for(var i in response.docs){
    chargeZones.add(ChargeZone.fromJson(i.data()));
   }
  return chargeZones;
    }

  @override
  Future<List<ChargeZone>> getChargeZonesSearch({String? filterText}) async{
    print(filterText?.toUpperCase());
    List<ChargeZone> chargeZones =[];
    var response = await  firebaseFirestore.collection("Charge Zones").where("nameCode",isEqualTo: filterText!.toUpperCase()).get();
    print(response.docs.length);
    for(var i in response.docs){
        chargeZones.add(ChargeZone.fromJson(i.data()));

    }
    return chargeZones;
  }

@override
Future<List<ChargeZone>> getChargeZonesFilter({String? filterText, List<int>? sguc,required List<int> shbList,required int sicon}) async{
   List<ChargeZone> chargeZones =[];
  List<ChargeZone> chargeZonesResponse =[];
  Set<ChargeZone> filterList =Set<ChargeZone>();
  QuerySnapshot<Map<String,dynamic>> response;


  switch (shbList.length){
    case 1:
      response= await  firebaseFirestore.collection("Charge Zones").where('shb',isEqualTo: shbList[0]).get();
      break;
    case 2:
      response= await  firebaseFirestore.collection("Charge Zones").where('shb',isEqualTo: shbList[0]).where('shb',isEqualTo: shbList[1]).get();
      break;
    case 3:
      response= await  firebaseFirestore.collection("Charge Zones").where('shb',isEqualTo: shbList[0]).where('shb',isEqualTo: shbList[1]).where('shb',isEqualTo: shbList[2]).get();
      break;
    case 4:
      response= await  firebaseFirestore.collection("Charge Zones").where('shb',isEqualTo: shbList[0]).where('shb',isEqualTo: shbList[1]).where('shb',isEqualTo: shbList[2]).where('shb',isEqualTo: shbList[3]).get();
      break;
    default:
      response= await  firebaseFirestore.collection("Charge Zones").where('shb',isEqualTo: shbList[0]).get();
    break;
  }

  response.docs.forEach((element) {
    chargeZonesResponse.add(ChargeZone.fromJson(element.data()));
  });

   chargeZonesResponse.forEach((elementZone) {
      sguc?.forEach((element) {
      if(elementZone.sguc?.length!=0){
         if(elementZone.sguc?.contains(element)==true&&elementZone.sicon?.contains(sicon)==true){
          filterList.add(elementZone);
        }
      }
    });
  });

  if(filterList.length==0){
    print('boş filtre');
  }

  chargeZones.addAll(filterList.toList());
  return chargeZones;
}

  @override
  Future<String> getPolicy() async {
     var response = await  firebaseFirestore.collection("Policy").doc('policy').get();

    return response.data()!['text'];
  }

  @override
  Future<String> getPravicyPolicy() async {
    var response = await  firebaseFirestore.collection("Policy").doc('pravicypolicy').get();

    return response.data()!['text'];
  }



}