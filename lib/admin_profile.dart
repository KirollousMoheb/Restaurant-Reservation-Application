import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_signup_screen/admin_home.dart';
import 'package:login_signup_screen/admin_reservation.dart';
import 'package:login_signup_screen/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

int index=2;
final firebaseUser =   FirebaseAuth.instance.currentUser;
final firestoreInstance = FirebaseFirestore.instance;

final TextEditingController txt1 = TextEditingController();
final TextEditingController txt2 = TextEditingController();
int flag=0;
class AdminProfilePage extends StatelessWidget {


   AdminProfilePage({Key? key
   
   
   }) : super(key: key)  {
     if(flag==0){
getUserData();

     flag=1;
     }


     
   }
     Future<void> getUserData() async {
    final _auth = FirebaseAuth.instance;

      String? currentUser=_auth.currentUser?.uid.toString();

        var collection = FirebaseFirestore.instance.collection('UserData');
    var docSnapshot = await collection.doc(currentUser).get();
    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data();
      var email = data?['email']; // <-- The value you want to retrieve. 
      var username = data?['username']; // <-- The value you want to retrieve.
      txt1.text=email;
      txt2.text=username; 

     }


  // Call setState if needed.
}

  Widget textfield({@required hintText}) {
    return Material(
      elevation: 4,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              letterSpacing: 2,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
            fillColor: Colors.white30,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
        return WillPopScope(
      onWillPop: ()async=>false,
    child: Scaffold(
                   bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            
            onTap: (index){
              if (index==0){
                Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (c, a1, a2) =>  ReservationList(),
                  transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                  transitionDuration: const Duration(milliseconds: 100),
                ),
              );
              }
              if(index==1){
                Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (c, a1, a2) => const AdminReserveScreen(),
                  transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                  transitionDuration: const Duration(milliseconds: 100),
                ),
              );
              }
              if(index==2){
                Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (c, a1, a2) => AdminProfilePage(),
                  transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                  transitionDuration: const Duration(milliseconds: 100),
                ),
              );

              }

          },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Reservations',
          ),

          BottomNavigationBarItem (
            icon: Icon(Icons.table_bar),
            label: 'Book Table',
            
          ),
          BottomNavigationBarItem (
            icon: Icon(Icons.person),
            label: 'Profile',
            
          ),
          
        ],
              currentIndex: index,
      ),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor:const Color(0xff0095FF),
        automaticallyImplyLeading: false,
        actions: [
    ElevatedButton.icon(
      
      style: ElevatedButton.styleFrom(
        primary:const Color.fromARGB(255, 172, 7, 7),
        side: const BorderSide(width: 0.2, color: Color.fromARGB(255, 27, 13, 133))),
      onPressed: () {
        FirebaseAuth.instance.signOut();
        
                        Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (c, a1, a2) => const  LoginScreen(),
                  transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                  transitionDuration: const Duration(milliseconds: 100),
                ),
              );

      },
      label: const Text("Sign Out"),
      icon:const Icon(Icons.exit_to_app)
    ),
  ],

      ),
      body:Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 450,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:   [
                    TextField(
                      controller: txt1,
                      enabled:false
                    ),
                    TextField(
                      controller: txt2,

                      enabled:false
                    ),

                   
]
                  
                ),
              )
            ],
          ),
          CustomPaint(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            painter: HeaderCurvedContainer(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 35,
                    letterSpacing: 1.5,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 5),
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/user.png"),
                  ),
                ),
              ),

            ],
          ),


        ],
      )));
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color(0xff0095FF);
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}