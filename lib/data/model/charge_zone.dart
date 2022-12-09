class ChargeZone{
  String? name;
   String? lat;
  String? long;
  String? color;
  List<dynamic>? sguc;
   int? shb;
   List<dynamic>? sicon;
   List<dynamic>? stip;
  String? stip2;
  String? trf;

  ChargeZone.fromJson(Map<String, dynamic> json) {
    name = json['isim'];
     lat = json['lat'];
    long = json['long'];
    color = json['renk'];
    sguc = json['sguc'];
     shb = json['shb'];
    sicon = json['sicon'];
     stip = json['stip'];
     trf = json['trf'];
  }

}