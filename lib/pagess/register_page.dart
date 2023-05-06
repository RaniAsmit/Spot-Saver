import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:social/sevices/firebase_service.dart';
// import 'package:get_it/get_it.dart';
// import 'package:social/sevices/firebase_service.dart';

// import '../sevices/firebase_service.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegisterPageState();
  }
}

class _RegisterPageState extends State<RegisterPage> {
  double? _deviceHeight, _deviceWidth;

  FirebaseService? _firebaseService;

  final GlobalKey<FormState> _registerFromKey = GlobalKey<FormState>();

  String? _name, _email, _password;
  File? _image;

  @override
  void initState() {
    super.initState();
    _firebaseService = GetIt.instance.get<FirebaseService>();
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: _deviceWidth! * 0.05,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _titleWidget(),
                _imageWidget(),
                _registrationForm(),
                _registerButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget _titleWidget() {
  //   return const Text(
  //     "Social",
  //     style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
  //   );
  // }

  Widget _titleWidget() {
    return const Text(
      "Social",
      style: TextStyle(
        color: Color.fromARGB(255, 22, 202, 196),
        fontSize: 50,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _registrationForm() {
    return Container(
      height: _deviceHeight! * 0.20,
      child: Form(
        key: _registerFromKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _nameTextField(),
            _emailTextField(),
            _passwordTextField(),
          ],
        ),
      ),
    );
  }

  Widget _imageWidget() {
    var _imageProvider = _image != null
        ? FileImage(_image!)
        : const AssetImage("assets/images/social_image.png");
    return GestureDetector(
      onTap: () {
        FilePicker.platform.pickFiles(type: FileType.image).then((_result) {
          setState(() {
            _image = File(_result!.files.first.path!);
          });
        });
      },
      child: Container(
        height: _deviceHeight! * 0.25,
        width: _deviceWidth! * 0.20,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/parked-car.png"),
          ),
        ),
      ),
    );
  }

  Widget _nameTextField() {
    return TextFormField(
      style: TextStyle(fontSize: 16),
      decoration: InputDecoration(
        hintText: "Username",
        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        fillColor: Colors.white,
      ),
      validator: (_value) =>
          _value!.length > 0 ? null : "Please enter username",
      onSaved: (_value) {
        setState(() {
          _name = _value;
        });
      },
    );
  }

  Widget _emailTextField() {
    return TextFormField(
      style: TextStyle(fontSize: 16),
      decoration: InputDecoration(
        hintText: "Enter your email id",
        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        fillColor: Colors.white,
      ),
      onSaved: (_value) {
        setState(
          () {
            _email = _value;
          },
        );
      },
      validator: (_value) {
        bool _result = _value!.contains(
          RegExp(
              r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"),
        );
        return _result ? null : "Please enter a valid email id";
      },
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
      obscureText: true,
      style: TextStyle(fontSize: 16),
      decoration: InputDecoration(
        hintText: "Enter the password",
        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        fillColor: Colors.white,
      ),
      onSaved: (_value) {
        setState(
          () {
            _password = _value;
          },
        );
      },
      validator: (_value) => _value!.length > 5
          ? null
          : "Please enter the password greater then 5 charachter",
    );
  }

  Widget _registerButton() {
    return MaterialButton(
      onPressed: _registerUser,
      minWidth: _deviceWidth! * 0.1,
      height: _deviceHeight! * 0.02,
      color: Color.fromARGB(255, 22, 202, 196),
      child: const Text(
        "Register",
        style: TextStyle(
            color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
      ),
    );
  }

  void _registerUser() async {
    if (_registerFromKey.currentState!.validate() && _image != null) {
      _registerFromKey.currentState!.save();
      bool _result = await _firebaseService!.registerUser(
          name: _name!, email: _email!, password: _password!, image: _image!);
      if (_result) Navigator.pop(context);
    }
  }
}
