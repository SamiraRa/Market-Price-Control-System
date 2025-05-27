// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:market_price_control_app/UI/explore.dart';
import 'package:market_price_control_app/UI/homepage.dart';
import 'package:market_price_control_app/local_storage/boxes.dart';
import 'package:market_price_control_app/models/submitted_report_model.dart';
import 'package:market_price_control_app/utils/services.dart';

class SubmittedReportScreen extends StatefulWidget {
  const SubmittedReportScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SubmittedReportScreen> createState() => _SubmittedReportScreenState();
}

class _SubmittedReportScreenState extends State<SubmittedReportScreen> {
  List<SubmittedReport> reportList = [];
  // Example submitted form data
  final Map<String, dynamic> submittedForm = {
    'Name': 'John Doe',
    'Product': 'Rice',
    'Quantity': '50 kg',
    'Price': '\$100',
    'Date': '2024-06-10',
    'Remarks': 'All details correct.'
  };
  @override
  void initState() {
    super.initState();
    reportList = UserService().getReportData();
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
              'My Submitted Forms',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
            automaticallyImplyLeading: false,
            // leading: IconButton(
            //     onPressed: () {
            //       Navigator.of(context).pop();
            //     },
            //     icon: const Icon(
            //       Icons.arrow_back,
            //       color: Colors.white,
            //     )),
          ),
          body: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  itemCount: reportList.length,
                  padding: const EdgeInsets.all(10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1.2,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
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
                          Text(reportList[index].date.split(" ")[0]),
                          Text(
                            reportList[index].itemName,
                            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                          ),
                          Text("${reportList[index].prevPrice}|${reportList[index].itemWeight}"),
                          Text("Submitted Price: " + reportList[index].suggestedPrice),
                        ],
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
                          context, MaterialPageRoute(builder: (context) => Homepage()), (route) => false);
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
