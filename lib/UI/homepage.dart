import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:market_price_control_app/UI/product_details_screen.dart';
import 'package:market_price_control_app/constants.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController? productController = TextEditingController();
  TextEditingController? subProductController = TextEditingController();
  List<String> productList = ["Meat", "Daal/Lentils", "Rice", "Noodles"];
  List<String> subProductList = ["Beef", "Mutton", "Lamb"];
  List<Map<String, dynamic>> divisionList = [
    {
      "name": "Dhaka",
      "color": const Color(0xFF0D47A1), // Bold deep blue
      "borderColor": const Color(0xFF5472D3), // Softer blue
      "select": false
    },
    {
      "name": "Chittagong",
      "color": const Color(0xFF2E7D32), // Deep green
      "borderColor": const Color(0xFF81C784), // Light green
      "select": false
    },
    {
      "name": "Rajshahi",
      "color": const Color(0xFFB71C1C), // Deep crimson
      "borderColor": const Color(0xFFE57373), // Soft red
      "select": false
    },
    {
      "name": "Khulna",
      "color": const Color(0xFFE65100), // Rich orange
      "borderColor": const Color(0xFFFFB74D), // Light amber
      "select": false
    },
    {
      "name": "Barisal",
      "color": const Color(0xFF6A1B9A), // Deep purple
      "borderColor": const Color(0xFFBA68C8), // Lilac
      "select": false
    },
    {
      "name": "Sylhet",
      "color": const Color(0xFF00838F), // Teal
      "borderColor": const Color(0xFF4DD0E1), // Cyan tint
      "select": false
    },
    {
      "name": "Rangpur",
      "color": const Color(0xFF4E342E), // Rich brown
      "borderColor": const Color(0xFFA1887F), // Light mocha
      "select": false
    },
    {
      "name": "Mymensingh",
      "color": const Color(0xFF1A237E), // Deep indigo
      "borderColor": const Color(0xFF7986CB), // Light indigo
      "select": false
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  showModalSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 8.0, top: 5),
                  child: Text(
                    "Select Your City:",
                    style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 30, 4, 148),
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GridView.builder(
                    shrinkWrap: true,
                    itemCount: divisionList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // number of items in each row
                      mainAxisSpacing: 8.0, // spacing between rows
                      crossAxisSpacing: 8.0, // spacing between columns
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: divisionList[index]["color"],
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                                width: 2,
                                color: divisionList[index]["borderColor"])),
                        child: Center(
                            child: Text(
                          divisionList[index]["name"],
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        )),
                      );
                    })
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 229, 240),
      appBar: AppBar(
        title: const Text(
          "Product List",
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
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          // IconButton(
          //     onPressed: () {
          //       showModalSheet();
          //     },
          //     icon: const Icon(Icons.abc))
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Row(
              children: [
                Expanded(
                  child: CustomDropdown.search(
                    hintText: 'Select Category',
                    items: productList,
                    excludeSelected: false,
                    onChanged: (value) {
                      productController!.text = value!;
                      setState(() {});
                    },
                    listItemBuilder: (context, item, isSelected, onItemSelect) {
                      return SizedBox(
                        width: double.maxFinite,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            item,
                            style: const TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomDropdown.search(
                    hintText: 'Select Sub Category',
                    items: subProductList,
                    excludeSelected: false,
                    onChanged: (value) {
                      subProductController!.text = value!;
                      setState(() {});
                      // log('changing value to: $value');
                    },
                    listItemBuilder: (context, item, isSelected, onItemSelect) {
                      return SizedBox(
                        width: double.maxFinite,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            item,
                            style: const TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
                shrinkWrap: true,
                itemCount: meatList.length,
                physics: const BouncingScrollPhysics(),
                // padding: EdgeInsets.only(left: 5),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // number of items in each row
                  mainAxisSpacing: 8.0, // spacing between rows
                  crossAxisSpacing: 8.0, // spacing between columns
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 35.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductDetailsScreen(
                                      image: meatList[index]["imageName"],
                                      productName: meatList[index]["name"],
                                      productCat: productController!.text,
                                      productSubCat: subProductController!.text,
                                    )));
                      },
                      child: Container(
                        // height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // const SizedBox(
                            //   height: 18,
                            // ),
                            Stack(
                              children: <Widget>[
                                Image.asset(
                                  meatList[index]["imageName"],
                                  width: 110,
                                  fit: BoxFit.scaleDown,
                                ),
                                // Positioned(
                              ],
                            ), // Expanded(

                            const SizedBox(
                              height: 18,
                            ),
                            Text(meatList[index]["price"]),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              meatList[index]["name"],
                              overflow: TextOverflow.ellipsis,
                              // style: textTheme.bodyMedium
                              // const TextStyle(color: Colors.black, fontSize: 17),
                            ),
                            // const SizedBox(
                            //   height: 20,
                            // ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     widget.quantity != ""
                            //         ? Text(widget.quantity)
                            //         : const Text("1kg"),
                            //     IconButton(
                            //         onPressed: () {},
                            //         icon: const Icon(
                            //           Icons.flash_on_sharp,
                            //           size: 15,
                            //           color: Colors.grey,
                            //         ))
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

                            //   bottom: 2,
                            //   left: animation == false
                            //       ? itemQuantity == 0
                            //           ? 65
                            //           : 0
                            //       : 65,
                            //   right: 0,
                            //   child: itemQuantity == 0
                            //       ? InkWell(
                            //           onTap: () {
                            //             setState(() {
                            //               itemQuantity++;
                            //               Timer(const Duration(seconds: 2), () {
                            //                 setState(() {
                            //                   animation = true;

                            //                   print(animation);
                            //                 });
                            //               });
                            //             });
                            //           },
                            //           child: const Icon(
                            //             Icons.add_circle,
                            //             color: Colors.purple,
                            //             size: 36,
                            //           ),
                            //         )
                            //       : animation == false
                            //           ? Container(
                            //               height: 35,
                            //               decoration: BoxDecoration(
                            //                   color: Colors.white,
                            //                   borderRadius:
                            //                       BorderRadius.circular(15),
                            //                   border: Border.all(
                            //                       color: Colors.purple)),
                            //               child: Row(
                            //                 mainAxisAlignment:
                            //                     MainAxisAlignment.spaceBetween,
                            //                 children: [
                            //                   IconButton(
                            //                       onPressed: () {
                            //                         setState(() {
                            //                           itemQuantity--;
                            //                           Timer(
                            //                               const Duration(
                            //                                   seconds: 5), () {
                            //                             setState(() {
                            //                               animation = true;

                            //                               print(animation);
                            //                             });
                            //                           });
                            //                         });
                            //                       },
                            //                       icon: const Icon(
                            //                         Icons.remove_circle,
                            //                         color: Colors.purple,
                            //                         size: 20,
                            //                       )),
                            //                   Text(
                            //                     itemQuantity.toString(),
                            //                     style: textTheme.bodySmall
                            //                         ?.copyWith(
                            //                             color: cOLORBlack),
                            //                   ),
                            //                   IconButton(
                            //                     onPressed: () {
                            //                       setState(() {
                            //                         itemQuantity++;
                            //                         Timer(
                            //                             const Duration(
                            //                                 seconds: 5), () {
                            //                           setState(() {
                            //                             animation = true;

                            //                             print(animation);
                            //                           });
                            //                         });
                            //                       });
                            //                     },
                            //                     icon: const Icon(
                            //                       Icons.add_circle,
                            //                       color: Colors.purple,
                            //                       size: 20,
                            //                     ),
                            //                   ),
                            //                 ],
                            //               ),
                            //             )
                            //           : InkWell(
                            //               onTap: () {
                            //                 setState(() {
                            //                   animation = false;
                            //                 });
                            //               },
                            //               child: CircleAvatar(
                            //                 backgroundColor: Colors.purple,
                            //                 child: Text(
                            //                   itemQuantity.toString(),
                            //                   style: const TextStyle(
                            //                       color: Colors.white),
                            //                 ),
                            //               ),
                            //             ),
                            // ),