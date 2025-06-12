// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

List<PublicFeed> publicFeedFromJson(String str) =>
    List<PublicFeed>.from(json.decode(str).map((x) => PublicFeed.fromJson(x)));

String publicFeedToJson(List<PublicFeed> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PublicFeed {
  String userId;
  String userName;
  String itemName;
  String itemId;
  String itemImage;
  String submittedPrice;
  String prevPrice;
  String upvotedCount;
  String downvotedCount;
  String itemWeight;
  String itemQuantity;
  String itemSuggestedWeight;
  String itemSuggestedQuantity;
  String expDate;
  String batchDate;
  String uploadedAt;
  String areaName;
  String areaId;
  String marketName;
  String marketId;
  String districtName;
  String approvalStatus;
  String userAction;
  String formId;

  PublicFeed({
    required this.userId,
    required this.userName,
    required this.itemName,
    required this.itemId,
    required this.itemImage,
    required this.submittedPrice,
    required this.prevPrice,
    required this.upvotedCount,
    required this.downvotedCount,
    required this.itemWeight,
    required this.itemQuantity,
    required this.itemSuggestedWeight,
    required this.itemSuggestedQuantity,
    required this.expDate,
    required this.batchDate,
    required this.uploadedAt,
    required this.areaName,
    required this.areaId,
    required this.marketName,
    required this.marketId,
    required this.districtName,
    required this.approvalStatus,
    required this.userAction,
    required this.formId,
  });

  factory PublicFeed.fromJson(Map<String, dynamic> json) => PublicFeed(
        userId: json["user_id"],
        userName: json["user_name"],
        itemName: json["item_name"],
        itemId: json["item_id"],
        itemImage: json["item_image_path"],
        submittedPrice: json["item_suggested_price"],
        prevPrice: json["item_app_price"],
        upvotedCount: json["like_count"],
        downvotedCount: json["dislike_count"],
        itemWeight: json["item_net_weight"],
        itemQuantity: json["item_quantity"],
        expDate: json["exp_date"],
        batchDate: json["batch_date"],
        uploadedAt: json["created_at"],
        areaName: json["area_name"],
        areaId: json["area_id"],
        marketName: json["market_name"],
        marketId: json["market_id"],
        districtName: json["address"],
        approvalStatus: json["approval_status"],
        userAction: json["user_action"],
        formId: json["form_id"],
        itemSuggestedWeight: json["item_suggested_net_weight"],
        itemSuggestedQuantity: json["item_suggested_qty"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "user_name": userName,
        "item_name": itemName,
        "item_id": itemId,
        "item_image_path": itemImage,
        "item_suggested_price": submittedPrice,
        "item_app_price": prevPrice,
        "like_count": upvotedCount,
        "dislike_count": downvotedCount,
        "item_net_weight": itemWeight,
        "item_quantity": itemQuantity,
        "exp_date": expDate,
        "batch_date": batchDate,
        "created_at": uploadedAt,
        "area_name": areaName,
        "area_id": areaId,
        "market_name": marketName,
        "market_id": marketId,
        "address": districtName,
        "approval_status": approvalStatus,
        "user_action": userAction,
        "form_id": formId,
        "item_suggested_net_weight": itemSuggestedWeight,
        "item_suggested_qty": itemSuggestedQuantity,
      };
}
