import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 80),
        child: PageView(
          children: [
            Container(
              color: Colors.amber[200],
              child: Center(
                  child: Text(
                "Page1",
                style: TextStyle(fontSize: 22),
              )),
            ),
            Container(
              color: Colors.purple[200],
              child: Center(
                  child: Text(
                "Page2",
                style: TextStyle(fontSize: 22),
              )),
            ),
            Container(
              color: Colors.blue[200],
              child: Center(
                  child: Text(
                "Page3",
                style: TextStyle(fontSize: 22),
              )),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {},
              child: Text("Skip"),
            ),
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: WormEffect(spacing: 16, dotColor: Colors.black26, activeDotColor: Colors.teal),
              ),
            ),
            TextButton(
              onPressed: () {
                controller.nextPage(duration: Duration(milliseconds: 400), curve: Curves.easeOut);
              },
              child: Text("Next"),
            ),
          ],
        ),
      ),
    );
  }
}
