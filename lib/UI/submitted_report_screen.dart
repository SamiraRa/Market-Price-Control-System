import 'package:flutter/material.dart';

class SubmittedReportScreen extends StatefulWidget {
  const SubmittedReportScreen({Key? key}) : super(key: key);

  @override
  State<SubmittedReportScreen> createState() => _SubmittedReportScreenState();
}

class _SubmittedReportScreenState extends State<SubmittedReportScreen> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Submitted Report'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              const Text(
                'Your Submitted Form',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ...submittedForm.entries.map((entry) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${entry.key}: ',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Expanded(
                          child: Text(
                            '${entry.value}',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
