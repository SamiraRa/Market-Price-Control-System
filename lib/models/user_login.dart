// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_flutter/hive_flutter.dart';

part 'user_login.g.dart';

@HiveType(typeId: 2)
class UserLogin {
  @HiveField(0)
  final String userId;
  @HiveField(1)
  final String username;
  @HiveField(2)
  final String areaId;
  @HiveField(3)
  final String areaName;
  @HiveField(4)
  final String password;
  @HiveField(5)
  final String deviceId;
  @HiveField(6)
  final String deviceBrand;
  @HiveField(7)
  final String deviceModel;
  @HiveField(8)
  final String gender;
  @HiveField(9)
  final String phoneNum;
  @HiveField(10)
  final String address;
  @HiveField(11)
  final String nid;
  @HiveField(12)
  final String email;
  @HiveField(13)
  final String dateOfBirth;
  @HiveField(14)
  final String age;
  @HiveField(15)
  String likedForms;
  // List submittedList;
  // List feedList;
  // List feedListInteraction;

  UserLogin({
    required this.userId,
    required this.username,
    required this.areaId,
    required this.areaName,
    required this.password,
    required this.deviceId,
    required this.deviceBrand,
    required this.deviceModel,
    required this.gender,
    required this.phoneNum,
    required this.address,
    required this.nid,
    required this.email,
    required this.dateOfBirth,
    required this.age,
    required this.likedForms,
  });
}

// class Product {
//   final String productId;
//   final String productName;
//   final double rightPrice;

//   Product({
//     required this.productId,
//     required this.productName,
//     required this.rightPrice,
//   });
// }

// class ProductEntry {
//   final String entryId;
//   final String userId;
//   final String productId;
//   final String productName;
//   final String productWeight;
//   final String productQuantity;
//   final String productState;
//   final String expDate;
//   final String batchDate;
//   final double submittedPrice;
//   final DateTime date;

//   ProductEntry({
//     required this.entryId,
//     required this.userId,
//     required this.productId,
//     required this.productName,
//     required this.productWeight,
//     required this.productQuantity,
//     required this.productState,
//     required this.expDate,
//     required this.batchDate,
//     required this.submittedPrice,
//     required this.date,
//   });
// }

// List<ProductEntry> feedList = [];
// List<ProductEntry> mySubmittedList = [];



// class FeedList {
//  int upVote;
//  int downVote;
//  int  commentCount;
//  List<Comments>  commentList;
//  int  commentCount;
//  int  commentCount;


// }




// class Comments{
// int commentId;
// String commentText;
// String commentUser;
// int commentLikerCount;
// int commentDisLiker;

// }