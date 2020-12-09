import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Custom Bottom NavigationBar"),
        ),
        body: Center(
          child: Text("Hello Custom Nav Bar$_selectedItem"),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          defaultSelectedIndex: 3,
          inconList: [
            Icons.home,
            Icons.card_giftcard,
            Icons.camera,
            Icons.pie_chart,
            Icons.person,
          ],
          onChange: (val) {
            setState(() {
              _selectedItem = val;
            });
          },
        ));
  }
}

class CustomBottomNavigationBar extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function (int) onChange;
  final List<IconData> inconList;
  CustomBottomNavigationBar({this.defaultSelectedIndex = 0,@required this.inconList,@required this.onChange});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedItemIndex = 0;
  List<IconData> _iconList= []; 
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedItemIndex= widget.defaultSelectedIndex ;
    _iconList = widget.inconList;
  }
  @override
  Widget build(BuildContext context) {
    List<Widget> _navBarItemList = [];
    for (var i=0;i <_iconList.length;i++) {
     
      _navBarItemList.add(buildNavBarItem(i,_iconList[i]));
    }
    return Row(
      children: _navBarItemList
    );
  }

  Widget buildNavBarItem(int index, IconData icon) {
    return GestureDetector(
      onTap: () {
        widget.onChange(index);
        setState(() {
          _selectedItemIndex = index;
        });
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width / _iconList.length,
        decoration: index == _selectedItemIndex
            ? BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 4, color: Colors.green),
                ),
                gradient: LinearGradient(colors: [
                  Colors.green.withOpacity(0.3),
                  Colors.green.withOpacity(0.015),
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
              )
            : BoxDecoration(),
        child: Icon(
          icon,
          color: index == _selectedItemIndex ? Colors.green : Colors.grey,
        ),
      ),
    );
  }
}
