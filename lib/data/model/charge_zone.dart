class ChargeZone{
  String? name;
  String? nameCode;
  String? lat;
  String? long;
  String? color;
  int? sguc;
  int? sguc2;
  int? shb;
  int? sicon1;
  int? sicon2;
  String? stip;
  String? stip2;
  String? trf;

  ChargeZone.fromJson(Map<String, dynamic> json) {
    name = json['isim'];
    nameCode = json['nameCode'];
    lat = json['lat'];
    long = json['long'];
    color = json['renk'];
    sguc = json['sguc'];
    sguc2 = json['sguc2'];
    shb = json['shb'];
    sicon1 = json['sicon1'];
    sicon2 = json['sicon2'];
    stip = json['stip'];
    stip2 = json['stip2'];
    trf = json['trf'];
  }

}