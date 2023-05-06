import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:social/pagess/information.dart';
import 'package:social/sevices/firebase_service.dart';
import 'package:google_fonts/google_fonts.dart';

// import '../components/available_land.dart';

class FeedPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FeedPageState();
  }
}

class _FeedPageState extends State<FeedPage> {
  double? _deviceHeight, _deviceWidth;
  FirebaseService? _firebaseService;

  @override
  void initState() {
    super.initState();
    _firebaseService = GetIt.instance.get<FirebaseService>();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     color: Color.fromARGB(255, 255, 255, 255),
  //     width: 450,
  //     height: 120,
  //     child: Center(
  //       child: Text(
  //         "Welcome!!!!",
  //         textAlign: TextAlign.center,
  //         style: TextStyle(
  //           fontSize: 30,
  //           color: Color.fromARGB(255, 23, 23, 23),
  //           fontWeight: FontWeight.bold,
  //           fontStyle: FontStyle.italic,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // final List<String> entries = <String>['A', 'B', 'C'];
  // final List<int> colorCodes = <int>[600, 500, 100];

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       body: SafeArea(
  //     child: Column(
  //       children: [
  //         Container(
  //           alignment: Alignment.topLeft,
  //           child: Image.asset(
  //             'assets/images/car6.jpg',
  //             height: 150,
  //             width: double.infinity,
  //             fit: BoxFit.cover,
  //           ),
  //         ),
  //         Available(),
  //       ],
  //     ),
  //   ));
  // }

  // Container(
  //   width: 250,
  //   height: 150,
  //   alignment: Alignment.topCenter,
  //   child: Text(
  //     'Welcome',
  //     style: TextStyle(
  //         color: Colors.pink,
  //         fontWeight: FontWeight.bold,
  //         fontSize: 22.0),
  //   ),
  // )
  // const SizedBox(
  //   height: 24,
  // ),

  // const Padding(
  //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
  //   child: Divider(),
  // ),
  // const SizedBox(
  //   height: 24,
  // ),
  // ListView.separated(
  //   padding: const EdgeInsets.all(8),
  //   itemCount: entries.length,
  //   itemBuilder: (BuildContext context, int index) {
  //     return Container(
  //       height: 50,
  //       color: Colors.amber[colorCodes[index]],
  //       child: Center(child: Text('Entry ${entries[index]}')),
  //     );
  //   },
  //   separatorBuilder: (BuildContext context, int index) =>
  //       const Divider(),
  // ),
  //     ],
  //   )),

  @override
  Widget build(BuildContext context) {
    var arrName = [
      'James',
      'Will',
      'Akshay',
      'Arjun',
      'Josh',
      'Atlas',
      'Shaan',
      'Shelly'
    ];
    var Area = [
      '20sq.ft',
      '10sq.ft',
      '23sq.ft',
      '30sq.ft',
      '50sq.ft',
      '50sq.ft',
      '50sq.ft',
      '50sq.ft'
    ];
    var Price = [
      '2000rs',
      '1000rs',
      '2300rs',
      '3000rs',
      '5000rs',
      '5000rs',
      '5000rs',
      '5000rs'
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          // return InkWell(
          //   onTap: () {
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => const Information(),
          //         ));
          //   },
          // );
          return ListTile(
            leading: Text('${index + 1}'),
            title: Text(arrName[index]),
            subtitle: Text(Area[index]),
            trailing: Icon(Icons.more),
          );
        },
        itemCount: arrName.length,
        separatorBuilder: (context, index) {
          return Divider(
            height: 20,
            thickness: 1,
          );
        },
      ),
    );
  }
}
