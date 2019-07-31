import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

main() {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }

}

class MyAppState extends State<MyApp> {
  static const eventChannel = const EventChannel('samples.flutter.io/event');

  String textContent = 'Flutter Message';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    eventChannel.receiveBroadcastStream().listen(_onListen,onError: _onError,onDone: _onDone,cancelOnError: false);
  }

  void _onListen(dynamic data){
    setState(() {
      textContent = data;
    });
  }

  void _onError(){
    setState(() {
      textContent = 'EventChannel error';
    });
  }

  void _onDone(){
    setState(() {
      textContent = 'EventChannel done';
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Platform Channel -- EventChannel'),
        ),
        body: Text(textContent),
      ),
    );
  }
}