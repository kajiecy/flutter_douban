import 'package:flutter/material.dart';
class MoviesWidget extends StatefulWidget{

  @override
  State<MoviesWidget> createState() {
    return MovesWidgetState();
  }
}

class MovesWidgetState extends State<MoviesWidget>{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.bottomCenter,
          height: 80,
          padding: EdgeInsets.only(left: 20,right: 20),
          child: TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.black12,
                hintText: '\uE8b6 电影 / 电视剧 / 影人',
                hintStyle: TextStyle(fontFamily: 'MaterialIcons', fontSize: 16),
                contentPadding: EdgeInsets.only(top: 8, bottom: 8),
                border:OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(5))
                )
            ),

          ),
        ),

        Expanded(
          flex: 1,
          child: DefaultTabController(
              length: 2,
              child: Column(
                children: <Widget>[
                  Container(
                    constraints: BoxConstraints.expand(height: 50),
                    child: TabBar(
                        unselectedLabelColor: Colors.black12,
                        labelColor: Colors.black87,
                        indicatorColor: Colors.black87,
                        tabs: <Widget>[
                          Tab(text: '电影',),
                          Tab(text: '电视',)
                        ]
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: TabBarView(
                          children: [
                            Center(
                              child: Text('电影'),
                            ),
                            Center(
                              child: Text('电视'),
                            ),
                          ]
                      ),
                    ),
                  ),
                ],
              )
          ),
        ),

      ],
    );
  }
}