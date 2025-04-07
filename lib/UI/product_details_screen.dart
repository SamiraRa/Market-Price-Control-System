// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  String image;
  String productName;
  String productCat;
  String productSubCat;
  ProductDetailsScreen({
    Key? key,
    required this.image,
    required this.productName,
    required this.productCat,
    required this.productSubCat,
  }) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    print(widget.productCat);
    print(widget.productSubCat);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 229, 240),
      appBar: AppBar(
        title: const Text(
          "Market Overview",
          style: TextStyle(
            fontSize: 19,
            color: Color.fromARGB(255, 49, 40, 5),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 207, 194, 231),
      ),
      body: Column(
        children: [
          Image.asset(
            widget.image,
            height: 90,
            width: 90,
          ),
          Text(widget.productName),
          Text(widget.productCat),
          Text(widget.productSubCat),
        ],
      ),
    );
  }
}
