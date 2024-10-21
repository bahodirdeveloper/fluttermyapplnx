import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stylish Widgets with Smooth Transition',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WidgetNavigator(),
    );
  }
}

class WidgetNavigator extends StatefulWidget {
  @override
  _WidgetNavigatorState createState() => _WidgetNavigatorState();
}

class _WidgetNavigatorState extends State<WidgetNavigator> {
  final PageController _pageController = PageController();
  int _currentPage = 0; // Sahifadagi hozirgi pozitsiyani kuzatish uchun o'zgaruvchi

  // Sahifalar ro'yxati (widgetlar)
  final List<Widget> _pages = [
    Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.redAccent.shade100,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 15,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.home, size: 40, color: Colors.white),
            SizedBox(height: 10),
            Text(
              'Birinchi widget',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.5,
                shadows: [
                  Shadow(
                    blurRadius: 5,
                    color: Colors.black45,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.greenAccent.shade100,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 15,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite, size: 40, color: Colors.white),
            SizedBox(height: 10),
            Text(
              'Ikkinchi widget',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.5,
                shadows: [
                  Shadow(
                    blurRadius: 5,
                    color: Colors.black45,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blueAccent.shade100,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 15,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.star, size: 40, color: Colors.white),
            SizedBox(height: 10),
            Text(
              'Uchinchi widget',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.5,
                shadows: [
                  Shadow(
                    blurRadius: 5,
                    color: Colors.black45,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  ];

  void _nextPage() {
    _pageController.nextPage(
      duration: Duration(milliseconds: 500), // Smooth and longer transition
      curve: Curves.easeInOutCubic,
    );
  }

  void _previousPage() {
    _pageController.previousPage(
      duration: Duration(milliseconds: 500), // Smooth and longer transition
      curve: Curves.easeInOutCubic,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stylish Widgets with Smooth Transition'),
      ),
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: _pages,
          ),
          if (_currentPage != 0)
            Positioned(
              top: 20,
              left: MediaQuery.of(context).size.width * 0.5 - 30,
              child: IconButton(
                icon: Icon(Icons.arrow_upward, size: 40, color: Colors.black),
                onPressed: _previousPage,
              ),
            ),
          if (_currentPage != _pages.length - 1)
            Positioned(
              bottom: 20,
              left: MediaQuery.of(context).size.width * 0.5 - 30,
              child: IconButton(
                icon: Icon(Icons.arrow_downward, size: 40, color: Colors.black),
                onPressed: _nextPage,
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
