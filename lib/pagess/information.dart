import 'package:flutter/material.dart';
import 'package:social/pagess/liquid_swipe.dart';
//
// import 'package:social/pagess/information.dart';
import 'package:social/pagess/login_Page.dart';
import 'package:social/pagess/welcome.dart';

class Information extends StatelessWidget {
  const Information({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 8, 135, 147),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(18),
          height: size.height,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 150,
                child: RichText(
                  text: const TextSpan(
                      text: 'Start',
                      style: TextStyle(
                        fontSize: 30,
                        color: Color.fromARGB(255, 220, 15, 104),
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Your Parking Journey',
                            style: TextStyle(
                              color: Colors.black87,
                            ))
                      ]),
                ),
              ),
              Positioned(
                bottom: 100,
                left: 0,
                right: 0,
                child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => Choose()));
                      },
                      child: Container(
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        child: const Center(
                          child: Text(
                            'Next',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    )),
              )
              // SizedBox(
              //   width: 80,
              //   height: 80,
              //   child: Image.asset('assets/images/social_image.png'),
              // ),
              // Container(
              //   height: size.height * 0.3,
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: const BorderRadius.all(
              //       Radius.circular(20),
              //     ),
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.grey.withOpacity(0.2),
              //         spreadRadius: 2,
              //         blurRadius: 20,
              //         offset: const Offset(0, 0),
              //       )
              //     ],
              //   ),
              //   child: Stack(
              //     clipBehavior: Clip.none,
              //     children: [
              //       const Positioned(
              //         top: 10,
              //         left: 20,
              //         child: Text(
              //           'Login Here',
              //           style: TextStyle(
              //             fontSize: 20,
              //             fontWeight: FontWeight.w500,
              //           ),
              //         ),
              //       ),
              //       Positioned(
              //         top: 120,
              //         left: 20,
              //         child: Column(
              //           children: [
              //             Row(
              //               children: [
              //                 const Icon(Icons.mail_outline, color: Colors.grey),
              //                 Container(
              //                   padding: const EdgeInsets.only(left: 10),
              //                   width: 300,
              //                   child: const TextField(
              //                     cursorColor: Colors.grey,
              //                     style: TextStyle(color: Colors.black54),
              //                     decoration: InputDecoration(
              //                       border: InputBorder.none,
              //                       hintText: 'example@gmail.com',
              //                     ),
              //                   ),
              //                 )
              //               ],
              //             ),
              //             SizedBox(
              //               width: size.width * 0.8,
              //               child: const Divider(color: Colors.grey),
              //             )
              //           ],
              //         ),
              //       )
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
