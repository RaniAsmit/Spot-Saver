import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:social/pagess/feed_Page.dart';
import 'package:social/pagess/profile_page.dart';
import 'package:social/sevices/firebase_service.dart';

class HomePgae extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePgae> {
  FirebaseService? _firebaseService;
  int _currentPage = 0;
  final List<Widget> _pages = [
    FeedPage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    _firebaseService = GetIt.instance.get<FirebaseService>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          textAlign: TextAlign.center,
          "Spot Saver",
        ),
        actions: [
          //   GestureDetector(
          //     onTap: _postImage,
          //     child: const Icon(Icons.add_a_photo),
          //   ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 10.0,
            ),
            child: GestureDetector(
              onTap: () async {
                _firebaseService!.logout();
                Navigator.popAndPushNamed(context, 'login');
              },
              child: const Icon(Icons.logout),
            ),
          )
        ],
      ),
      bottomNavigationBar: _bottomNaviagtionBar(),
      body: _pages[_currentPage],
    );
  }

  Widget _bottomNaviagtionBar() {
    return BottomNavigationBar(
      currentIndex: _currentPage,
      selectedItemColor: Color.fromARGB(224, 4, 214, 225),
      onTap: (_index) {
        setState(
          () {
            _currentPage = _index;
          },
        );
      },
      items: const [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(
            Icons.feed,
          ),
        ),
        BottomNavigationBarItem(
          label: 'Profile',
          icon: Icon(
            Icons.account_box,
          ),
        ),
      ],
    );
  }

  void _postImage() async {
    FilePickerResult? _result =
        await FilePicker.platform.pickFiles(type: FileType.image);
    File _image = File(_result!.files.first.path!);
    await _firebaseService!.postImage(_image);
  }
}
