import 'package:flutter/material.dart';
class MineWidget extends StatefulWidget{
  @override
  State<MineWidget> createState() {
    return MineWidgetState();
  }
}

class MineWidgetState extends State<MineWidget>{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('我的'),
    );
  }
}