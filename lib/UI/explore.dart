import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:market_price_control_app/UI/homepage.dart';
import 'package:market_price_control_app/UI/submitted_report_screen.dart';
import 'package:market_price_control_app/local_storage/boxes.dart';
import 'package:market_price_control_app/models/public_feed.dart';
import 'package:market_price_control_app/models/user_login.dart';

class ExploreScreen extends StatefulWidget {
  int navIndex;
  ExploreScreen({
    Key? key,
    required this.navIndex,
  }) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  List<PublicFeed> publicFeedData = [];
  UserLogin? userLogin;
  String userAction = ""; // "liked", "disliked", or ""
  String upvotedCount = "0";
  String downvotedCount = "0";

  @override
  void initState() {
    super.initState();
    userLogin = Boxes.getLoginData().get('userLogin');
    getData();
    // publicFeedData = publicFeedFromJson(DemoData.othersFeeds);
  }

  Map<String, String> parseUserActions(String actionString) {
    Map<String, String> actions = {};

    // Split by "||" to get each entry
    List<String> entries = actionString.split("||");
    for (String entry in entries) {
      if (entry.trim().isEmpty) continue;
      List<String> parts = entry.split("|");
      //   print(parts);
      if (parts.length == 2) {
        String formId = parts[0];
        String action = parts[1];
        actions[formId] = action;
      }
    }

    return actions;
  }

  Future<void> getData() async {
    Map<String, String> actionMap = {};
    final userId = userLogin!.userId;

    //   final querySnapshotUsers =
    //       await FirebaseFirestore.instance.collection('mpc_users').where('user_id', isEqualTo: userLogin!.userId).get();
    // if (querySnapshotUsers.docs.isNotEmpty) {
    //     final userData = querySnapshotUsers.docs[0].data();

    //     }
    if (userLogin!.likedForms != "") {
      actionMap = parseUserActions(userLogin!.likedForms);
    }

    final querySnapshot = await FirebaseFirestore.instance.collection('mpc_submitted_forms').get();

    setState(() {
      publicFeedData = querySnapshot.docs.map(
        (doc) {
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
              userAction: actionMap[data['form_id']] ?? "",
              formId: data['form_id'] ?? "",
              itemSuggestedWeight: data['item_suggested_net_weight'],
              itemSuggestedQuantity: data['item_suggested_qty']);
        },
      ).toList();
    });
  }

  void _upvote(int index) {
    setState(() {
      String action = publicFeedData[index].userAction;
      int upvote = publicFeedData[index].upvotedCount == "" ? 0 : int.parse(publicFeedData[index].upvotedCount);
      int downvote = publicFeedData[index].downvotedCount == "" ? 0 : int.parse(publicFeedData[index].downvotedCount);

      if (action == "liked") return; // Already liked

      if (action == "disliked") {
        // Remove previous dislike
        downvote = (downvote > 0) ? downvote - 1 : 0;
      }

      // Apply like
      upvote += 1;
      publicFeedData[index].upvotedCount = upvote.toString();
      publicFeedData[index].downvotedCount = downvote.toString();
      publicFeedData[index].userAction = "liked";
      updateAction(
          index: index,
          downvotedCount: publicFeedData[index].downvotedCount,
          upVotedCount: publicFeedData[index].upvotedCount,
          userAction: publicFeedData[index].userAction);
    });
  }

  void _downvote(int index) {
    setState(() {
      String action = publicFeedData[index].userAction;
      int upvote = publicFeedData[index].upvotedCount == "" ? 0 : int.parse(publicFeedData[index].upvotedCount);
      int downvote = publicFeedData[index].downvotedCount == "" ? 0 : int.parse(publicFeedData[index].downvotedCount);

      if (action == "disliked") return; // Already disliked

      if (action == "liked") {
        // Remove previous like
        upvote = (upvote > 0) ? upvote - 1 : 0;
      }

      // Apply dislike
      downvote += 1;
      publicFeedData[index].upvotedCount = upvote.toString();
      publicFeedData[index].downvotedCount = downvote.toString();
      publicFeedData[index].userAction = "disliked";
      updateAction(
          index: index,
          downvotedCount: publicFeedData[index].downvotedCount,
          upVotedCount: publicFeedData[index].upvotedCount,
          userAction: publicFeedData[index].userAction);
    });
  }

  Future<void> updateAction({
    required int index,
    required String downvotedCount,
    required String upVotedCount,
    required String userAction,
  }) async {
    final docForm = FirebaseFirestore.instance.collection('mpc_submitted_forms').doc(publicFeedData[index].formId);
    await docForm.update({
      'like_count': upVotedCount,
      'dislike_count': downvotedCount,
    });

    saveUserActions();
  }

  Future<void> saveUserActions() async {
    List<String> formActionEntries = [];

    for (var form in publicFeedData) {
      String? action = form.userAction;

      if (action.isNotEmpty) {
        formActionEntries.add('${form.formId}|$action');
      }
    }

    // Join into the single string format
    String likedFormsString = formActionEntries.join('||');
    userLogin!.likedForms = likedFormsString;

    // Save to Firestore
    final docUser = FirebaseFirestore.instance.collection('mpc_users').doc(userLogin!.userId);
    await docUser.update({
      'liked_forms': likedFormsString,
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
              'Explore Prices',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
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
                  itemCount: publicFeedData.length,
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
                        child: Stack(
                          children: [
                            Positioned(
                                right: 0,
                                top: 0,
                                child: InkWell(
                                  onTap: () {},
                                  child: Image.asset(
                                    "assets/icons/quality-assurance.png",
                                    height: 35,
                                    width: 35,
                                    color: publicFeedData[index].approvalStatus == "approved"
                                        ? Colors.green
                                        : Colors.black54,
                                  ),
                                )),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const CircleAvatar(),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "" + publicFeedData[index].userName,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            height: 1.0,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          DateFormat.yMMMMd().format(DateTime.parse(publicFeedData[index].uploadedAt)),
                                          style: const TextStyle(
                                            fontSize: 10,
                                            height: 1.0,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          publicFeedData[index].districtName,
                                          style: const TextStyle(
                                            fontSize: 10,
                                            height: 1.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  publicFeedData[index].itemName,
                                  style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                                ),
                                Center(
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height / 9,
                                    width: MediaQuery.of(context).size.width / 4,
                                    child: publicFeedData[index].itemImage == ""
                                        ? const Text("")
                                        : Image.asset(publicFeedData[index].itemImage),
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
                                        Text("Price: ${publicFeedData[index].prevPrice}"),
                                        Text("Net Weight: ${publicFeedData[index].itemWeight}"),
                                        Text("Qty: ${publicFeedData[index].itemQuantity}"),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Submitted: ",
                                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                        ),
                                        Text("Price: ${publicFeedData[index].submittedPrice}"),
                                        Text("Net Weight: ${publicFeedData[index].itemSuggestedWeight}"),
                                        Text("Qty: ${publicFeedData[index].itemSuggestedQuantity}"),
                                      ],
                                    )
                                  ],
                                ),
                                const Divider(),
                                // SizedBox(
                                //   height: 10,
                                // ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        if (publicFeedData[index].userAction == "Done") return;
                                        _upvote(index);
                                      },
                                      child: Icon(Icons.thumb_up_off_alt_outlined,
                                          size: 20,
                                          color:
                                              publicFeedData[index].userAction == "liked" ? Colors.blue : Colors.black),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      publicFeedData[index].upvotedCount,
                                    ),
                                    const SizedBox(width: 8),
                                    InkWell(
                                      onTap: () {
                                        if (publicFeedData[index].userAction == "Done") return;
                                        _downvote(index);
                                      },
                                      child: Icon(Icons.thumb_down_alt_outlined,
                                          size: 20,
                                          color: publicFeedData[index].userAction == "disliked"
                                              ? Colors.blue
                                              : Colors.black),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      publicFeedData[index].downvotedCount,
                                    ),
                                  ],
                                )
                                // Text("Approved Price: ${reportList[index].prevPrice}|${reportList[index].itemWeight}"),
                                // Text("Submitted Price: ${reportList[index].submittedPrice}"),
                              ],
                            ),
                            // Positioned(
                            //   bottom: 0,
                            //   left: 0,
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.start,
                            //     children: [
                            //       IconButton(
                            //         onPressed: () {
                            //           if (publicFeedData[index].userAction == "Done") return;

                            //           _upvote(index);
                            //         },
                            //         icon: Icon(
                            //           Icons.thumb_up_off_alt_outlined,
                            //           size: 20,
                            //         ),
                            //       ),
                            //       Text(
                            //         publicFeedData[index].upvotedCount,
                            //       ),
                            //       IconButton(
                            //         onPressed: () {
                            //           if (publicFeedData[index].userAction == "Done") return;

                            //           _downvote(index);
                            //         },
                            //         icon: Icon(
                            //           Icons.thumb_down_alt_outlined,
                            //           size: 20,
                            //         ),
                            //       ),
                            //       Text(publicFeedData[index].downvotedCount),
                            //     ],
                            //   ),
                            // ),
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
                          context, (MaterialPageRoute(builder: (context) => const Homepage())), (route) => false);
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
                      Navigator.push(context, MaterialPageRoute(builder: ((context) => const SubmittedReportScreen())));
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
