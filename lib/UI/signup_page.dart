// import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:market_price_control_app/UI/loginpage.dart';
import 'package:pinput/pinput.dart';
// import 'package:market_price_control_app/UI/loginpage.dart';
// import 'package:pinput/pinput.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String verificationID = "";

  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // final FirebaseAuth auth = FirebaseAuth.instance;
  var code = "";
  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/images/register.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35, top: 20),
              child: const Text(
                'Create\nAccount',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.28),
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
                              controller: nameController,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "Name",
                                  hintStyle: const TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your name';
                                }

                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: emailController,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "Email",
                                  hintStyle: const TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }

                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: dobController,
                                    readOnly: true,
                                    style: const TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                            color: Colors.white,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        hintText: "Date of Birth",
                                        hintStyle: const TextStyle(color: Colors.white, fontSize: 14),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        suffixIcon: const Icon(
                                          Icons.calendar_month,
                                          color: Colors.white,
                                        )),
                                    onTap: () async {
                                      DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime.now(),
                                      );
                                      if (pickedDate != null) {
                                        dobController.text = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                                      }
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your DOB';
                                      }

                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: phoneController,
                                    style: const TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                            color: Colors.white,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        hintText: "Phone",
                                        hintStyle: const TextStyle(color: Colors.white),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        )),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter phone no';
                                      }

                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: passwordController,
                              style: const TextStyle(color: Colors.white),
                              obscureText: true,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "Password",
                                  hintStyle: const TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                if (value.length < 6) {
                                  return 'Password must be at least 6 characters';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Sign Up',
                                  style: TextStyle(color: Colors.white, fontSize: 27, fontWeight: FontWeight.w700),
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: const Color(0xff4c505b),
                                  child: IconButton(
                                      color: Colors.white,
                                      onPressed: () async {
                                        if (_formKey.currentState!.validate()) {
                                          showEditBottomSheetValues(context);
                                        }

                                        // if (phoneController.text ==
                                        //         "01713380485" &&
                                        //     emailController.text ==
                                        //         "abc@gmail.com" &&
                                        //     passwordController.text == "123456") {
                                        //   showEditBottomSheetValues(context);
                                        // } else {
                                        //   // FlutterToast
                                        //   ScaffoldMessenger.of(context)
                                        //       .showSnackBar(
                                        //     const SnackBar(
                                        //       content: Text(
                                        //           'Invalid credentials. Please check your phone, email, or password.'),
                                        //       backgroundColor: Colors.red,
                                        //     ),
                                        //   );
                                        // }
                                        // await FirebaseAuth.instance
                                        //     .verifyPhoneNumber(
                                        //   phoneNumber: phoneController.text,
                                        //   verificationCompleted:
                                        //       (PhoneAuthCredential credential) {},
                                        //   verificationFailed:
                                        //       (FirebaseAuthException e) {},
                                        //   codeSent: (String verificationId,
                                        //       int? resendToken) {
                                        //     verificationID = verificationId;
                                        //     //  WalletScreen.verify;
                                        //     print(
                                        //         "verification Id ashbe$verificationID");

                                        //     // showModalBottomSheet(
                                        //     //     context: context,
                                        //     //     builder: (context) {});
                                        //   },
                                        //   codeAutoRetrievalTimeout:
                                        //       (String verificationId) {},
                                        // );

                                        // Navigator.push(
                                        //     context, MaterialPageRoute(builder: (context) => const LoginPage()));
                                      },
                                      icon: const Icon(
                                        Icons.arrow_forward,
                                      )),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Already have an\naccount?',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      // decoration: TextDecoration.underline,
                                      color: Colors.white,
                                      fontSize: 18),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                                  },
                                  style: const ButtonStyle(),
                                  child: const Text(
                                    'Log In',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        decoration: TextDecoration.underline, color: Colors.black38, fontSize: 18),
                                  ),
                                ),
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

  void showEditBottomSheetValues(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: focusedBorderColor),
      ),
    );
    showModalBottomSheet(
      // constraints: const BoxConstraints(maxHeight: double.infinity),
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15.0),
        ),
      ),
      isScrollControlled: true,
      isDismissible: false,
      // enableDrag: true,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
            expand: false,
            snap: true,
            builder: (_, controller) {
              return StatefulBuilder(builder: (context, setState2) {
                return SingleChildScrollView(
                  controller: controller,
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: 17, right: 17, bottom: MediaQuery.of(context).viewInsets.bottom, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 40,
                            ),
                            const Center(
                              child: Text(
                                "Verification Code",
                                style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("We've sent a 6 digit code to your phone number"),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text("phone Number"),
                            const SizedBox(
                              height: 30,
                            ),
                            Form(
                              key: formKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Directionality(
                                    // Specify direction if desired
                                    textDirection: TextDirection.ltr,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Pinput(
                                        controller: pinController,
                                        focusNode: focusNode,
                                        length: 6,

                                        defaultPinTheme: defaultPinTheme,

                                        onChanged: (value) {
                                          code = value;
                                        },
                                        // cursor: Column(
                                        //   mainAxisAlignment: MainAxisAlignment.end,
                                        //   children: [
                                        //     Container(
                                        //       margin: const EdgeInsets.only(bottom: 9),
                                        //       width: 22,
                                        //       height: 1,
                                        //       color: focusedBorderColor,
                                        //     ),
                                        //   ],
                                        // ),
                                        focusedPinTheme: defaultPinTheme.copyWith(
                                          decoration: defaultPinTheme.decoration!.copyWith(
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(color: focusedBorderColor),
                                          ),
                                        ),
                                        submittedPinTheme: defaultPinTheme.copyWith(
                                          decoration: defaultPinTheme.decoration!.copyWith(
                                            color: fillColor,
                                            borderRadius: BorderRadius.circular(19),
                                            border: Border.all(color: focusedBorderColor),
                                          ),
                                        ),
                                        errorPinTheme: defaultPinTheme.copyBorderWith(
                                          border: Border.all(color: Colors.redAccent),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(fixedSize: Size(screenWidth / 1.8, 40)),
                                    onPressed: () async {
                                      if (pinController.text == "123456") {
                                        await createUser();

                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(builder: (context) => const LoginPage()),
                                            (route) => false);
                                      } else {
                                        Fluttertoast.showToast(msg: 'OTP is Invalid.', backgroundColor: Colors.red);
                                        // ScaffoldMessenger.of(context).showSnackBar(
                                        //   const SnackBar(
                                        //     content: Text('OTP is Invalid.'),
                                        //     backgroundColor: Colors.red,
                                        //   ),
                                        // );
                                      }
                                      // formKey.currentState!.validate();

                                      // Navigator.pushNamedAndRemoveUntil(
                                      //     context,
                                      //     "/homepage",
                                      //     (route) => false);
                                    },
                                    child: const Text('Continue'),
                                  ),
                                ],
                              ),
                            )
                            // Pinput()
                          ],
                        ),
                      ),
                      Positioned(
                        top: 12,
                        right: 10,
                        child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(100)),
                              child: const Icon(
                                Icons.clear,
                                weight: 2,
                                size: 23,
                                color: Colors.white,
                              ),
                            )),
                      )
                    ],
                  ),
                );
              });
            });
      },
    );
  }

  Future createUser() async {
    final docUser = FirebaseFirestore.instance.collection('mpc_users').doc();
    final json = {
      'user_id': docUser.id,
      'user_name': nameController.text,
      'user_mail': emailController.text,
      'user_mobile': phoneController.text,
      'user_pass': passwordController.text,
      'date_of_birth': dobController.text,
      'area_id': "",
      'area_name': '',
      'device_id': '',
      'device_model': '',
      'address': '',
      'nid': '',
      'gender': '',
      'liked_forms': "",
      'created_at': DateTime.now()
    };
    await docUser.set(json);
  }
}
