import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'model/user_model.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  var child;


  void _dologin(){
    String userName = userNameController.text.toString().trim();
    String password = passwordController.text.toString().trim();

    var user = User(userName: userName, password: password, email: '', phoneNamber: '');

    var box = Hive.box('databases1');
    box.put('user',user.toJson());

    var user2 = User.fromJson(box.get('user'));
    print(user2.userName);
    print(user2.password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      body: Container(
        padding:  EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    //padding: EdgeInsets.all(50),
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage('assets/images/f16.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("Welcome Back!",style: TextStyle(fontSize: 28,color: Colors.white70),),
                  SizedBox(height: 8),
                  Text('Sign in to continuo',style: TextStyle(fontSize: 16,color: Colors.white60),),
                ],
              ),
            ),
            SizedBox(height: 70),
            TextField(
              controller: userNameController,
              decoration: InputDecoration(
                hintText: "User Name",
                icon: Icon(Icons.person_outline),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: "Password",
                icon: Icon(Icons.create),
              ),
            ),
            SizedBox(height: 20),
            Text('Forgot Password?',style: TextStyle(color: Colors.blueGrey),),
            SizedBox(height: 50),
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                color: Colors.blue,
              ),
              child: Icon(Icons.arrow_forward,color: Colors.white,size: 40),
            ),
            SizedBox(height: 100),
            Container(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  RichText(
                    softWrap: true,
                    overflow: TextOverflow.visible,
                    text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "Do not have an account? ",
                            style: TextStyle(color: Colors.blueGrey,fontSize: 18),
                          ),
                          TextSpan(
                            text: "SIGN UP ",
                            style: TextStyle(color: Colors.blue,fontSize: 18,fontWeight:FontWeight.bold),
                          ),
                        ]
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
