import 'package:flutter_voltzone/data/model/charge_zone.dart';

abstract class RepositoryAbs{
  Future<List<ChargeZone>> getChargeZones();
  Future<List<ChargeZone>> getChargeZonesSearch();
}