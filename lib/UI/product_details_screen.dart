// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:market_price_control_app/UI/submitted_report_screen.dart';
import 'package:market_price_control_app/local_storage/boxes.dart';
import 'package:market_price_control_app/models/submitted_report_model.dart';
import 'package:market_price_control_app/models/user_login.dart';

import '../models/product_hierarchy_model.dart';

class ProductDetailsScreen extends StatefulWidget {
  Items product;
  String image;
  // String productName;
  String productCat;
  String productSubCat;
  ProductDetailsScreen({
    Key? key,
    required this.product,
    required this.image,
    // required this.productName,
    required this.productCat,
    required this.productSubCat,
  }) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController areaController = TextEditingController();
  TextEditingController expDateController = TextEditingController();
  TextEditingController batchDateController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController marketController = TextEditingController();
  TextEditingController suggestedPriceController = TextEditingController();
  TextEditingController itemWeightController = TextEditingController();
  TextEditingController itemQtyController = TextEditingController();
  List<SubmittedReport> reportList = [];
  int quantity = 0;
  UserLogin? userLogin;

  @override
  void initState() {
    userLogin = Boxes.getLoginData().get('userLogin');
    // userName = userLogin!.username;
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    InputDecorationTheme inputDecoration = Theme.of(context).inputDecorationTheme;

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
            'Product Survey',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
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
                              child: const Icon(
                                Icons.close,
                                size: 20,
                                color: Colors.white,
                              )),
                        ))
                  ],
                ),
                Text(
                  widget.product.itemName,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 6,
                    width: MediaQuery.of(context).size.width / 2,
                    child: widget.product.itemImagePath == ""
                        ? const Text("")
                        : Hero(
                            tag: "aaaa",
                            transitionOnUserGestures: true,
                            child: Image.asset(widget.product.itemImagePath)),
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
                        "${widget.product.itemPrice}| ${widget.product.itemWeight}",
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
                const Text(
                  "Product Details: ",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  widget.product.itemDetails,
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
                const SizedBox(
                  height: 10,
                ),

                Form(
                  key: _formKey,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(color: const Color.fromARGB(255, 194, 214, 255).withOpacity(0.4)),
                    child: Column(
                      children: [
                        const Text(
                          "Survey Form",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 50,
                                child: TextFormField(
                                  controller: areaController,
                                  decoration: const InputDecoration(
                                    labelText: 'Enter Area',
                                    labelStyle: TextStyle(fontSize: 14),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "value is required";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: SizedBox(
                                height: 50,
                                child: TextFormField(
                                  controller: marketController,
                                  decoration: const InputDecoration(
                                    labelText: 'Enter Market Name',
                                    labelStyle: TextStyle(fontSize: 14),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "value is required";
                                    }
                                    return null;
                                  },
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
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))],
                                  controller: suggestedPriceController,
                                  decoration: const InputDecoration(
                                    labelText: 'Suggest Your Price',
                                    labelStyle: TextStyle(fontSize: 14),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "value is required";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                height: 50,
                                child: TextFormField(
                                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))],
                                  keyboardType: TextInputType.number,
                                  controller: itemWeightController,
                                  decoration: const InputDecoration(
                                    labelText: 'Net Weight',
                                    labelStyle: TextStyle(fontSize: 14),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                                  ),
                                  // validator: (value) {
                                  //   if (value == null || value.isEmpty) {
                                  //     return "value is required";
                                  //   }
                                  //   return null;
                                  // },
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                height: 50,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))],
                                  controller: itemQtyController,
                                  decoration: const InputDecoration(
                                    labelText: 'Quantity',
                                    labelStyle: TextStyle(fontSize: 14),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                                  ),
                                  // validator: (value) {
                                  //   if (value == null || value.isEmpty) {
                                  //     return "value is required";
                                  //   }
                                  //   return null;
                                  // },
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
                              child: SizedBox(
                                height: 50,
                                child: TextFormField(
                                  controller: batchDateController,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: const BorderSide(
                                          color: Colors.black,
                                        ),
                                      ),
                                      hintText: "Batch Date",
                                      hintStyle: const TextStyle(fontSize: 14),
                                      suffixIcon: const Icon(
                                        Icons.calendar_month,
                                      )),
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime.now(),
                                    );
                                    if (pickedDate != null) {
                                      batchDateController.text =
                                          "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                                    }
                                  },
                                  // validator: (value) {
                                  //   if (value == null || value.isEmpty) {
                                  //     return 'Please enter phone no';
                                  //   }

                                  //   return null;
                                  // },
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 50,
                                child: TextFormField(
                                  controller: expDateController,
                                  readOnly: true,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: const BorderSide(
                                          color: Colors.black,
                                        ),
                                      ),
                                      hintText: "Expiry Date",
                                      hintStyle: const TextStyle(fontSize: 14),
                                      suffixIcon: const Icon(
                                        Icons.calendar_month,
                                      )),
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(2100),
                                    );
                                    if (pickedDate != null) {
                                      expDateController.text =
                                          "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                                    }
                                  },
                                  // validator: (value) {
                                  //   if (value == null || value.isEmpty) {
                                  //     return 'Please enter your DOB';
                                  //   }

                                  //   return null;
                                  // },
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 50,
                                child: TextFormField(
                                  controller: addressController,
                                  decoration: const InputDecoration(
                                    labelText: 'Address/City,District',
                                    labelStyle: TextStyle(fontSize: 14),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "value is required";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 77, 108, 243),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              fixedSize: const Size(170, 40),
                            ),
                            onPressed: () {
                              if (!_formKey.currentState!.validate()) return;
                              // if (itemQtyController.text.isEmpty || itemWeightController.text.isEmpty) {
                              //   Fluttertoast.showToast(
                              //       msg: "Please provide quantity or net weight of the product",
                              //       backgroundColor: Colors.red,
                              //       toastLength: Toast.LENGTH_LONG);
                              // } else {
                              createForm();
                              // final report = SubmittedReport(
                              //   date: DateTime.now().toString(),
                              //   marketName: marketController.text,
                              //   suggestedPrice: suggestedPriceController.text,
                              //   prevPrice: widget.product.itemPrice,
                              //   itemName: widget.product.itemName,
                              //   itemImage: widget.product.itemImagePath,
                              //   itemDetails: widget.product.itemDetails,
                              //   expDate: widget.product.expDate,
                              //   batchDate: widget.product.batchDate,
                              //   itemId: widget.product.itemId,
                              //   itemWeight: widget.product.itemWeight,
                              //   itemQty: widget.product.itemQuantity,
                              //   category: widget.productCat,
                              //   subCategory: widget.productSubCat,
                              // );
                              // Boxes.getReportData().put('reportList', report);
                              // reportList.add(report);
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (contex) => const SubmittedReportScreen()));
                              // }
                            },
                            child: const Text(
                              "Submit",
                              style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future createForm() async {
    final docUser = FirebaseFirestore.instance.collection('mpc_submitted_forms').doc();
    final json = {
      "form_id": docUser.id,
      'user_id': userLogin!.userId,
      'user_name': userLogin!.username,
      'item_name': widget.product.itemName,
      'item_id': widget.product.itemName,
      'item_desc': widget.product.itemDetails,
      'item_app_price': widget.product.itemPrice,
      'item_net_weight': widget.product.itemWeight,
      'item_quantity': widget.product.itemQuantity,
      "item_image_path": widget.product.itemImagePath,
      'item_suggested_price': suggestedPriceController.text + "BDT",
      'item_suggested_net_weight':
          itemWeightController.text == "" ? widget.product.itemWeight : itemWeightController.text,
      'item_suggested_qty': itemQtyController.text == "" ? widget.product.itemQuantity : itemQtyController.text,
      "like_count": "0",
      "dislike_count": "0",
      "approval_status": "",
      "user_action": "",
      'area_id': areaController.text,
      'area_name': areaController.text,
      'market_id': marketController.text,
      'market_name': marketController.text,
      'device_id': '',
      'device_model': '',
      'address': addressController.text,
      'created_at': DateTime.now().toString().split(" ")[0],
      "exp_date": expDateController.text,
      "batch_date": batchDateController.text
    };
    await docUser.set(json);
  }
}
