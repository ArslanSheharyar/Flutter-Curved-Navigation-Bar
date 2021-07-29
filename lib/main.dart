import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_curved_navigation_bar/pages/class_four.dart';
import 'package:flutter_curved_navigation_bar/pages/class_one.dart';
import 'package:flutter_curved_navigation_bar/pages/class_three.dart';
import 'package:flutter_curved_navigation_bar/pages/class_two.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CurvedNavWidget(),
    );
  }
}

class CurvedNavWidget extends StatefulWidget {
  @override
  CurvedNavWidgetState createState() => CurvedNavWidgetState();
}

class CurvedNavWidgetState extends State<CurvedNavWidget> {
  int pageIndex = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  //Create All The Pages
  final ClassOne _classOne = ClassOne();
  final ClassTwo _classTwo = ClassTwo();
  final ClassThree _classThree = ClassThree();
  final ClassFour _classFour = ClassFour();

  Widget _showPage = new ClassOne();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _classOne;
        break;
      case 1:
        return _classTwo;
        break;
      case 2:
        return _classThree;
        break;
      case 3:
        return _classFour;
        break;
      default:
        return new Container(
          child: Center(
            child: new Text(
              'No Page Found!',
              style: TextStyle(fontSize: 30.0),
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: pageIndex,
        height: 60.0,
        items: <Widget>[
          Icon(Icons.add, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.compare_arrows, size: 30),
          //Icon(Icons.call_split, size: 30),
          Icon(Icons.perm_identity, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        //backgroundColor: Colors.blueAccent,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (int tappedIndex) {
          setState(() {
            _showPage = _pageChooser(tappedIndex);
          });
        },
        letIndexChange: (index) => true,
      ),
      body: _showPage,
      // body: Container(
      //   color: Colors.blueAccent,
      //   child: Center(
      //     child: _showPage,
      //   ),
      // ),
    );
  }
}

//Text(pageIndex.toString(), textScaleFactor: 10.0),