import 'package:empattask3/pages/account.dart';
import 'package:empattask3/pages/mainpage.dart';
import 'package:empattask3/pages/photos.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var pages = const [
    MainPage(),
    PhotoPage(),
    AccountPage(),
  ];

  var navElements = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.photo_camera),
      label: 'Photo',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.account_circle),
      label: 'Account',
    ),
  ];

  int pageNum = 0;
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F8),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFF715AFF),
        unselectedItemColor: const Color(0xFFA682FF),
        showUnselectedLabels: false,
        onTap: (index) {
          if (index != pageNum) {
            setState(() {
              pageNum = index;
            });
            _pageController.animateToPage(pageNum,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut);
          }
        },
        currentIndex: pageNum,
        items: navElements,
      ),
      body: SafeArea(
        child: PageView.builder(
          onPageChanged: (index) {
            setState(() {
              pageNum = index;
            });
          },
          controller: _pageController,
          itemCount: pages.length,
          itemBuilder: (context, index) {
            return pages[index];
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

