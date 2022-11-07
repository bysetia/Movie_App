import 'package:belajar_listview/favorite.dart';
import 'package:belajar_listview/listAllFootball.dart';
import 'package:belajar_listview/splashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class TabBarDemo extends StatefulWidget {
  @override
  _TabBarDemoState createState() => _TabBarDemoState();
}

class _TabBarDemoState extends State<TabBarDemo>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _selectedIndex = 0;

  List<Widget> list = [
    Tab(icon: Text('Movie')),
    Tab(icon: Text('Favorite')),
    Tab(icon: Text('Save')),
  ];

  @override
  void initState() {
    super.initState();

    _controller = TabController(length: list.length, vsync: this);

    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
      print("Selected Index: " + _controller.index.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            onTap: (value) {},
            controller: _controller,
            tabs: list,
          ),
          // title: Container(
          //   margin: EdgeInsets.only(top: 25),
          //   child: Text(
          //     'TheMovie.',
          //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: (25)),
          //   ),
          // ),
          // backgroundColor: Colors.pink,
          title: Container(
            child: Image.asset(
              'image/logo.jpeg',
              width: 100,
              height: 500,
            ),
          ),
        ),
        body: TabBarView(
          controller: _controller,
          children: [
            ListAllFootbal(),
            // ListSiswa(),
            Favmviepge(),
            Center(
                child: Text(
              _selectedIndex.toString(),
              style: TextStyle(fontSize: 40),
            )),
          ],
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     Navigator.push(
        //         context, MaterialPageRoute(builder: (context) => PageView()));
        //   },
        //   child: Icon(Icons.favorite),
        // ),
      ),
    );
  }
}
