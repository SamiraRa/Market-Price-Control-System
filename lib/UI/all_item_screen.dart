// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:market_price_control_app/UI/homepage.dart';
import 'package:market_price_control_app/UI/product_details_screen.dart';

import 'package:market_price_control_app/models/product_hierarchy_model.dart';

class AllItemScreen extends StatefulWidget {
  List<ProductHierarchyModel> fullProductList;
  AllItemScreen({
    Key? key,
    required this.fullProductList,
  }) : super(key: key);

  @override
  State<AllItemScreen> createState() => _AllItemScreenState();
}

class _AllItemScreenState extends State<AllItemScreen> {
  List<Items> itemList = [];

  @override
  void initState() {
    final categoryList = widget.fullProductList.expand((element) => element.subCategoryList).toList();
    itemList = categoryList.expand((element) => element.items).toList();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
              decoration: const BoxDecoration(
            color: Color.fromARGB(255, 77, 108, 243),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          )),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 77, 108, 243),
          title: const Text(
            'All Products',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context, MaterialPageRoute(builder: (context) => Homepage()), (route) => false);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: itemList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12.0,
                  crossAxisSpacing: 12.0,
                  childAspectRatio: 2.9 / 3,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  final item = itemList[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailsScreen(
                            image: "",
                            productCat: "",
                            productSubCat: "",
                            product: item,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.deepPurple.shade50.withOpacity(0.8),
                            blurRadius: 5,
                            spreadRadius: 2,
                            blurStyle: BlurStyle.inner,
                          ),
                          BoxShadow(
                            color: Colors.black54.withOpacity(0.1),
                            offset: const Offset(0, 2),
                            blurRadius: 5,
                            spreadRadius: 2,
                            blurStyle: BlurStyle.normal,
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Container(
                              width: 80,
                              height: 60,
                              child: const CircleAvatar(
                                backgroundColor: Colors.amberAccent,
                              ),
                            ),
                          ),
                          Spacer(),
                          Text(
                            item.itemName,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(item.itemPrice),
                              Text(item.itemWeight),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
