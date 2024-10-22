import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beautiful Widgets',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'Italic',
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
  int _currentPage = 0;
  final List<Widget> _pages = [
    _buildStyledWidget(
      icon: Icons.home,
      title: 'Birinchi sahifa',
      gradientColors: [Colors.pinkAccent, Colors.redAccent],
    ),
    _buildStyledWidget(
      icon: Icons.favorite,
      title: 'Ikkinchi sahifa',
      gradientColors: [Colors.teal, Colors.greenAccent],
    ),
    _buildStyledWidget(
      icon: Icons.star,
      title: 'Uchinchi sahifa',
      gradientColors: [Colors.deepPurpleAccent, Colors.indigo],
    ),
  ];
  static Widget _buildStyledWidget({
    required IconData icon,
    required String title,
    required List<Color> gradientColors,
  }) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 15,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 60,
              color: Colors.white.withOpacity(0.9),
            ),
            SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.5,
                shadows: [
                  Shadow(
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.5),
                    offset: Offset(2, 2),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
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
        title: Text('Beautiful Widgets'),
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
                icon: Icon(Icons.arrow_upward, size: 40, color: Colors.purple),
                onPressed: _previousPage,
              ),
            ),
          if (_currentPage != _pages.length - 1)
            Positioned(
              bottom: 20,
              left: MediaQuery.of(context).size.width * 0.5 - 30,
              child: IconButton(
                icon: Icon(Icons.arrow_downward, size: 40, color: Colors.purple),
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
