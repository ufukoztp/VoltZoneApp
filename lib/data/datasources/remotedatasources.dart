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



}