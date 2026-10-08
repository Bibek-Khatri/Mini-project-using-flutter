import 'package:flutter/material.dart';

class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  horizontalitem(size, String title, url, date){
    return Stack(
      children: [

        Container(
          margin: EdgeInsets.only(left: 10,right: 10,top: 8),
          height: size.height/4.5,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(20),
          ),
          width: size.width/1.1,

          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(url,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10,right: 10,top: 8),
          height: size.height/4.5,
          width: size.width/1.1,
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        Positioned( bottom: 40,left: 30,
            child: Container(width: size.width/2,
                child: Text(title,
                  overflow: TextOverflow.ellipsis,maxLines: 2,
                  style: TextStyle(color: Colors.white),)
            )),
        Positioned( bottom: 20,left: 30,
            child: Container(width: size.width/2,
                child: Text(date,
                  overflow: TextOverflow.ellipsis,maxLines: 1,
                  style: TextStyle(color: Colors.white),)
            )),
        Positioned( bottom: 20,right: 30,
            child: Container(
                child: Icon(Icons.play_circle,color: Colors.white,size: 30,)
            ))
      ],
    );
  }
  verticalitem(size, String title,url, date, source){
    return Container(
      margin: EdgeInsets.all(15),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                      fit: BoxFit.cover,
                      url),
                ),
              ),
              Container(
                height: 150,
                width: 150,
                child: Center(
                  child: Icon(Icons.play_circle_fill_rounded,size: 50,
                    color: Colors.white,),
                ),
              )
            ],
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 15),
                width: size.width/2,
                child: Text(title, maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
              ),
              Container(
                margin: EdgeInsets.all(15),
                width: size.width/2.2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 15,
                          right: 15,top: 10,bottom: 10),
                      decoration: BoxDecoration(
                          color:Colors.red ),
                      child: Text(source,style: TextStyle(color: Colors.white),),
                    ),
                    Text(date,style: TextStyle(color: Colors.black),),
                  ],
                ),
              )
            ],
          )

        ],
      ),
    );
  }

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

            //horizontal list data
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  horizontalitem(size, "Story no1 ", "https://imgs.search.brave.com/GO8ZB_gMZoE28uWTwsOjitIQ-cvL5jrv1h_8nqpyG_g/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly9jZG4t/ZnJvbnQuZnJlZXBp/ay5jb20vaG9tZS9h/bm9uLXJ2bXAvY3Jl/YXRpdmUtc3VpdGUv/c29jaWFsLW1lZGlh/L29uLWJyYW5kLndl/YnA", "2026/02/01"),
                  horizontalitem(size, "Story no1 ", "https://imgs.search.brave.com/GO8ZB_gMZoE28uWTwsOjitIQ-cvL5jrv1h_8nqpyG_g/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly9jZG4t/ZnJvbnQuZnJlZXBp/ay5jb20vaG9tZS9h/bm9uLXJ2bXAvY3Jl/YXRpdmUtc3VpdGUv/c29jaWFsLW1lZGlh/L29uLWJyYW5kLndl/YnA", "2026/02/01"),
                  horizontalitem(size, "Story no1 ", "https://imgs.search.brave.com/GO8ZB_gMZoE28uWTwsOjitIQ-cvL5jrv1h_8nqpyG_g/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly9jZG4t/ZnJvbnQuZnJlZXBp/ay5jb20vaG9tZS9h/bm9uLXJ2bXAvY3Jl/YXRpdmUtc3VpdGUv/c29jaWFsLW1lZGlh/L29uLWJyYW5kLndl/YnA", "2026/02/01"),


                ],
              ),
            ),

            //vertical list data
            Container(
              height: size.height/1.65,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    verticalitem(size, "Happy dashain", "https://imgs.search.brave.com/mQgkztE9eJ35T-3MyYzX-pdjowPRXrTFmyWabZ7jUqE/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jZG4u/ZHJpYmJibGUuY29t/L3VzZXJ1cGxvYWQv/MTY3MjUzNDEvZmls/ZS9vcmlnaW5hbC02/Njc0ZGQwOGY3N2U3/NWE4NGE5M2I4ZDdm/MWVkNmNiMC5qcGc_/Zm9ybWF0PXdlYnAm/cmVzaXplPTQwMHgz/MDAmdmVydGljYWw9/Y2VudGVy", "2026/02/01", "xyz.com"),
                    verticalitem(size, "Happy dashain", "https://imgs.search.brave.com/mQgkztE9eJ35T-3MyYzX-pdjowPRXrTFmyWabZ7jUqE/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jZG4u/ZHJpYmJibGUuY29t/L3VzZXJ1cGxvYWQv/MTY3MjUzNDEvZmls/ZS9vcmlnaW5hbC02/Njc0ZGQwOGY3N2U3/NWE4NGE5M2I4ZDdm/MWVkNmNiMC5qcGc_/Zm9ybWF0PXdlYnAm/cmVzaXplPTQwMHgz/MDAmdmVydGljYWw9/Y2VudGVy", "2026/02/01", "xyz.com"),
                    verticalitem(size, "Happy dashain", "https://imgs.search.brave.com/mQgkztE9eJ35T-3MyYzX-pdjowPRXrTFmyWabZ7jUqE/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jZG4u/ZHJpYmJibGUuY29t/L3VzZXJ1cGxvYWQv/MTY3MjUzNDEvZmls/ZS9vcmlnaW5hbC02/Njc0ZGQwOGY3N2U3/NWE4NGE5M2I4ZDdm/MWVkNmNiMC5qcGc_/Zm9ybWF0PXdlYnAm/cmVzaXplPTQwMHgz/MDAmdmVydGljYWw9/Y2VudGVy", "2026/02/01", "xyz.com"),
                    verticalitem(size, "Happy dashain", "https://imgs.search.brave.com/mQgkztE9eJ35T-3MyYzX-pdjowPRXrTFmyWabZ7jUqE/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jZG4u/ZHJpYmJibGUuY29t/L3VzZXJ1cGxvYWQv/MTY3MjUzNDEvZmls/ZS9vcmlnaW5hbC02/Njc0ZGQwOGY3N2U3/NWE4NGE5M2I4ZDdm/MWVkNmNiMC5qcGc_/Zm9ybWF0PXdlYnAm/cmVzaXplPTQwMHgz/MDAmdmVydGljYWw9/Y2VudGVy", "2026/02/01", "xyz.com"),
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}