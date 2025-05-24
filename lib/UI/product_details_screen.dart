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
  int quantity = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    InputDecorationTheme inputDecoration =
        Theme.of(context).inputDecorationTheme;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
              decoration: BoxDecoration(
            color: Color.fromARGB(255, 77, 108, 243),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          )),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 77, 108, 243),
          title: const Text(
            'Product Survey',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 12, 8, 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${widget.productCat} > ${widget.productSubCat}",
                      style: const TextStyle(fontSize: 17),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: SizedBox(
                          height: 25,
                          width: 25,
                          child: CircleAvatar(
                              backgroundColor: Colors.red.withOpacity(0.8),
                              child: Icon(
                                Icons.close,
                                size: 20,
                                color: Colors.white,
                              )),
                        ))
                  ],
                ),
                Text(
                  widget.productName,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 6,
                    width: MediaQuery.of(context).size.width / 2,
                    child: Hero(
                        tag: "aaaa",
                        transitionOnUserGestures: true,
                        child: Image.asset(widget.image)),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "350 | 280gm",
                        // "${widget.productDetail["price"]}| ${widget.productDetail["net-weight"]}",
                        style: const TextStyle(fontSize: 18),
                      ),

                      InkWell(
                        onTap: () {},
                        child: Image.asset(
                          "assets/icons/quality-assurance.png",
                          height: 35,
                          width: 35,
                          color: Colors.black54,
                        ),
                      )
                      // IconButton(
                      //   icon: Icon(
                      //     Icons.flash_on_sharp,
                      //     // color: Colors.purple[100],
                      //     size: 38,
                      //   ),
                      //   onPressed: () {},
                      // )
                    ],
                  ),
                ),
                // const SizedBox(
                //   height: 10,
                // ),
                Text(
                  "Product Details: ",
                  style: const TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Fresh Indian spinach, ideal for curries.",
                  // style: const TextStyle(
                  //     decoration: TextDecoration.underline,
                  //     fontSize: 16,
                  //     fontWeight: FontWeight.w500,
                  //     fontStyle: FontStyle.italic),
                ),
                const SizedBox(
                  height: 10,
                ),

                const Divider(),
                SizedBox(
                  height: 10,
                ),

                Text(
                  "Survey Form",
                  style: const TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic),
                ),

                SizedBox(
                  height: 10,
                ),

                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Enter Area',
                            labelStyle: TextStyle(fontSize: 13),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Enter Market Name',
                            labelStyle: TextStyle(fontSize: 13),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),

                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        height: 50,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Suggest Your Price',
                            labelStyle: TextStyle(fontSize: 13),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 50,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Net Weight',
                            labelStyle: TextStyle(fontSize: 13),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 50,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Quantity',
                            labelStyle: TextStyle(fontSize: 13),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                const SizedBox(
                  height: 35,
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 77, 108, 243),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      fixedSize: const Size(170, 40),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
