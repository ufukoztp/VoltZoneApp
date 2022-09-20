import 'package:flutter/cupertino.dart';
import 'package:flutter_voltzone/data/datasources/remotedatasources.dart';

import '../../data/model/charge_zone.dart';

class SearchProvider extends ChangeNotifier{
TextEditingController textEditingController = TextEditingController();
RemoteDataSources remoteDataSources = RemoteDataSources();
List<ChargeZone> _chargeList = [];
List<ChargeZone> _chargeListView = [];


List<ChargeZone> get chargeListView => _chargeListView;

  set chargeListView(List<ChargeZone> value) {
    _chargeListView = value;
    notifyListeners();
  }

  List<ChargeZone> get chargeList => _chargeList;

  set chargeList(List<ChargeZone> value) {
    _chargeList = value;
    notifyListeners();
  }

  Future getChargeZonesSearch() async{
 var result= await remoteDataSources.getChargeZonesSearch(filterText: textEditingController.text);

  chargeList.addAll(result);
  notifyListeners();
  }

Future getChargeZones()async{
    chargeListView.clear();
    chargeList.clear();
  var result = await remoteDataSources.getChargeZones();
  chargeList.addAll(result);
  chargeListView.addAll(result);
   notifyListeners();
}
}