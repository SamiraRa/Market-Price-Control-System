import 'package:flutter/material.dart';
import 'package:market_price_control_app/UI/homepage.dart';
import 'package:market_price_control_app/UI/submitted_report_screen.dart';
import 'package:market_price_control_app/models/public_feed.dart';
import 'package:market_price_control_app/utils/dummy_data.dart';

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
  // Sample data model for a posted price
  // final List<Map<String, dynamic>> _posts = [
  //   {
  //     'user': 'Alice',
  //     'product': 'Tomato',
  //     'price': 120,
  //     'votes': 5,
  //   },
  //   {
  //     'user': 'Bob',
  //     'product': 'Potato',
  //     'price': 80,
  //     'votes': 2,
  //   },
  //   {
  //     'user': 'Charlie',
  //     'product': 'Onion',
  //     'price': 100,
  //     'votes': -1,
  //   },
  // ];

  @override
  void initState() {
    super.initState();
    publicFeedData = publicFeedFromJson(DemoData.othersFeeds);
  }

  void _upvote(int index) {
    int countNumber = int.parse(publicFeedData[index].upvotedCount);
    setState(() {
      countNumber += 1;
    });
  }

  void _downvote(int index) {
    int countNumber = int.parse(publicFeedData[index].downvotedCount);
    setState(() {
      countNumber += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Homepage()), (route) => false);

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
                      context, MaterialPageRoute(builder: (context) => Homepage()), (route) => false);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
          ),
          body: GridView.builder(
            padding: const EdgeInsets.all(6),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 columns
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 2.2 / 3,
            ),
            itemCount: publicFeedData.length,
            itemBuilder: (context, index) {
              final post = publicFeedData[index];
              return Card(
                child: Container(
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
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                                height: 40,
                                // width: 80,
                                child: CircleAvatar(
                                  backgroundColor: Colors.blueGrey,
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  post.userName,
                                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  post.userId,
                                  style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        // Center(
                        //   child: Container(
                        //     height: 80,
                        //     width: 80,
                        //     color: Colors.white,
                        //   ),
                        // ),
                        const SizedBox(height: 8),
                        Text(
                          post.itemName,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        const SizedBox(height: 8),
                        Text("${post.prevPrice}|${post.itemWeight}", style: const TextStyle(fontSize: 14)),
                        const SizedBox(height: 8),
                        Text('Submitted Price: ${post.submittedPrice}', style: const TextStyle(fontSize: 12)),
                        const SizedBox(height: 8),
                        Text('Location:${post.areaName},\n${post.areaName}', style: const TextStyle(fontSize: 12)),
                        // const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.thumb_up, color: Colors.green),
                              onPressed: () => _upvote(index),
                              iconSize: 20,
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                            ),
                            Text(post.downvotedCount),
                            IconButton(
                              icon: const Icon(Icons.thumb_down, color: Colors.red),
                              onPressed: () => _downvote(index),
                              iconSize: 20,
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
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
