import 'package:flutter/material.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imgList = [
    'https://uzum.uz/media/wp-content/uploads/2023/12/fishki-uzum-marketa-1-1838x810.png',
    'https://uzum.uz/media/wp-content/uploads/2023/12/fishki-uzum-marketa-1-1838x810.png',
    'https://uzum.uz/media/wp-content/uploads/2023/12/fishki-uzum-marketa-1-1838x810.png',
  ];

  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  // ignore: unused_field
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoPlay();
  }

  void _startAutoPlay() {
    _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (_currentPage < imgList.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Uzum Market',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 180.0,
            child: PageView.builder(
              controller: _pageController,
              itemCount: imgList.length,
              itemBuilder: (context, index) {
                return Image.network(
                  imgList[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                );
              },
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
