import 'dart:typed_data';

import 'DefectType.dart';

class Defect {
  String certificate = '';
  String position = '';
  String productType = '';
  DefectType defectType = DefectType();
  String notificationNum = '';
  double marriageWeight;
  String settlement = '';
  String notes = '';
  List<Uint8List> images = [];

  Defect clone() => Defect()
    ..certificate = certificate
    ..position = position
    ..productType = productType
    ..defectType = defectType
    ..notificationNum = notificationNum
    ..marriageWeight = marriageWeight
    ..settlement = settlement
    ..notes = notes
    ..images = List.from(images);
}