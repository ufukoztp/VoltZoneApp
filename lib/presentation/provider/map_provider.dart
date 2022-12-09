import 'dart:async';
 import 'dart:typed_data';
 import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_voltzone/data/model/charge_zone.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:safe_device/safe_device.dart';
import 'dart:ui' as ui;
import'dart:io' show Platform;


import '../../data/datasources/remotedatasources.dart';

class MapProvider extends ChangeNotifier{
  RemoteDataSources remoteDataSources = RemoteDataSources();
  int _currentIndex = 0;
  double? _latitude;




  double? _longitude;
  List<ChargeZone> _chargeList = [];
  bool _stationInfoVisibility=false;
  Map<MarkerId, Marker> _markers = <MarkerId, Marker>{};
  Map<MarkerId, Marker> get markers => _markers;
  final Completer<GoogleMapController> mapController = Completer();
  bool _isLoading = false;
  bool? _isLocationPermission;
  String? _zoneAddress;
  String? _zoneName;
  String? lat;
  String? long;
  List<dynamic>? _stipi=[];
  List<dynamic>? _sicon=[];
  List<dynamic>? _sguc=[];
  int? _shb;
  bool _isConnection=true;
  BuildContext? context;


  bool get isConnection => _isConnection;

  set isConnection(bool value) {
    _isConnection = value;
    notifyListeners();
  }

  String? get zoneName => _zoneName;
  String? get zoneAddress => _zoneAddress;
  bool get isLoading => _isLoading;
  bool get stationInfoVisibility => _stationInfoVisibility;
  List<dynamic>? get stipi => _stipi;
  int? get shb => _shb;
  double? get longitude => _longitude;
  int get currentIndex => _currentIndex;
  List<dynamic>? get sguc => _sguc;
  List<ChargeZone> get chargeList => _chargeList;
  List<dynamic>? get sicon => _sicon;
  bool? get isLocationPermission => _isLocationPermission;
  double? get latitude => _latitude;

  set sicon(List<dynamic>? value) {
    _sicon = value;
  }

  set shb(int? value) {
    _shb = value;
    notifyListeners();
  }
  set sguc(List<dynamic>? value) {
    _sguc = value;
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

  set stipi(List<dynamic>? value) {
    _stipi = value;
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
  set latitude(double? value) {
    _latitude = value;
    notifyListeners();
  }
  set longitude(double? value) {
    _longitude = value;
    notifyListeners();
  }
  set currentIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }
  set markers(Map<MarkerId, Marker> value) {
    _markers = value;
    notifyListeners();
  }
  set isLocationPermission(bool? value) {
    _isLocationPermission = value;
    notifyListeners();
  }


  Future getChargeZones()async{
    chargeList.clear();
  var result = await remoteDataSources.getChargeZones();
  chargeList.addAll(result);
  print(chargeList.length);
   isLoading=true;
      notifyListeners();
}

  void onMapCreated(GoogleMapController controller) async{



     markers.clear();
     var markerIcon="";

      if(Platform.isIOS==true){

       chargeList.forEach((element) async {
         if(element.shb==1&&element.color=="mavi")  markerIcon = "assets/esarjacicon1_ios.png";
         if(element.shb==2&&element.color=="mavi")  markerIcon = "assets/zesacicon1_ios.png";
         if(element.shb==3&&element.color=="mavi")  markerIcon = "assets/voltrunacicon1_ios.png";
         if(element.shb==4&&element.color=="mavi")  markerIcon = "assets/sharznetacicon_ios.png";
         if(element.shb==1&&element.color=="tur")  markerIcon = "assets/esarjdcicon1_ios.png";
         if(element.shb==2&&element.color=="tur")  markerIcon = "assets/zesdcicon1_ios.png";
         if(element.shb==3&&element.color=="tur")  markerIcon = "assets/voltrundcicon1_ios.png";
         if(element.shb==4&&element.color=="tur")  markerIcon = "assets/sharznetacicon_ios.png";

         // final Uint8List markerIconFromBytes = await getBytesFromAsset(markerIcon, 120);
         //  BitmapDescriptor.fromBytes(markerIconFromBytes),
         var icon = await BitmapDescriptor.fromAssetImage(
             ImageConfiguration(devicePixelRatio: 3.2,size: ui.Size(100,100)),
             markerIcon);

         var marker = Marker(
           onTap: (){
             zoneName = element.name;
             zoneAddress = element.trf;
             sguc = element.sguc;
             stipi = element.stip;
             sicon = element.sicon ;
             lat=element.lat;
             long=element.long;
             shb = element.shb;
             stationInfoVisibility = true;
             notifyListeners();
           },

           icon:icon,
           markerId: MarkerId(element.name!),
           position: LatLng(double.parse(element.lat??"2.30"), double.parse(element.long??"2.30")),
           // icon: BitmapDescriptor.,

         );

         markers[MarkerId(element.name!)] = marker;
       });


     }else{

       chargeList.forEach((element) async {
         if(element.shb==1&&element.color=="mavi")  markerIcon = "assets/esarjacicon1.png";
         if(element.shb==2&&element.color=="mavi")  markerIcon = "assets/zesacicon1.png";
         if(element.shb==3&&element.color=="mavi")  markerIcon = "assets/voltrunacicon1.png";
         if(element.shb==4&&element.color=="mavi")  markerIcon = "assets/sharznetacicon.png";
         if(element.shb==1&&element.color=="tur")  markerIcon = "assets/esarjdcicon1.png";
         if(element.shb==2&&element.color=="tur")  markerIcon = "assets/zesdcicon1.png";
         if(element.shb==3&&element.color=="tur")  markerIcon = "assets/voltrundcicon1.png";
         if(element.shb==4&&element.color=="tur")  markerIcon = "assets/sharznetacicon.png";

         // final Uint8List markerIconFromBytes = await getBytesFromAsset(markerIcon, 120);
         //  BitmapDescriptor.fromBytes(markerIconFromBytes),
         var icon = await BitmapDescriptor.fromAssetImage(
             ImageConfiguration(devicePixelRatio: 3.2,size: ui.Size(100,100)),
             markerIcon);

         var marker = Marker(
           onTap: (){
             zoneName = element.name;
             zoneAddress = element.trf;
             sguc = element.sguc;
             stipi = element.stip;
             sicon = element.sicon ;
             lat=element.lat;
             long=element.long;
             shb = element.shb;
             stationInfoVisibility = true;
             notifyListeners();
           },

           icon:icon,
           markerId: MarkerId(element.name!),
           position: LatLng(double.parse(element.lat??"2.30"), double.parse(element.long??"2.30")),
           // icon: BitmapDescriptor.,

         );

         markers[MarkerId(element.name!)] = marker;
       });
     }


    notifyListeners();
  }
      CameraPosition? _kGooglePlex;

  CameraPosition? get kGooglePlex => _kGooglePlex;

  set kGooglePlex(CameraPosition? value) {
    _kGooglePlex = value;
    notifyListeners();
  }

 Future getLocation()async{
   bool isRealDevice = await SafeDevice.isRealDevice;
   if(isRealDevice==true){
     Location location =  Location();
     bool _serviceEnabled;
     PermissionStatus _permissionGranted;
     LocationData _locationData;

     _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
       _serviceEnabled = await location.requestService();
       if (!_serviceEnabled) {
         isLocationPermission =true;
         return;
       }
     }

     _permissionGranted = await location.hasPermission();
     if (_permissionGranted == PermissionStatus.denied) {
       _permissionGranted = await location.requestPermission();
     }

     if (_permissionGranted != PermissionStatus.granted) {
       isLocationPermission =true;
       return;
     }
     _locationData = await location.getLocation();
     kGooglePlex= CameraPosition(
       target: LatLng(_locationData.latitude!, _locationData.longitude!), zoom: 12,);
     isLocationPermission =true;
     notifyListeners();

   }else{
     isLocationPermission=true;
     notifyListeners();
   }

   }


  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }

  moveMyLocation()async{
    final GoogleMapController controller = await mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(kGooglePlex!));
   }
}