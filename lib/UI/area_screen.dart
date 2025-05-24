import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:geolocator/geolocator.dart';

class AreaScreen extends StatefulWidget {
  const AreaScreen({super.key});

  @override
  State<AreaScreen> createState() => _AreaScreenState();
}

class _AreaScreenState extends State<AreaScreen> {
  String address = '';
  double latitude = 0.0;
  double longitude = 0.0;
  List<String> areaList = [];
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 40, 28, 28),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Area Screen',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Area Screen',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to another screen or perform an action
              },
              child: const Text('Go to Another Screen'),
            ),
          ],
        ),
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
          "${placemarks[0].street!}, ${placemarks[2].name!}, ${placemarks[2].subLocality!}, ${placemarks[2].locality!} - ${placemarks[2].postalCode!}";
    });
    for (int i = 0; i < placemarks.length; i++) {}

    return address;
  }
}
