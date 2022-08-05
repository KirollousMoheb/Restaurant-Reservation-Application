import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_signup_screen/login.dart';
import 'package:login_signup_screen/onboarding_page.dart';
import 'package:login_signup_screen/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';
 String username="";
 String email="";
 main() async {

   
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();




  final prefs=await SharedPreferences.getInstance();
  final showHome=prefs.getBool('showHome')??false;


  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    home: showHome?HomePage(showHome: showHome):const OnBoardingPage(),
    
  )
  
  );
}
    int index=0;

class HomePage extends StatelessWidget {
  final bool showHome;
  
  const HomePage({Key? key, required this.showHome}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
    
      body: SafeArea(
        child: Container(
          // we will give media query height
          // double.infinity make it big as my parent allows
          // while MediaQuery make it big as per the screen

          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            // even space distribution
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Text(
                    "Welcome Back",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,

                    ),
                    
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text("Welcome to ResTable! ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 15,

                  ),)
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image:  AssetImage("assets/welcome.png")
                  )
                ),
              ),

              Column(
                children: <Widget>[
                  // the login button
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (c, a1, a2) =>const LoginScreen (),
                        transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                        transitionDuration: const Duration(milliseconds: 100),
                      ),
                    );
                    },
                    // defining the shape
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Colors.black
                      ),
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18
                      ),
                    ),
                  ),
                  // creating the signup button
                  const SizedBox(height:20),
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: (){
                      Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (c, a1, a2) => SignupPage(),
                        transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                        transitionDuration: const Duration(milliseconds: 20),
                      ),
                    );
                    },
                    color: const Color(0xff0095FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18
                      ),
                    ),
                  )

                ],
              )



            ],
          ),
        ),
      ),
    );
  }
}
