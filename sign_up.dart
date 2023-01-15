import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:movies_app/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

//Future<void> createUser(String email, String password) ;

/*signInWithEmailAndPassword() async{
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
}

signOut() async{
  await FirebaseAuth.instance.signOut();
}
*/
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(SignUpScreen());
}

class SignUpScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SignUpScreen();

}

class _SignUpScreen extends State<SignUpScreen>{

  // This widget is the root of your application.
  @override

  final emailAddressController = TextEditingController();
  final passwordController = TextEditingController();

  void signUpUser() async{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailAddressController.text,
        password: passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset : false,
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Movies Finder"),
        ),
        body: Padding(padding: EdgeInsets.all(35),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Sign Up",style: TextStyle(fontSize: 30,color:Colors.blueGrey[50],),textAlign: TextAlign.start),
              SizedBox(height:50),
              Align(
                alignment: Alignment.bottomCenter,
                child:Icon(Icons.account_box,size: 150,color: Colors.blueGrey[400],),
              ),
              SizedBox(height:50),
              Text("Email Address",style: TextStyle(fontSize: 20,color: Colors.blueGrey[50],),textAlign: TextAlign.start),
              TextField(
                cursorColor: Colors.black,
                controller: emailAddressController,
                decoration: InputDecoration(
                  hintText: "Enter your email",
                  hintStyle: TextStyle(fontSize: 20.0, color: Colors.grey[800]),
                  //prefixIcon: Icon(Icons.calendar_today_outlined,color: Colors.white,),
                  fillColor: Colors.blueGrey[50],
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.blueGrey),
                  ),
                ),
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height:30),
              Text("Password",style: TextStyle(fontSize: 20,color:Colors.blueGrey[50],),textAlign: TextAlign.start),
              TextField(
                cursorColor: Colors.black,
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter your password",
                  hintStyle: TextStyle(fontSize: 20.0, color: Colors.grey[800]),
                  //prefixIcon: Icon(Icons.calendar_today_outlined,color: Colors.white,),
                  fillColor: Colors.blueGrey[50],
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.blueGrey),
                  ),
                ),
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height:30),
              Align(
                alignment: Alignment.bottomCenter,
                child: Builder(
                    builder:(context) {
                      return ElevatedButton(
                        onPressed: () {
                          signUpUser();
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainScreen()
                          )
                          );
                        },
                        //Navigator.of(context).pop(loginText);
                        child: Text("Sign-Up",style: TextStyle(color: Colors.black54),),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey[400],
                          minimumSize: Size(327,50),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                          //padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                          textStyle: TextStyle(
                            fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black,
                          ),
                        ),//end of styleFrom
                      );
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*Future<void> createUser(String email, String password) async{
  try {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}*/




/*     Text("Login"),
        floatingActionButton: Builder(
            builder:(context) {
              return FloatingActionButton(
                backgroundColor:Colors.deepPurple[800] ,
                onPressed: () async {
                  String newText = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewEventScreen()));
                  setState(() {
                    _list.add(Text(newText));
                  });
                },
                child: Icon(Icons.add),
              );
            }
        ),
      ),
    );
  }
}
*/