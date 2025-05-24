import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:geolocator/geolocator.dart';
import 'package:market_price_control_app/UI/explore.dart';
import 'package:market_price_control_app/UI/product_details_screen.dart';
import 'package:market_price_control_app/UI/submitted_report_screen.dart';
import 'package:market_price_control_app/models/product_hierarchy_model.dart';
import 'package:market_price_control_app/utils/constants.dart';
import 'package:market_price_control_app/utils/dummy_data.dart';

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
  List<String> subCategoryList = [];
  List<String> categoryList = [];
  List<Items> itemList = [];
  List<ProductHierarchyModel> fullProductList = [];
  String address = '';
  double latitude = 0.0;
  double longitude = 0.0;
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
      "color": const Color(0xFF4D6CF3), // App primary blue
      "borderColor": const Color(0xFFB3BFFD), // App accent light blue
      // "borderColor": const Color(0xFFFFB74D), // Light amber
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

  // List<String> categoryList = [
  //   "Vegetables",
  //   "Rice & Grains",
  //   "Meat & Poultry",
  //   "Fish & Seafood",
  //   "Spices & Condiments",
  //   "Oil & Ghee",
  //   "Flour & Baking Essentials",
  //   "Snacks & Sweets Ingredients",
  //   "Fruits",
  //   "Dairy",
  //   "Packaged Foods",
  //   "Beverages",
  //   "Household Essentials"
  // ];

  @override
  void initState() {
    fullProductList = productHierarchyModelFromJson(DemoData.productList);
    categoryList =
        fullProductList.map((element) => element.category.toString()).toList();

    // subCategoryList =
    // Parse the JSON into ProductHierarchy model
    // for (var element in fullProductList) {
    //   element.category
    //   // Assuming you have a ProductHierarchy model with a fromJson factory
    //   // You can now use 'product' as needed, e.g., add to a list
    //   // productHierarchyList.add(product);
    // }

    super.initState();
  }

  showModalSheet(context) {
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 238, 229, 240),
        appBar: homeAppBar(context),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // const SizedBox(
            //   height: 10,
            // ),
            // SizedBox(
            //   height: 110,
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: categoryList.length,
            //     itemBuilder: (context, index) {
            //       return InkWell(
            //         onTap: () {
            //           // Find the selected category in fullProductList
            //           final selectedCategory = categoryList[index];
            //           int selectedProduct = fullProductList.indexWhere(
            //             (element) => element.category == selectedCategory,
            //           );
            //           subCategoryList = fullProductList[index]
            //               .subCategoryList
            //               .map((element) => element.subCategory)
            //               .toList();
            //           setState(() {
            //             print(selectedProduct);
            //           });
            //         },
            //         child: Padding(
            //           padding: const EdgeInsets.symmetric(horizontal: 8.0),
            //           child: Container(
            //             height: 80,
            //             width: 100,
            //             decoration: BoxDecoration(
            //               // color: Color.fromARGB(255, 77, 108, 243),
            //               boxShadow: [
            //                 BoxShadow(
            //                     color:
            //                         Colors.deepPurple.shade50.withOpacity(0.8),
            //                     blurRadius: 5,
            //                     spreadRadius: 2,
            //                     blurStyle: BlurStyle.inner),
            //                 BoxShadow(
            //                     color: Colors.black.withOpacity(0.1),
            //                     offset: const Offset(0, 2),
            //                     blurRadius: 5,
            //                     spreadRadius: 2,
            //                     blurStyle: BlurStyle.normal)
            //               ],
            //               border: Border.all(color: Colors.white),
            //               borderRadius:
            //                   const BorderRadius.all(Radius.circular(15)),
            //             ),
            //             child: Padding(
            //               padding: const EdgeInsets.all(8.0),
            //               child: Center(
            //                 child: Text(
            //                   categoryList[index],
            //                   textAlign: TextAlign.center,
            //                   style: const TextStyle(
            //                     color: Colors.black87,
            //                     fontWeight: FontWeight.w600,
            //                     fontSize: 13,
            //                   ),
            //                   maxLines: 2,
            //                   overflow: TextOverflow.ellipsis,
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),
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
                      items: categoryList,
                      excludeSelected: false,
                      onChanged: (value) {
                        productController!.text = value!;
                        final selectedCategory = value;
                        int selectedProduct = fullProductList.indexWhere(
                          (element) => element.category == selectedCategory,
                        );
                        final subCategory =
                            fullProductList[selectedProduct].subCategoryList;
                        itemList.clear();
                        for (var subCat in subCategory) {
                          itemList.addAll(subCat
                              .items); // or subCat.itemList if using models
                        }
                        setState(() {});
                      },
                      headerBuilder: (context, selectedItem, enabled) {
                        return Text(
                          selectedItem,
                          style: const TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w400),
                        );
                      },
                      hintBuilder: (context, selectedItem, enabled) {
                        return SizedBox(
                          height: 20,
                          child: Text(
                            selectedItem,
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: Colors.black87,
                                fontWeight: FontWeight.w400),
                          ),
                        );
                      },
                      // decoration: CustomDropdownDecoration(),
                      listItemBuilder:
                          (context, item, isSelected, onItemSelect) {
                        return SizedBox(
                          width: double.maxFinite,
                          child: Text(
                            item,
                            style: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w400),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomDropdown.search(
                      hintText: 'Select Sub Category',
                      items: subCategoryList,
                      excludeSelected: false,
                      onChanged: (value) {
                        subProductController!.text = value!;

                        final selectedSubCategory = value;

                        int selectedProduct = fullProductList.indexWhere(
                          (element) => element.category == selectedSubCategory,
                        );

                        final sucCatg =
                            fullProductList[selectedProduct].subCategoryList;
                        itemList.clear();
                        for (var e in sucCatg) {
                          itemList.addAll(e.items);
                        }
                        setState(() {});
                        // log('changing value to: $value');
                      },
                      headerBuilder: (context, selectedItem, enabled) {
                        return Text(
                          selectedItem,
                          style: const TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w400),
                        );
                      },
                      hintBuilder: (context, selectedItem, enabled) {
                        return SizedBox(
                          height: 20,
                          child: Text(
                            selectedItem,
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: Colors.black87,
                                fontWeight: FontWeight.w400),
                          ),
                        );
                      },
                      listItemBuilder:
                          (context, item, isSelected, onItemSelect) {
                        return SizedBox(
                          width: double.maxFinite,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              item,
                              style: const TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ItemCardWidget(
              productSubCat: "Meat",
              productController: productController,
              subProductController: subProductController,
              productList: meatList,
            )
          ],
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.home,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => ExploreScreen(
                                  navIndex: 1,
                                ))));
                  },
                  icon: const Icon(
                    Icons.explore,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) =>
                                const SubmittedReportScreen())));
                  },
                  icon: const Icon(
                    Icons.report,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSize homeAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(150),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "HOMEPAGE",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 77, 108, 243),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
          padding:
              const EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        fixedSize: const Size(170, 40),
                      ),
                      onPressed: () {
                        getCurrentPosition();
                        setState(() {});
                      },
                      child: Row(
                        children: [
                          const Text(
                            "Locate Me",
                            style: TextStyle(
                                // color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Image.asset(
                            "assets/icons/direction.png",
                            height: 30,
                            width: 30,
                            color: Colors.purple,
                          )
                        ],
                      )),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        fixedSize: const Size(170, 40),
                      ),
                      onPressed: () {
                        showModalSheet(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            "Select City",
                            style: TextStyle(
                                // color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Image.asset(
                            "assets/icons/location-pin.png",
                            height: 30,
                            width: 30,
                            color: Colors.purple,
                          )
                        ],
                      )),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              address == ""
                  ? const Text("")
                  : Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 248, 241, 147),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            "assets/icons/home-location.png",
                            height: 28,
                            width: 28,
                            color: Colors.purple,
                          ),
                          // SizedBox(
                          //   width: 5,
                          // ),
                          Text(
                            address,
                            style: const TextStyle(
                                color: Colors.purple,
                                overflow: TextOverflow.ellipsis,
                                fontSize: 13,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
    );
  }

  void getCurrentPosition() async {
    LocationPermission permission = await Geolocator.checkPermission();
    LocationPermission asked = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      print('Permission not given.');
      asked = await Geolocator.requestPermission();
    } else {
      Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      if (!mounted) return;
      setState(() {
        latitude = currentPosition.latitude;
        longitude = currentPosition.longitude;
      });
      getAddress(currentPosition.latitude, currentPosition.longitude);
    }
  }

  getAddress(lat, long) async {
    List<geo.Placemark> placemarks =
        await geo.placemarkFromCoordinates(lat, long);
    // print(placemarks);
    setState(() {
      address =
          "${placemarks[0].street!}, ${placemarks[2].name!}, ${placemarks[2].subLocality!},\n ${placemarks[2].locality!} - ${placemarks[2].postalCode!}";
    });
    for (int i = 0; i < placemarks.length; i++) {}

    return address;
  }
}

class ItemCardWidget extends StatelessWidget {
  final String productSubCat;
  final List productList;
  const ItemCardWidget({
    super.key,
    required this.productController,
    required this.subProductController,
    required this.productSubCat,
    required this.productList,
  });

  final TextEditingController? productController;
  final TextEditingController? subProductController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromARGB(255, 77, 108, 243), width: 2),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
                  child: Text(
                    productSubCat,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Color.fromARGB(255, 77, 108, 243)),
                  ),
                ),
              ),
              const Row(
                children: [
                  Text(
                    "View more",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Color.fromARGB(255, 77, 108, 243)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 20,
                    width: 20,
                    child: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 77, 108, 243),
                      child: Icon(
                        Icons.arrow_forward_ios_sharp,
                        size: 14,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 160,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: productList.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailsScreen(
                          image: productList[index]["imageName"],
                          productName: productList[index]["name"],
                          productCat: productController!.text,
                          productSubCat: subProductController!.text,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
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
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 5, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: <Widget>[
                              Image.asset(
                                productList[index]["imageName"],
                                width: 110,
                                height: 80,
                                fit: BoxFit.scaleDown,
                              ),
                            ],
                          ),
                          const SizedBox(height: 18),
                          Text(productList[index]["price"]),
                          const SizedBox(height: 5),
                          Text(
                            productList[index]["name"],
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
//  Expanded(
//               child: GridView.builder(
//                   shrinkWrap: true,
//                   itemCount: meatList.length,
//                   physics: const BouncingScrollPhysics(),
//                   // padding: EdgeInsets.only(left: 5),
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2, // number of items in each row
//                     mainAxisSpacing: 8.0, // spacing between rows
//                     crossAxisSpacing: 8.0, // spacing between columns
//                   ),
//                   itemBuilder: (context, index) {
//                     return Padding(
//                       padding: const EdgeInsets.only(left: 35.0),
//                       child: InkWell(
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => ProductDetailsScreen(
//                                         image: meatList[index]["imageName"],
//                                         productName: meatList[index]["name"],
//                                         productCat: productController!.text,
//                                         productSubCat:
//                                             subProductController!.text,
//                                       )));
//                         },
//                         child: Container(
//                           // height: 150,
//                           width: 150,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(15)),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               // const SizedBox(
//                               //   height: 18,
//                               // ),
//                               Stack(
//                                 children: <Widget>[
//                                   Image.asset(
//                                     meatList[index]["imageName"],
//                                     width: 110,
//                                     fit: BoxFit.scaleDown,
//                                   ),
//                                   // Positioned(
//                                 ],
//                               ), // Expanded(

//                               const SizedBox(
//                                 height: 18,
//                               ),
//                               Text(meatList[index]["price"]),
//                               const SizedBox(
//                                 height: 5,
//                               ),
//                               Text(
//                                 meatList[index]["name"],
//                                 overflow: TextOverflow.ellipsis,
//                                 // style: textTheme.bodyMedium
//                                 // const TextStyle(color: Colors.black, fontSize: 17),
//                               ),
//                               // const SizedBox(
//                               //   height: 20,
//                               // ),
//                               // Row(
//                               //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               //   children: [
//                               //     widget.quantity != ""
//                               //         ? Text(widget.quantity)
//                               //         : const Text("1kg"),
//                               //     IconButton(
//                               //         onPressed: () {},
//                               //         icon: const Icon(
//                               //           Icons.flash_on_sharp,
//                               //           size: 15,
//                               //           color: Colors.grey,
//                               //         ))
//                               //   ],
//                               // ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   }),
//             )
