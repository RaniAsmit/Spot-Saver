import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:social/pagess/home_page.dart';
import 'package:social/sevices/firebase_service.dart';
import 'package:social/widgets/custom_dropdown.dart';
import 'package:social/pagess/liquid_swipe.dart';

class BorrowPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BorrowPageState();
  }
}

class _BorrowPageState extends State<BorrowPage> {
  double? _deviceHeight, _deviceWidth;

  FirebaseService? _firebaseService;
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  String? _name;
  String? _password;

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
          padding: EdgeInsets.symmetric(horizontal: _deviceWidth! * 0.05),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _titleWidget(),
                // _imageWidget(),
                _loginform(),
                // _loginbutton(),
                _registerPageLink(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _titleWidget() {
    return const Text(
      "Borrow Land",
      style: TextStyle(
        color: Color.fromARGB(255, 8, 122, 120),
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  // Widget _socialImageWidget() {
  //   return Container(
  //     height: _deviceHeight! * 1.2,
  //     width: _deviceHeight! * 1.2,
  //     decoration: const BoxDecoration(
  //       image: DecorationImage(
  //         fit: BoxFit.contain,
  //         image: AssetImage("social\assets\images\social_image.png"),
  //       ),
  //     ),
  //   );
  //}

  Widget _loginform() {
    return Container(
      height: _deviceHeight! * 0.5,
      child: Form(
        key: _loginFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _nameTextField(),
            _ContactTextField(),
            _paperTextField(),
            _idProofTextField(),
            _vehicleWidget(),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => HomePgae()));
                    },
                    child: Container(
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: const Center(
                        child: Text(
                          'borrow',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }

  // Widget _imageWidget() {
  //   return Container(
  //     height: _deviceHeight! * 0.2,
  //     width: _deviceWidth! * 0.2,
  //     decoration: const BoxDecoration(
  //       image: DecorationImage(
  //         image: AssetImage("assets/images/parked-car.png"),
  //       ),
  //     ),
  //   );
  // }

  Widget _nameTextField() {
    return TextFormField(
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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

  // Widget _emailTextField() {
  //   return TextFormField(
  //     style: TextStyle(fontSize: 16),
  //     decoration: InputDecoration(
  //       hintText: "Enter your email id",
  //       contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
  //       border: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(32),
  //       ),
  //       fillColor: Colors.white,
  //     ),
  //     onSaved: (_value) {
  //       setState(
  //         () {
  //           _email = _value;
  //         },
  //       );
  //     },
  //     validator: (_value) {
  //       bool _result = _value!.contains(
  //         RegExp(
  //             r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"),
  //       );
  //       return _result ? null : "Please enter a valid email id";
  //     },
  //   );
  // }

  Widget _ContactTextField() {
    return TextFormField(
      obscureText: true,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        hintText: "Phone number",
        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        fillColor: Color.fromARGB(255, 145, 222, 209),
      ),
      onSaved: (_value) {
        setState(
          () {
            _password = _value;
          },
        );
      },
      validator: (_value) =>
          _value!.length > 11 ? null : "Please enter the correct phone number",
    );
  }

  Widget _paperTextField() {
    return TextFormField(
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        hintText: "Upload Car Papers(.pdf)",
        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        fillColor: Colors.white,
      ),
      validator: (_value) =>
          _value!.length > 0 ? null : "Please upoload a file",
      onSaved: (_value) {
        setState(() {
          _name = _value;
        });
      },
    );
  }

  Widget _idProofTextField() {
    return TextFormField(
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        hintText: "aadhar/pan,etc",
        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        fillColor: Colors.white,
      ),
      validator: (_value) => _value!.length > 0 ? null : "Please upload a file",
      onSaved: (_value) {
        setState(() {
          _name = _value;
        });
      },
    );
  }

  Widget _vehicleWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomDropDownButtonClass(
          values: const ['car', 'Truck', 'Jeep'],
          width: _deviceWidth! * 0.9,
        )
      ],
    );
  }

  // Widget _loginbutton() {
  //   return MaterialButton(
  //     // onPressed: _loginUser,
  //     minWidth: _deviceWidth! * 0.1,
  //     height: _deviceHeight! * 0.03,
  //     color: Color.fromARGB(255, 22, 202, 196),
  //     child: const Text(
  //       "Login",
  //       style: TextStyle(
  //           color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
  //     ),
  //   );
  // }

  // Widget _loginbutton() {
  //   final ButtonStyle style =
  //       ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 20));

  //   return Center(
  //     child: Column(
  //       mainAxisSize: MainAxisSize.max,
  //       children: <Widget>[
  //         // ElevatedButton(
  //         //   style: style,
  //         //   onPressed: null,
  //         //   child: const Text('Disabled'),
  //         // ),
  //         const SizedBox(
  //           height: 20,
  //         ),
  //         ElevatedButton(
  //           style: ElevatedButton.styleFrom(
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(32),
  //             ),
  //           ),
  //           onPressed: () {},
  //           child: const Text('Login'),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _registerPageLink() {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'register'),
      child: const Text(
        "already have an account?register",
        style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 15,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  // void _loginUser() async {
  //   if (_loginFormKey.currentState!.validate()) {
  //     _loginFormKey.currentState!.save();
  //     bool _result = await _firebaseService!
  //         .loginUser(: _name!, password: _password!);
  //     if (_result) Navigator.popAndPushNamed(context, 'home');
  //   }
  // }
}
