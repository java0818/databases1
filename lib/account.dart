import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'model/user_model.dart';
class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {


  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phonenambeController = TextEditingController();

  var child;


  void _dologin(){
    String userName = userNameController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    String email = emailController.text.toString().trim();
    String phoneNamber = phonenambeController.text.toString().trim();

    var user = User(userName: userName, password: password, email: email,phoneNamber: phoneNamber);

    var box = Hive.box('databases1');
    box.put('user',user.toJson());

    var user2 = User.fromJson(box.get('user'));
    print(user2.userName);
    print(user2.password);
    print(user2.email);
    print(user2.phoneNamber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Container(
        padding:  EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Text('Create',style: TextStyle(fontSize: 28,color: Colors.white70),),
                  SizedBox(height: 8),
                  Text('Account',style: TextStyle(fontSize: 28,color: Colors.white70),),
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
                hintText: "E-Mail",
                icon: Icon(Icons.email_outlined),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: phonenambeController,
              decoration: InputDecoration(
                hintText: "Phone Number",
                icon: Icon(Icons.phone),
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
                            text: "Already have an account? ",
                            style: TextStyle(color: Colors.blueGrey,fontSize: 18),
                          ),
                          TextSpan(
                            text: "SIGN IN ",
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
