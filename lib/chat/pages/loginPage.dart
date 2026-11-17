import 'package:miniflutterproject/pages/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});
  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _auth.authStateChanges().listen((User? user) {
      if (user != null && mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute<void>(builder: (context) => dashboard()),
        );
      }
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signInWithEmailAndPassword() async {
    setState(() => _isLoading = true);
    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      if (mounted && userCredential.user != null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute<void>(builder: (context) => dashboard()),
        );
        _emailController.clear();
        _passwordController.clear();
      }
    } on FirebaseAuthException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? 'Sign in failed')),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: size.height/1.5,
                  width: size.width,
                  child: Image.network(
                      fit: BoxFit.fitWidth,
                      "https://img.magnific.com/free-vector/messaging-application-abstract-concept-illustration_335657-3870.jpg?semt=ais_hybrid&w=740&q=80"
                  ),
                ),
                Positioned(
                  bottom: -5,
                  child: Container(
                    width: size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("eGUFF",
                          style: TextStyle(
                              color: Color(0xffCD86E4),
                              fontSize: 70,fontWeight: FontWeight.bold
                          ),),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: size.width/1.1,
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Color(0xffEAEDF6),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Text(" Email: "),
                  Container(
                    width: size.width/1.8,
                    child: TextField(

                    decoration: InputDecoration(
                        hintText: "abc@gmail.com",
                        border: InputBorder.none
                    ),
                    controller: _emailController,
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: size.width/1.1,
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Color(0xffEAEDF6),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Text(" Password: "),
                  Container(
                    width: size.width/1.8,
                    child: TextField(
                      obscureText: true,
                    decoration: InputDecoration(
                        hintText: "keep it a secret",
                        border: InputBorder.none
                    ),
                    controller: _passwordController,
                    ),
                  ),

                ],
              ),
            ),
            GestureDetector(
              onTap: _signInWithEmailAndPassword,
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.only(
                    left: 20,right: 20,
                    top: 12,bottom: 12
                ),
                decoration: BoxDecoration(
                    color: _isLoading ? Colors.blue.shade300 : Colors.blue,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: _isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : Text("Login".toUpperCase(),
                      style: TextStyle(color: Colors.white,
                          fontSize: 14,fontWeight: FontWeight.bold),
                    ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("forget password? "),
                Text("Register Now")
              ],
            )
          ],
        ),
      ),
    );
  }
}