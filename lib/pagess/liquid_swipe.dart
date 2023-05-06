import 'package:flutter/material.dart';
import 'package:social/main.dart';
import 'package:social/pagess/borrow_login.dart';
import 'package:social/pagess/introduction.dart';
import 'package:social/pagess/welcome.dart';
import 'package:social/pagess/borrow_login.dart';

import 'login_Page.dart';

void main() {
  runApp(const MyApp());
}

class Choose extends StatelessWidget {
  const Choose({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 69, 240, 255),
              Color.fromARGB(255, 0, 0, 0),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        child: Center(
          child: Stack(
            children: [
              Positioned(
                  bottom: 550,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      const Text(
                        'Choose',
                        style: TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )),
              Positioned(
                bottom: 350,
                left: 0,
                right: 180,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/car2.jpg',
                      width: 130,
                    ),
                    // const Text(
                    //   'SpotSaver',
                    //   style: TextStyle(
                    //     fontSize: 50,
                    //     color: Colors.white,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                  ],
                ),
              ),
              Positioned(
                bottom: 350,
                left: 180,
                right: 0,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/car5.jpg',
                      width: 130,
                    ),
                    // const Text(
                    //   'SpotSaver',
                    //   style: TextStyle(
                    //     fontSize: 50,
                    //     color: Colors.white,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                  ],
                ),
              ),
              Positioned(
                bottom: 170,
                left: 0,
                right: 180,
                child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => LoginPage()));
                      },
                      child: Container(
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        child: const Center(
                          child: Text(
                            'Lend',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    )),
              ),
              Positioned(
                bottom: 170,
                left: 180,
                right: 0,
                child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => BorrowPage()));
                      },
                      child: Container(
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        child: const Center(
                          child: Text(
                            'Borrow',
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
      ),
    );
  }
}
