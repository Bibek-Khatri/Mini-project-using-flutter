import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(left:10, right:10, top:8),
                  height: size.height/4.5,
                  width: size.width/1.1,
                  color: Colors.deepPurple[300],

                ),
                Positioned(
                    bottom: 45,
                    left: 20,
                    child: Container(

                        width:size.width/2,
                        child: Text("Latest News, Hello, Today is Tuesday, Its a very cold day because of rain that took place the night before",
                          overflow: TextOverflow.ellipsis, maxLines:2,
                          style: TextStyle(color: Colors.white),
                        )



                    )
                ),
                Positioned(
                    bottom: 10,
                    left: 20,
                    child: Container(

                        width:size.width/2,
                        child: Text("06/10/2026"
                            "",
                          overflow: TextOverflow.ellipsis, maxLines:1,
                          style: TextStyle(color: Colors.white),
                        )



                    )
                ),

                Positioned(
                    bottom: 10,
                    right: 20,
                    child: Container(
                        child: Icon(
                          Icons.play_circle, color: Colors.white, size: 30,
                        )

                        )



                    )



              ],
            )
          ],
        ),
      ),
    );
  }
}
