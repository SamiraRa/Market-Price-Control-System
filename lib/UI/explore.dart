import 'package:flutter/material.dart';
import 'package:market_price_control_app/UI/homepage.dart';

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
  @override
  // Sample data model for a posted price
  final List<Map<String, dynamic>> _posts = [
    {
      'user': 'Alice',
      'product': 'Tomato',
      'price': 120,
      'votes': 5,
    },
    {
      'user': 'Bob',
      'product': 'Potato',
      'price': 80,
      'votes': 2,
    },
    {
      'user': 'Charlie',
      'product': 'Onion',
      'price': 100,
      'votes': -1,
    },
  ];

  void _upvote(int index) {
    setState(() {
      _posts[index]['votes'] += 1;
    });
  }

  void _downvote(int index) {
    setState(() {
      _posts[index]['votes'] -= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
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
            'Explore Prices',
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
        body: GridView.builder(
          padding: const EdgeInsets.all(12),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 columns
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.2,
          ),
          itemCount: _posts.length,
          itemBuilder: (context, index) {
            final post = _posts[index];
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${post['product']}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(height: 8),
                    Text('₹${post['price']}',
                        style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 8),
                    Text('Posted by ${post['user']}',
                        style: const TextStyle(fontSize: 12)),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.thumb_up, color: Colors.green),
                          onPressed: () => _upvote(index),
                          iconSize: 20,
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                        Text('${post['votes']}'),
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
            );
          },
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        (MaterialPageRoute(builder: (context) => Homepage())),
                        (route) => false);
                  },
                  icon: Icon(
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
                  icon: Icon(
                    Icons.explore,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
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
}
