import 'package:flutter/material.dart';
import 'package:miniflutterproject/pages/dashboard.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: size.height/1.5,
                    width: size.width,
                    child: Image.network(
                        fit:BoxFit.cover,
                        "https://imgs.search.brave.com/F-kLPeGhnoVb2H-cTH-OsFTwm9ArVqecW4xNPWTIVYc/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9yZXN0/cmVhbS5pby9sZWFy/bi9hc3NldHMvaW1h/Z2VzL21haW4tYmcu/d2VicD92PTM3dEhD/VWszcG1KUlYyejU")),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            width: size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Convo", style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 70,
                                  fontWeight: FontWeight.bold,
                                )),
                              ],
                            ),
                          ),
                        ),
              ],
            ),
            Container(
              width: size.width/1.1,
              margin: EdgeInsets.all(18),
              padding: EdgeInsets.only(left: 20, right: 10, top: 5, bottom: 5),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadiusGeometry.circular(15)
              ),
              child: Row(
                children: [
                  Text("Email: "),
                  Container(
                    width: size.width/1.8,
              
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hint: Text("Enter your email"),
                      ),
                    ),


                  ),



                ],
              ),
            ),
            Container(
              width: size.width/1.1,
              margin: EdgeInsets.all(18),
              padding: EdgeInsets.only(left: 20, right: 10, top: 5, bottom: 5),
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadiusGeometry.circular(15)
              ),
              child: Row(
                children: [
                  Text("Password: "),
                  Container(
                    width: size.width/1.8,

                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hint: Text("Enter your password"),
                      ),
                    ),
                  ),



                ],
              ),
            ),
            GestureDetector(
              onTap:(){
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (context) => dashboard()
                  )
                );
              },
              child: Container(
                margin: EdgeInsets.only(left: 10),
                padding: EdgeInsets.only(top: 15, right: 20, left: 20, bottom: 15 ),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Text("Login".toUpperCase(),
                style: TextStyle(color: Colors.white),),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Forget password? | "),
                Text("Register here")
              ],
            )
          ],
        ),
      ),
    );
  }
}
