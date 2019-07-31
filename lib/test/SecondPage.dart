import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(FirstPage());

class FirstPage extends StatefulWidget{
  @override
  State<FirstPage> createState() {
    return FirstPageState();
  }
}

class FirstPageState extends State<FirstPage>{
  static const platformChannel =
  const MethodChannel('samples.flutter.io/message');

  String textContent = 'Flutter Message';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    platformChannel.setMethodCallHandler((methodCall) async {
      switch (methodCall.method) {
        case 'showText':
          String content = await methodCall.arguments['content'];
          if (content !=null && content.isNotEmpty) {
            setState(() {
              textContent = content;
            });
            //返回成功的结果
            return 'success';
          } else {
            //返回失败的结果
            throw PlatformException(
                code: '-1',
                message: 'showText fail',
                details: 'content is null');
          }
          break;
        default:
        //返回方法未实现的结果
          throw MissingPluginException();
      }
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
          title: Text('Platform Channel3'),
        ),
        body: Text(textContent),
      ),
    );
  }
}