import 'package:flutter_voltzone/data/model/charge_zone.dart';

abstract class RepositoryAbs{
  Future<List<ChargeZone>> getChargeZones();
  Future<List<ChargeZone>> getChargeZonesSearch();
  Future<String> getPolicy();
  Future<String> getPravicyPolicy();
}