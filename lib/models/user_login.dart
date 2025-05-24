import 'package:flutter/foundation.dart';

class UserLogin {
  final String userId;
  final String username;
  final String areaId;
  final String areaName;
  final String password;
  final String deviceId;
  final String deviceBrand;
  final String deviceModel;
  List submittedList;
  List feedList;
  List feedListInteraction;

  UserLogin({
    required this.userId,
    required this.username,
    required this.areaId,
    required this.areaName,
    required this.password,
    required this.deviceId,
    required this.deviceBrand,
    required this.deviceModel,
    required this.submittedList,
    required this.feedList,
    required this.feedListInteraction,
  });
}

class Product {
  final String productId;
  final String productName;
  final double rightPrice;

  Product({
    required this.productId,
    required this.productName,
    required this.rightPrice,
  });
}

class ProductEntry {
  final String entryId;
  final String userId;
  final String productId;
  final String productName;
  final String productWeight;
  final String productQuantity;
  final String productState;
  final String expDate;
  final String batchDate;
  final double submittedPrice;
  final DateTime date;

  ProductEntry({
    required this.entryId,
    required this.userId,
    required this.productId,
    required this.productName,
    required this.productWeight,
    required this.productQuantity,
    required this.productState,
    required this.expDate,
    required this.batchDate,
    required this.submittedPrice,
    required this.date,
  });
}

List<ProductEntry> feedList = [];
List<ProductEntry> mySubmittedList = [];



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