import 'package:flutter/material.dart';
import '../controller/apicall.dart';
import '../model/news.dart';
import 'dashboard.dart';

class detailpage extends StatefulWidget {
  detailpage({super.key});

  @override
  State<detailpage> createState() => detailpageState();
}

class detailpageState extends State<detailpage> {

  Future<news?>? futurenewsdata;
  @override
  void initState() {
    super.initState();
    futurenewsdata = Apicall.getnewsapidata();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 55,),
            Stack(
              children: [
                Container(
                  height: size.height/4,
                  width: size.width,
                  child: Image.network(fit: BoxFit.cover
                      ,"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjZEcP2NkJQgEzAbBaG49jkD5TOG9hI9VALB1a_-vXlQ&s=10"),
                ),
                Container(
                  height: size.height/4,
                  width: size.width,
                  color: Colors.black45,
                ),
                GestureDetector(
                  onTap:() {
                    Navigator.of(context).pop();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Icon(Icons.arrow_back,
                      color: Colors.white,size: 40,),
                  ),
                ),
                Positioned(
                  right: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Icon(Icons.share,
                      color: Colors.white,size: 40,),
                  ),
                ),
                Container(
                  height: size.height/4,
                  child: Center(
                    child: Icon(Icons.play_circle_fill,
                      size: 60,
                      color: Colors.white,),
                  ),
                )
              ],
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text("Happy Dashain Everyone".toUpperCase(),
                style: TextStyle(fontSize: 20),maxLines: 2,),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Author Name"),
                  Text("02 02 2026")
                ],),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text("Happy Dashain, Happy Dashain, Happy Dashain,"
                  "Happy Dashain,"
                  "Happy Dashain, Happy Dashain, Happy Dashain, Happy Dashain,"
                  "Happy Dashain,"
                  "Happy Dashain,"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0,right: 15),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text("Related Videos", style: TextStyle(fontSize: 18),),
            ),

            FutureBuilder(
                future: futurenewsdata,
                builder: (context, AsyncSnapshot<news?> snapshot){
                  switch (snapshot.connectionState){
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Center(child: CircularProgressIndicator(),);
                    case ConnectionState.active:
                    case ConnectionState.done:
                      if(snapshot.hasData){
                        //ui
                        var data = snapshot.data;
                        return Column(
                          children: [

                            Container(
                              height: size.height/1.65,
                              child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  itemCount: data!.articles!.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return dashboardState.verticalllistitem(size,
                                        data.articles![index].title!,
                                        data.articles![index].urlToImage,
                                        data.articles![index].publishedAt!.split("T")[0],
                                        data.articles![index].source!.name!
                                    );
                                  }
                              ),
                            ),

                          ],
                        );
                      }else{
                        return Center(child: Text("No Data"),);
                      }
                  }
                }),



          ],
        ),
      ),
    );
  }
}