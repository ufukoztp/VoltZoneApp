import 'dart:async';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter_voltzone/data/model/charge_zone.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../data/datasources/remotedatasources.dart';

class MapProvider extends ChangeNotifier{
  RemoteDataSources remoteDataSources = RemoteDataSources();


  List<ChargeZone> _chargeList = [];
  bool _stationInfoVisibility=false;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  final Completer<GoogleMapController> mapController = Completer();
  bool _isLoading = false;



  String? _zoneAddress;
  String? _zoneName;
  String? _stipi1;
  String? _stipi2;
  int? _sicon1;
  int? _sicon2;
  int? _shb;



  String? get zoneName => _zoneName;
  String? get zoneAddress => _zoneAddress;
  bool get isLoading => _isLoading;
  String? get stipi2 => _stipi2;
  bool get stationInfoVisibility => _stationInfoVisibility;
  String? get stipi1 => _stipi1;
  int? get shb => _shb;

  List<ChargeZone> get chargeList => _chargeList;
  int? get sicon2 => _sicon2;
  int? get sicon1 => _sicon1;

  set sicon1(int? value) {
    _sicon1 = value;
  }

  set shb(int? value) {
    _shb = value;
    notifyListeners();
  }

  set sicon2(int? value) {
    _sicon2 = value;
    notifyListeners();
  }
  set stationInfoVisibility(bool value) {
    _stationInfoVisibility = value;
    notifyListeners();
  }
  set chargeList(List<ChargeZone> value) {
    _chargeList = value;
    notifyListeners();
  }

  set stipi1(String? value) {
    _stipi1 = value;
  }

  set stipi2(String? value) {
    _stipi2 = value;
    notifyListeners();
  }

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  set zoneAddress(String? value) {
    _zoneAddress = value;
    notifyListeners();
  }

  set zoneName(String? value) {
    _zoneName = value;
    notifyListeners();
  }

Future getChargeZones()async{
  var result = await remoteDataSources.getChargeZones();
  chargeList.addAll(result);
  isLoading=true;
  notifyListeners();
}

  void onMapCreated(GoogleMapController controller) async{
    mapController.complete(controller);
    var markerIcon="";
    chargeList.forEach((element)async {
      if(element.shb==1)  markerIcon = "assets/esarjacicon1.png";
      if(element.shb==2)  markerIcon = "assets/zesacicon1.png";
      if(element.shb==3)  markerIcon = "assets/voltrunacicon1.png";
      if(element.shb==4)  markerIcon = "assets/sharznetacicon.png";
       var marker = Marker(
         onTap: (){
           zoneName = element.name;
           zoneAddress = element.trf;
           stipi1 = element.stip;
           stipi2 = element.stip2;
           sicon1 = element.sicon1;
           sicon2 = element.sicon2;
           shb = element.shb;
           stationInfoVisibility = true;
           notifyListeners();
         },
         icon:await BitmapDescriptor.fromAssetImage(ImageConfiguration(devicePixelRatio: 3.2),markerIcon) ,
        markerId: MarkerId(element.name!),
        position: LatLng(double.parse(element.lat!), double.parse(element.long!)),
        // icon: BitmapDescriptor.,

      );

      markers[MarkerId(element.name!)] = marker;
    });

    notifyListeners();
  }
   final CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(40.952518, 29.122024),
    zoom: 14.4746,
  );

}