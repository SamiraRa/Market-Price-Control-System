import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:market_price_control_app/UI/explore.dart';
import 'package:market_price_control_app/UI/homepage.dart';
import 'package:market_price_control_app/local_storage/boxes.dart';
import 'package:market_price_control_app/models/public_feed.dart';
import 'package:market_price_control_app/models/user_login.dart';

class SubmittedReportScreen extends StatefulWidget {
  const SubmittedReportScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SubmittedReportScreen> createState() => _SubmittedReportScreenState();
}

class _SubmittedReportScreenState extends State<SubmittedReportScreen> {
  // List<SubmittedReport> reportList = [];
  List<PublicFeed> reportList = [];
  UserLogin? userLogin;
  @override
  void initState() {
    super.initState();
    userLogin = Boxes.getLoginData().get('userLogin');
    getData();
  }

  Future<void> getData() async {
    final userId = userLogin!.userId;

    final querySnapshot =
        await FirebaseFirestore.instance.collection('mpc_submitted_forms').where('user_id', isEqualTo: userId).get();

    setState(() {
      reportList = querySnapshot.docs.map((doc) {
        final data = doc.data();
        return PublicFeed(
            userId: data['user_id'],
            userName: data['user_name'],
            itemName: data['item_name'],
            itemId: data['item_id'],
            itemImage: data['item_image_path'] ?? "",
            submittedPrice: data['item_suggested_price'],
            prevPrice: data['item_app_price'],
            upvotedCount: data['like_count'],
            downvotedCount: data['dislike_count'],
            itemWeight: data['item_net_weight'],
            itemQuantity: data['item_quantity'],
            expDate: data['exp_date'] ?? "",
            batchDate: data['batch_date'] ?? "",
            uploadedAt: data['created_at'] ?? "",
            areaName: data['area_name'] ?? "",
            areaId: data['area_id'] ?? "",
            marketName: data['market_name'] ?? "",
            marketId: data['market_id'] ?? "",
            districtName: data['address'] ?? "",
            approvalStatus: data['approval_status'] ?? "",
            userAction: data['user_action'] ?? "",
            formId: data['form_id'] ?? "",
            itemSuggestedWeight: data['item_suggested_net_weight'],
            itemSuggestedQuantity: data['item_suggested_qty']);

        //  SubmittedReport(
        //   itemId: data['item_id'] ?? '',
        //   itemName: data['item_name'] ?? '',
        //   prevPrice: data['item_app_price']?.toString() ?? '',
        //   itemWeight: data['item_net_weight']?.toString() ?? '',
        //   suggestedPrice: data['item_suggested_price']?.toString() ?? '',
        //   date: data['created_at'] ?? '',
        //   marketName: data['market_name'],
        //   itemImage: data['item_image_path'],
        //   itemDetails: data["item_desc"],
        //   expDate: data["exp_date"],
        //   batchDate: data["batch_date"],
        //   itemQty: data["item_quantity"],
        //   category: '',
        //   subCategory: '',
        // );
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushAndRemoveUntil(
            context, MaterialPageRoute(builder: (context) => const Homepage()), (route) => false);
        return false;
      },
      child: SafeArea(
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
              'My Submitted Forms',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
            automaticallyImplyLeading: false,
            leading: IconButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context, MaterialPageRoute(builder: (context) => const Homepage()), (route) => false);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: reportList.length,
                  padding: const EdgeInsets.all(10),
                  // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  //   crossAxisCount: 2,
                  //   crossAxisSpacing: 10,
                  //   mainAxisSpacing: 10,
                  //   childAspectRatio: 0.7,
                  // ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(reportList[index].uploadedAt.split(" ")[0]),
                            Text(
                              reportList[index].itemName,
                              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                            ),
                            Center(
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height / 9,
                                width: MediaQuery.of(context).size.width / 4,
                                child: reportList[index].itemImage == ""
                                    ? const Text("")
                                    : Image.asset(reportList[index].itemImage),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Approved: ",
                                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                    ),
                                    Text("Price: ${reportList[index].prevPrice}"),
                                    Text("Net Weight: ${reportList[index].itemWeight}"),
                                    Text("Qty: ${reportList[index].itemQuantity}"),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Submitted: ",
                                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                    ),
                                    Text("Price: ${reportList[index].submittedPrice}"),
                                    Text("Net Weight: ${reportList[index].itemSuggestedWeight}"),
                                    Text("Qty: ${reportList[index].itemSuggestedQuantity}"),
                                  ],
                                )
                              ],
                            ),
                            // Text("Approved Price: ${reportList[index].prevPrice}|${reportList[index].itemWeight}"),
                            // Text("Submitted Price: ${reportList[index].submittedPrice}"),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          bottomNavigationBar: Container(
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
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context, MaterialPageRoute(builder: (context) => const Homepage()), (route) => false);
                    },
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
                      // Navigator.push(context, MaterialPageRoute(builder: ((context) => SubmittedReportScreen())));
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
      ),
    );
  }
}
