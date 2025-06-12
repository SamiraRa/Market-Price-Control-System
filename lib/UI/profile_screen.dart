import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:market_price_control_app/UI/homepage.dart';
import 'package:market_price_control_app/UI/loginpage.dart';
import 'package:market_price_control_app/local_storage/boxes.dart';
import 'package:market_price_control_app/models/user_login.dart';
import 'package:permission_handler/permission_handler.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  XFile? _profileImage;
  UserLogin? userLogin;
  bool edit = false;
  List<String> gender = ["Female", "Male", "Others"];
  String? genderVal = "Select Gender";
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController nidController = TextEditingController();

  @override
  void initState() {
    super.initState();

    userLogin = Boxes.getLoginData().get('userLogin');
    nameController.text = userLogin!.username;
    emailController.text = userLogin!.email;
    phoneController.text = userLogin!.phoneNum;
    dobController.text = userLogin!.dateOfBirth;
    nidController.text = userLogin!.nid;
    addressController.text = userLogin!.address;
    genderVal = userLogin!.gender;
    setState(() {});
    // userName = userLogin!.username;
  }

  Future<void> _pickImage() async {
    final status = await Permission.storage.request();
    if (status.isDenied) {
      openAppSettings();
      return;
    }
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _profileImage = image;
      });
    }
  }

  void _changePassword() {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController oldPass = TextEditingController();
        TextEditingController newPass = TextEditingController();
        TextEditingController conNewPass = TextEditingController();
        return StatefulBuilder(builder: (context, setState1) {
          return AlertDialog(
            title: const Text('Change Password'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: oldPass,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: "Old Password"),
                ),
                TextField(
                  controller: newPass,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: "New Password"),
                ),
                TextField(
                  controller: conNewPass,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: "Confirm New Password"),
                ),
              ],
            ),
            actions: [
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 77, 108, 243),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    fixedSize: const Size(160, 50),
                  ),
                  onPressed: () async {
                    if (newPass.text.trim() != conNewPass.text.trim()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Confirm password do not match with New password")),
                      );
                      return;
                    }

                    try {
                      final snapshot = await FirebaseFirestore.instance
                          .collection('mpc_users')
                          .where('user_mail', isEqualTo: userLogin!.email)
                          .where('user_name', isEqualTo: userLogin!.username)
                          .get();

                      if (snapshot.docs.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("User not found")),
                        );
                        return;
                      }

                      final userDoc = snapshot.docs.first;
                      final storedPassword = userDoc.get('user_pass');

                      if (storedPassword != oldPass.text.trim()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Old password is incorrect")),
                        );
                        return;
                      }

                      await userDoc.reference.update({
                        'user_pass': newPass.text.trim(),
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Password updated successfully")),
                      );
                      Navigator.pushAndRemoveUntil(
                          context, MaterialPageRoute(builder: (context) => const LoginPage()), (route) => false);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Error: ${e.toString()}")),
                      );
                    }

                    setState1(() {});
                  },
                  child: const Center(
                    child: Text(
                      'Change',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Profile',
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: _profileImage != null
                    ? Image.file(
                        File(_profileImage!.path),
                        fit: BoxFit.cover,
                      ).image
                    : null,
                child: const Align(
                  alignment: Alignment.bottomRight,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 18,
                    child: Icon(Icons.edit, size: 20, color: Colors.blue),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Card(
              color: const Color.fromARGB(255, 215, 240, 255),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    edit
                        ? const Text("")
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(255, 77, 108, 243),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  onPressed: () => setState(() => edit = !edit),
                                  child: const Row(
                                    children: [
                                      Icon(
                                        Icons.edit,
                                        size: 22,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Edit",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.green.withOpacity(0.3),
                              blurRadius: 10,
                              spreadRadius: 3,
                              // offset: Offset(4, 4),
                              blurStyle: BlurStyle.inner),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      height: 45,
                      child: TextFormField(
                        controller: nameController,
                        // initialValue: userLogin!.username,
                        readOnly: !edit,
                        decoration: inputDecoration("Name"),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.green.withOpacity(0.3),
                              blurRadius: 10,
                              spreadRadius: 3,
                              // offset: Offset(4, 4),
                              blurStyle: BlurStyle.inner),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      height: 45,
                      child: TextFormField(
                        controller: emailController,
                        // initialValue: userLogin!.email,
                        readOnly: !edit,
                        decoration: inputDecoration("Email"),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.green.withOpacity(0.3),
                                    blurRadius: 10,
                                    spreadRadius: 3,
                                    // offset: Offset(4, 4),
                                    blurStyle: BlurStyle.inner),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            height: 45,
                            child: DropdownButtonFormField<String>(
                              isDense: !edit,
                              value: userLogin!.gender.isNotEmpty ? userLogin!.gender : null,
                              items: gender
                                  .map((g) => DropdownMenuItem(
                                        value: g,
                                        child: Text(
                                          g,
                                        ),
                                      ))
                                  .toList(),
                              decoration: inputDecoration("Gender"),
                              onChanged: !edit
                                  ? null
                                  : (value) {
                                      genderVal = value;
                                    },
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.green.withOpacity(0.3),
                                    blurRadius: 10,
                                    spreadRadius: 3,
                                    // offset: Offset(4, 4),
                                    blurStyle: BlurStyle.inner),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            height: 45,
                            child: TextFormField(
                              controller: phoneController,
                              // initialValue: userLogin!.phoneNum,
                              readOnly: !edit,
                              decoration: inputDecoration("Phone Number"),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.green.withOpacity(0.3),
                                    blurRadius: 10,
                                    spreadRadius: 3,
                                    // offset: Offset(4, 4),
                                    blurStyle: BlurStyle.inner),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            height: 45,
                            child: TextFormField(
                                controller: dobController,
                                // initialValue: userLogin!.dateOfBirth,
                                readOnly: !edit,
                                onTap: () async {
                                  if (!edit) return;
                                  DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime.now(),
                                  );
                                  if (pickedDate != null) {
                                    dobController.text = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                                  }
                                  setState(() {});
                                },
                                decoration: inputDecoration(("Date of Birth"))),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.green.withOpacity(0.3),
                                    blurRadius: 10,
                                    spreadRadius: 3,
                                    // offset: Offset(4, 4),
                                    blurStyle: BlurStyle.inner),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            height: 45,
                            child: TextFormField(
                              controller: nidController,
                              keyboardType: TextInputType.number,
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              // initialValue: userLogin!.nid,
                              readOnly: !edit,
                              decoration: inputDecoration("NID (optional)"),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.green.withOpacity(0.3),
                              blurRadius: 10,
                              spreadRadius: 3,
                              // offset: Offset(4, 4),
                              blurStyle: BlurStyle.inner),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      height: 45,
                      child: TextFormField(
                        controller: addressController,
                        // initialValue: userLogin!.address,
                        readOnly: !edit,
                        decoration: inputDecoration("Address"),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    edit
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(255, 77, 108, 243),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  fixedSize: const Size(160, 50),
                                ),
                                onPressed: () {
                                  updateUser(
                                      username: nameController.text,
                                      email: emailController.text,
                                      dateOfBirth: dobController.text,
                                      phoneNum: phoneController.text,
                                      gender: genderVal ?? userLogin!.gender,
                                      address: addressController.text,
                                      nid: nidController.text);

                                  setState(() {
                                    edit = false;
                                  });
                                },
                                child: const Text(
                                  "Update",
                                  style: TextStyle(fontSize: 18, color: Colors.white),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(255, 77, 108, 243),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  fixedSize: const Size(160, 50),
                                ),
                                onPressed: () => setState(() => edit = false),
                                child: const Text(
                                  "Close",
                                  style: TextStyle(fontSize: 18, color: Colors.white),
                                ),
                              ),
                            ],
                          )
                        : const Text(""),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 77, 108, 243),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      fixedSize: const Size(160, 50),
                    ),
                    onPressed: () {
                      _changePassword();
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Change\nPassword",
                          style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ],
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 77, 108, 243),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      fixedSize: const Size(160, 50),
                    ),
                    onPressed: () {
                      Boxes.getLoginData().clear();
                      Navigator.pushAndRemoveUntil(
                          context, MaterialPageRoute(builder: (context) => const LoginPage()), (route) => false);
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.logout,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Logout",
                          style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ],
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration inputDecoration(String text) {
    return InputDecoration(
      label: Text(text),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      contentPadding: text == "Gender" ? const EdgeInsets.symmetric(horizontal: 10) : null,
    );
  }

  Future<void> updateUser({
    required String username,
    required String email,
    required String dateOfBirth,
    required String phoneNum,
    required String gender,
    required String address,
    required String nid,
  }) async {
    // Update Hive box
    final box = Boxes.getLoginData();
    final user = box.get('userLogin');
    if (user != null) {
      final userData = UserLogin(
          userId: user.userId,
          username: username,
          areaId: user.areaId,
          areaName: user.areaName,
          password: user.password,
          deviceId: user.deviceId,
          deviceBrand: user.deviceBrand,
          deviceModel: user.deviceModel,
          gender: gender,
          phoneNum: phoneNum,
          address: address,
          nid: nid,
          email: email,
          dateOfBirth: dateOfBirth,
          age: user.age,
          likedForms: user.likedForms);
      Boxes.getLoginData().put('userLogin', userData);
    }

    // Update Firebase
    // Assuming userLogin!.userId is the document id in Firestore
    final userId = userLogin?.userId;
    if (userId != null) {
      final docUser = FirebaseFirestore.instance.collection('mpc_users').doc(userId);
      await docUser.update({
        'user_name': username,
        'user_mail': email,
        'date_of_birth': dateOfBirth,
        'user_mobile': phoneNum,
        'gender': gender,
        'nid': nid,
        "address": address
      });
    }
  }
}
