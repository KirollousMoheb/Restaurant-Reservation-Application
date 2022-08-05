import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:login_signup_screen/menu.dart';
import 'package:login_signup_screen/more.dart';
import 'package:login_signup_screen/reserve.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:transparent_image/transparent_image.dart';

String name='';

int index=0;
 String username="";
 String email="";
class MyHomePage extends StatefulWidget {
   MyHomePage({Key? key}) : super(key: key)  {
getUserData();

  }


  @override
  _MyHomePageState createState() => _MyHomePageState();


         Future<void> getUserData() async {
    final _auth = FirebaseAuth.instance;

      String? currentUser=FirebaseAuth.instance.currentUser?.uid.toString();

        var collection = FirebaseFirestore.instance.collection('UserData');

    var docSnapshot = await collection.doc(currentUser).get();
    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data();  
         

       name= data?['Full Name'];// <-- The value you want to retrieve.

    
  

     }

     }
}

class _MyHomePageState extends State<MyHomePage> {

  List<String> imageList = [
    'https://media-cdn.tripadvisor.com/media/photo-w/13/48/dd/f7/newly-refurbished-in.jpg',
    'https://media-cdn.tripadvisor.com/media/photo-w/13/48/dd/fc/newly-refurbished-in.jpg',
    'https://cdn.pixabay.com/photo/2021/02/08/07/39/chef-5993951_960_720.jpg',
    'https://cdn.pixabay.com/photo/2018/09/14/11/12/food-3676796_960_720.jpg',
    'https://cdn.pixabay.com/photo/2014/09/17/20/26/restaurant-449952_960_720.jpg',
    'https://media.istockphoto.com/photos/homemade-italian-fettuccine-pasta-with-mushrooms-and-cream-sauce-picture-id1161197982?k=20&m=1161197982&s=612x612&w=0&h=C90rcm8qLO3nWWims7TaQ474Fvyu5bS567EXDkS9U9g=',
    'https://cdn.pixabay.com/photo/2020/05/17/04/22/pizza-5179939_960_720.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    double height_ = MediaQuery.of(context).size.height;
    double width_= MediaQuery.of(context).size.width;
        return WillPopScope(
      onWillPop: ()async=>false,
      child: SafeArea(
      child: Scaffold(
            bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            
            onTap: (index){
              if (index==0){
                Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (c, a1, a2) => MyHomePage(),
                  transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                  transitionDuration: const Duration(milliseconds: 100),
                ),
              );
              }
              if(index==1){
                Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (c, a1, a2) => const Menu(),
                  transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                  transitionDuration: const Duration(milliseconds: 100),
                ),
              );
              }
              if(index==2){
                Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (c, a1, a2) =>  const ReserveScreen(),
                  transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                  transitionDuration: const Duration(milliseconds: 100),
                ),
              );

              }
              if(index==3){
                Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (c, a1, a2) =>  ProfilePage(),
                  transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                  transitionDuration: const Duration(milliseconds: 100),
                ),
              );
              }
          },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Menu',
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
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Welcome $name to ResTable..",
            style: TextStyle(
                fontSize: 0.00005 * height_*width_, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: Stack(children: [
          Column(
            children: <Widget>[
              // ignore: avoid_unnecessary_containers
              Container(
                width: double.infinity,
                margin:const EdgeInsets.all(12),
                decoration:const  BoxDecoration(color: Colors.white),
                child: Text(
                  '''Our Restaurant is referred to as a little, simple, yet classy restaurant that serves simple food in a meek environment, it’s a type of a unique restaurant with a casual, yet fast dining experience,offering a high quality of food and service at the same time.
Restable, An idea of a unique and cozy food serving Restaurant that provides a wide variety of elegant meals with tasteful relish and delicious savor, in one of a kind atmosphere, and a humor of special.
                  ''',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 0.017 * height_,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                  child: StaggeredGridView.countBuilder(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 12,
                      itemCount: imageList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: const BoxDecoration(
                              color: Colors.transparent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            child: FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: imageList[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                      staggeredTileBuilder: (index) {
                        return StaggeredTile.count(1, index.isEven ? 1.2 : 1.8);
                      }),
                ),
              ),
            ],
          ),
        ]),
      ),
    ));
  }
}