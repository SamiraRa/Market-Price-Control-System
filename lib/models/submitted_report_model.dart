import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
part 'submitted_report_model.g.dart';

@HiveType(typeId: 1)
class SubmittedReport {
  @HiveField(0)
  String date;
  @HiveField(1)
  String marketName;
  @HiveField(2)
  String suggestedPrice;
  @HiveField(3)
  String prevPrice;
  @HiveField(4)
  String itemName;
  @HiveField(5)
  String itemImage;
  @HiveField(6)
  String itemDetails;
  @HiveField(7)
  String expDate;
  @HiveField(8)
  String batchDate;
  @HiveField(9)
  String itemId;
  @HiveField(10)
  String itemWeight;
  @HiveField(11)
  String itemQty;
  @HiveField(12)
  String category;
  @HiveField(13)
  String subCategory;

  SubmittedReport({
    required this.date,
    required this.marketName,
    required this.suggestedPrice,
    required this.prevPrice,
    required this.itemName,
    required this.itemImage,
    required this.itemDetails,
    required this.expDate,
    required this.batchDate,
    required this.itemId,
    required this.itemWeight,
    required this.itemQty,
    required this.category,
    required this.subCategory,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'marketName': marketName,
      'suggestedPrice': suggestedPrice,
      'prevPrice': prevPrice,
      'itemName': itemName,
      'itemImage': itemImage,
      'itemDetails': itemDetails,
      'expDate': expDate,
      'batchDate': batchDate,
      'itemId': itemId,
      'itemWeight': itemWeight,
      'itemQty': itemQty,
      'category': category,
      'subCategory': subCategory,
    };
  }

  factory SubmittedReport.fromMap(Map<String, dynamic> map) {
    return SubmittedReport(
      date: map['date'] as String,
      marketName: map['marketName'] as String,
      suggestedPrice: map['suggestedPrice'] as String,
      prevPrice: map['prevPrice'] as String,
      itemName: map['itemName'] as String,
      itemImage: map['itemImage'] as String,
      itemDetails: map['itemDetails'] as String,
      expDate: map['expDate'] as String,
      batchDate: map['batchDate'] as String,
      itemId: map['itemId'] as String,
      itemWeight: map['itemWeight'] as String,
      itemQty: map['itemQty'] as String,
      category: map['category'] as String,
      subCategory: map['subCategory'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SubmittedReport.fromJson(String source) =>
      SubmittedReport.fromMap(json.decode(source) as Map<String, dynamic>);
}
