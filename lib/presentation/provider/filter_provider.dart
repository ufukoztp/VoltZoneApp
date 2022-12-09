import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_voltzone/main.dart';

import '../../data/datasources/remotedatasources.dart';
import '../../data/model/charge_zone.dart';
import '../screen/map_screen.dart';

class FilterProvider extends ChangeNotifier{
  RemoteDataSources remoteDataSources = RemoteDataSources();
  List<String> filterButtonItem=["3 kW","22 kW","50 kW","75 kW","100 kW", "150 kW"];
    List<bool> _filterButtonItemValue=List.filled(6, true);
  RangeValues _currentRangeValues = const RangeValues(3, 150);
  List<ChargeZone> _chargeList = [];
  late BuildContext context;
  bool _isConnection=true;


  bool get isConnection => _isConnection;

  set isConnection(bool value) {
    _isConnection = value;
    notifyListeners();
  }

  int _shb=1;
  int _sicon=1;



  bool _isEsarj=true;
  bool _isZes=true;
  bool _isSharz=true;
  bool _isVoltRun=true;

  int get sicon => _sicon;
  int get shb => _shb;
  List<bool> get filterButtonItemValue => _filterButtonItemValue;
  List<ChargeZone> get chargeList => _chargeList;
  RangeValues get currentRangeValues => _currentRangeValues;
  bool get isZes => _isZes;
  bool get isSharz => _isSharz;
  bool get isVoltRun => _isVoltRun;
  bool get isEsarj => _isEsarj;

  set sicon(int value) {
    _sicon = value;
    notifyListeners();
  }
  set isEsarj(bool value) {
    _isEsarj = value;
    notifyListeners();
  }
  set shb(int value) {
    _shb = value;
    notifyListeners();
  }

  set chargeList(List<ChargeZone> value) {
    _chargeList = value;
    notifyListeners();
  }

  set isZes(bool value) {
    _isZes = value;
    notifyListeners();
  }
  set isSharz(bool value) {
    _isSharz = value;
    notifyListeners();
  }

  set isVoltRun(bool value) {
    _isVoltRun = value;
    notifyListeners();
  }
  set filterButtonItemValue(List<bool> value) {
    _filterButtonItemValue = value;
    notifyListeners();
  }

  set currentRangeValues(RangeValues value) {
    _currentRangeValues = value;
    notifyListeners();
  }



  getChargeStation()async{
   chargeList = await remoteDataSources.getChargeZones();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MapScreen(chargeZone:chargeList,)));
  }

  Future getChargeStationWithFilter()async{
    List<int> selectedList=[];
    List<int> selectedListShb=[];

    if(isEsarj==true) {
      selectedListShb.add(1);
    }
    if(isZes==true) {
       selectedListShb.add(2);
    }
    if(isVoltRun==true) {
      selectedListShb.add(3);
    }
    if(isSharz==true) {
      selectedListShb.add(4);
    }


    List.generate(filterButtonItemValue.length, (index){
      if(filterButtonItemValue[index]==true){
        switch (filterButtonItem[index]){
          case '3 kW':
            selectedList.add(3);
            break;
          case '22 kW':
            selectedList.add(22);
            break;
          case '50 kW':
            selectedList.add(50);
            break;
          case '75 kW':
            selectedList.add(75);
            break;
          case '100 kW':
            selectedList.add(100);
            break;
          case '150 kW':
            selectedList.add(150);
            break;

        }
      }
    });

    const snackBar = SnackBar(
      duration: Duration(milliseconds: 1000),
      backgroundColor: Colors.blue,
      content: Text('Lütfen istasyon sahibi seçiniz'),
    );
    if(selectedListShb.length==0) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }else{
      chargeList =  await remoteDataSources.getChargeZonesFilter(sguc: selectedList,shbList: selectedListShb,sicon: sicon);
       Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>MapScreen(chargeZone:chargeList,)), (route) => false);
    }
  }
}