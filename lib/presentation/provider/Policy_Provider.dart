import 'package:flutter/cupertino.dart';
import 'package:flutter_voltzone/data/datasources/remotedatasources.dart';

class PolicyProvider extends ChangeNotifier{
  RemoteDataSources remoteDataSources = RemoteDataSources();

  bool _isConnection=true;

  bool get isConnection => _isConnection;

  set isConnection(bool value) {
    _isConnection = value;
    notifyListeners();
  }

  int _index=0;

  int get index => _index;

   String? _policy;
   String? _pravicyPolicy;


  String? get pravicyPolicy => _pravicyPolicy;

  set pravicyPolicy(String? value) {
    _pravicyPolicy = value;
    notifyListeners();
  }

  String? get policy => _policy;

  set policy(String? value) {
    _policy = value;
    notifyListeners();
  }

  set index(int value) {
    _index = value;
    notifyListeners();
  }
  Future getPolicy()async{
   policy = await remoteDataSources.getPolicy();
   notifyListeners();
  }

  Future getPravicyPolicy()async{
    pravicyPolicy = await remoteDataSources.getPravicyPolicy();
    print(pravicyPolicy);
    notifyListeners();

  }
}