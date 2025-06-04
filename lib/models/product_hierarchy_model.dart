// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

List<ProductHierarchyModel> productHierarchyModelFromJson(String str) =>
    List<ProductHierarchyModel>.from(json.decode(str).map((x) => ProductHierarchyModel.fromJson(x)));

String productHierarchyModelToJson(List<ProductHierarchyModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductHierarchyModel {
  String category;
  List<SubCategoryList> subCategoryList;

  ProductHierarchyModel({
    required this.category,
    required this.subCategoryList,
  });

  factory ProductHierarchyModel.fromJson(Map<String, dynamic> json) => ProductHierarchyModel(
        category: json["category"] ?? "",
        subCategoryList:
            List<SubCategoryList>.from(json["sub_category_list"].map((x) => SubCategoryList.fromJson(x)) ?? []),
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "sub_category_list": List<dynamic>.from(subCategoryList.map((x) => x.toJson())),
      };
}

class SubCategoryList {
  String subCategory;
  List<Items> items;

  SubCategoryList({
    required this.subCategory,
    required this.items,
  });

  factory SubCategoryList.fromJson(Map<String, dynamic> json) => SubCategoryList(
        subCategory: json["sub_category"],
        items: List<Items>.from(json["item_list"].map((x) => Items.fromJson(x)) ?? []),
      );

  Map<String, dynamic> toJson() => {
        "sub_category": subCategory,
        "item_list": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Items {
  String itemName;
  String itemId;
  String itemDetails;
  String itemQuantity;
  String itemWeight;
  String itemPrice;
  String itemImagePath;
  String batchDate;
  String expDate;

  Items({
    required this.itemName,
    required this.itemId,
    required this.itemDetails,
    required this.itemQuantity,
    required this.itemWeight,
    required this.itemPrice,
    required this.itemImagePath,
    required this.batchDate,
    required this.expDate,
  });

  factory Items.fromJson(Map<String, dynamic> json) => Items(
        itemName: json["item_name"],
        itemId: json["item_id"],
        itemDetails: json["item_details"],
        itemQuantity: json["item_quantity"],
        itemWeight: json["item_weight"],
        itemPrice: json["item_price"],
        batchDate: json["batch_date"],
        expDate: json["exp_date"],
        itemImagePath: json["item_image_path"],
      );

  Map<String, dynamic> toJson() => {
        "item_name": itemName,
        "item_id": itemId,
        "item_details": itemDetails,
        "item_quantity": itemQuantity,
        "item_weight": itemWeight,
        "item_price": itemPrice,
        "batch_date": batchDate,
        "exp_date": expDate,
        "item_image_path": itemImagePath,
      };
}
