import 'package:flutter/cupertino.dart';

class StationDetailProvider extends ChangeNotifier{
String? _name;
String? _address;
int? _point;
String? _photo;
int? _shb;

String? get address => _address;
int? get point => _point;
String? get name => _name;
int? get shb => _shb;
String? get photo => _photo;

  set address(String? value) {
    _address = value;
    notifyListeners();

  }


  set point(int? value) {
    _point = value;
    notifyListeners();

  }

set name(String? value) {
  _name = value;
  notifyListeners();
}


  set photo(String? value) {
    _photo = value;
    notifyListeners();
  }

  set shb(int? value) {
    _shb = value;
    notifyListeners();

  }
}