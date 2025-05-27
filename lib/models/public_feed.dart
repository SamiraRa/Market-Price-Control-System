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
  String expDate;
  String batchDate;
  String uploadedAt;
  String areaName;
  String areaId;
  String marketName;
  String marketId;
  String districtName;

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
    required this.expDate,
    required this.batchDate,
    required this.uploadedAt,
    required this.areaName,
    required this.areaId,
    required this.marketName,
    required this.marketId,
    required this.districtName,
  });

  factory PublicFeed.fromJson(Map<String, dynamic> json) => PublicFeed(
        userId: json["user_id"],
        userName: json["user_name"],
        itemName: json["item_name"],
        itemId: json["item_id"],
        itemImage: json["item_image"],
        submittedPrice: json["submitted_price"],
        prevPrice: json["prev_price"],
        upvotedCount: json["upvoted_count"],
        downvotedCount: json["downvoted_count"],
        itemWeight: json["item_weight"],
        itemQuantity: json["item_quantity"],
        expDate: json["exp_date"],
        batchDate: json["batch_date"],
        uploadedAt: json["uploaded_at"],
        areaName: json["area_name"],
        areaId: json["area_id"],
        marketName: json["market_name"],
        marketId: json["market_id"],
        districtName: json["district_name"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "user_name": userName,
        "item_name": itemName,
        "item_id": itemId,
        "item_image": itemImage,
        "submitted_price": submittedPrice,
        "prev_price": prevPrice,
        "upvoted_count": upvotedCount,
        "downvoted_count": downvotedCount,
        "item_weight": itemWeight,
        "item_quantity": itemQuantity,
        "exp_date": expDate,
        "batch_date": batchDate,
        "uploaded_at": uploadedAt,
        "area_name": areaName,
        "area_id": areaId,
        "market_name": marketName,
        "market_id": marketId,
        "district_name": districtName,
      };
}
