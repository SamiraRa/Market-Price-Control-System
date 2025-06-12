import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:market_price_control_app/UI/homepage.dart';
import 'package:market_price_control_app/UI/signup_page.dart';
import 'package:market_price_control_app/local_storage/boxes.dart';
import 'package:market_price_control_app/models/user_login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Map<String, dynamic> userData = {};

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/images/login.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35, top: 130),
              child: const Text(
                'Welcome\nBack',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Form(
                      key: _formKey,
                      child: Container(
                        margin: const EdgeInsets.only(left: 35, right: 35),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: emailController,
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  hintText: "Email",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'field is empty';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              controller: nameController,
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  hintText: "Username",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'field is empty';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              controller: passwordController,
                              style: const TextStyle(),
                              obscureText: true,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  hintText: "Password",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'field is empty';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Log in',
                                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.w700),
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: const Color(0xff4c505b),
                                  child: IconButton(
                                      color: Colors.white,
                                      onPressed: () async {
                                        if (!_formKey.currentState!.validate()) return;
                                        if (await checkUserDetailsMatch(
                                            emailController.text, passwordController.text)) {
                                          // if (emailController.text ==
                                          //         "abc@gmail.com" &&
                                          //     passwordController.text == "123456") {

                                          Navigator.pushAndRemoveUntil(context,
                                              MaterialPageRoute(builder: (context) => Homepage()), (route) => false);
                                        } else {
                                          Fluttertoast.showToast(
                                            msg: "Login failed. Please try again.",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            backgroundColor: Colors.red,
                                            textColor: Colors.white,
                                          );
                                          // ScaffoldMessenger.of(context).showSnackBar(
                                          //   const SnackBar(
                                          //     content: Text('Invalid credentials. Please check your email, or password.'),
                                          //     backgroundColor: Colors.red,
                                          //   ),
                                          // );
                                        }
                                      },
                                      icon: const Icon(
                                        Icons.arrow_forward,
                                      )),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context, MaterialPageRoute(builder: (context) => const SignupPage()));
                                  },
                                  style: const ButtonStyle(),
                                  child: const Text(
                                    'Sign Up',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        decoration: TextDecoration.underline, color: Color(0xff4c505b), fontSize: 18),
                                  ),
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Forgot Password',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Color(0xff4c505b),
                                        fontSize: 18,
                                      ),
                                    )),
                              ],
                            )
                          ],
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
    );
  }

  Future<bool> checkUserDetailsMatch(String email, String password) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('mpc_users')
        .where('user_mail', isEqualTo: email)
        .where('user_pass', isEqualTo: password)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      final userData = querySnapshot.docs[0].data();

      final loginData = UserLogin(
          userId: userData['user_id'] ?? '',
          username: userData['user_name'] ?? '',
          areaId: userData['area_id'] ?? '',
          areaName: userData['area_name'] ?? '',
          password: userData['user_pass'] ?? '',
          deviceId: userData['device_id'] ?? '',
          deviceBrand: userData['device_brand'] ?? '',
          deviceModel: userData['device_model'] ?? '',
          gender: userData['gender'] ?? '',
          phoneNum: userData['phone_num'] ?? '',
          address: userData['address'] ?? '',
          nid: userData['nid'] ?? '',
          email: userData['user_mail'] ?? '',
          dateOfBirth: userData['date_of_birth'],
          age: '',
          likedForms: userData['liked_forms']);
      Boxes.getLoginData().put("userLogin", loginData);
      setState(() {});
    }
    return querySnapshot.docs.isNotEmpty;
  }
}
