import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_signup_screen/home.dart';
import 'package:login_signup_screen/more.dart';
import 'package:login_signup_screen/oder_confirmation.dart';
import 'package:login_signup_screen/reserve.dart';  
  
  int index=1;
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  // It is the root widget of your application.  
  @override  
  Widget build(BuildContext context) {  
    return const MaterialApp(  
       color:  Color(0xff0095FF),  
      home: Menu(title: 'Complex layout example'),  
    );  
  }  
}  

class Menu extends StatefulWidget {  
   const Menu({Key? key, this.title="dehk"}) : super(key: key);  
  final String title;  
    @override
  State<Menu> createState() => _MenuState();
  
}

  class _MenuState extends State<Menu> {

   
      
   
    
  
 
  
  
  
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
          title: const Text("Menu"),
          centerTitle: true,
          automaticallyImplyLeading: false,
          ),  
        
        body: ListView(  
          padding: const EdgeInsets.fromLTRB(3.0, 12.0, 3.0, 12.0),  
          children: <Widget>[  
            
            Item(  
                name: "Sedra",  
                
                   
                  
            ),  
       
            
            
         
          ],  
        )  
    ));  
  }  
}  
  


class Item extends StatefulWidget {  
    Item({Key? key, this.name="Sedra", this.lprice=0 , this.n =0}) : super(key: key);  
  final String name; 
  final int lprice;
   int n; 

  int get myn =>n;
   
    @override

  
  State<Item> createState() => _ItemState();
  
  
}

  class _ItemState extends State<Item> {
    int price = 0;
    final int _macaroniP = 150;
    int _macaroniN = 0;
    final int _FishP = 70;
    int _FishN = 0;
    final int _PizzaP= 85;
    int _PizzaN= 0;
    final int _UmAliP = 22;
    int _UmAliN = 0;
    final int _GateuxP = 12;
    int _GateuxN = 0;
    // ignore: non_constant_identifier_names
    final int _DonutsP = 10;
    int _DonutsN = 0;
    final int _WaterP = 3 ;
    int _WaternN = 0;
    final int _OrangeJuiceP = 10;
    int _OrangeJuiceN =0;
    final int _MilkP = 5;
    int _MilkN = 0;


    


  
  @override
  Widget build(BuildContext context) {  
    
    return Column(children: [   Container(


       padding: const EdgeInsets.all(2), color: Colors.blue,
    height: 50,  
    child: Card(  
        child: Row(  
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,  
            children: <Widget>[  
             
              Expanded(  
                  child: Container(  
                      padding: const EdgeInsets.all(5),  
                      child: Column(  
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,  
                        children: const <Widget>[  
                          Text(  
                              "Main Dish", style: TextStyle(  
                              fontWeight: FontWeight.bold  
                          )  
                          ),  
                           
                        ],  
                      )  
                  )  
              )  
            ]  
        )  
    ) 






    ),
      
      Row(
crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                      children: <Widget>[  


     
      
               
             
              Expanded( child: Container(  
                 alignment: Alignment.topLeft,
                      padding: const EdgeInsets.all(5), 
                       
                      child: Column(  
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,  
                        children: const <Widget>[  
                         
                          Text(  
                              "Macaroni", style: TextStyle(  
                              fontWeight: FontWeight.bold  , fontSize: 20
                          )  
                          ),  
                          
                        ],  
                      )  
                  )  ) ,
                  
                     ElevatedButton(
                       
      style: ElevatedButton.styleFrom(
          shape: const CircleBorder(), 
          padding: const EdgeInsets.all(10)
      ),
      child: const Icon(
        Icons.add,
        size: 11,
      ),
      onPressed: () {

  setState(() {

    _macaroniN++;
    price+=_macaroniP;
    
    });



      },

),        
Text("$_macaroniN"),
 ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: const CircleBorder(), 
          padding: const EdgeInsets.all(10)
      ),
      child: const Icon(
        Icons.remove,
        size: 11,
      ),
      onPressed: (_macaroniN>0)? () {

  setState(() {

    _macaroniN--;
    price-=_macaroniP;
    
    });



      } :null ,
),
                          Text(  
                              "EGP $_macaroniP", style: const TextStyle(  
                              fontWeight: FontWeight.bold  , fontSize: 20
                          )  
                          )
]







    ) ,Row(
      crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,,

      mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                      children: <Widget>[  

     
      
               
             
              Expanded( child: Container(  
                 alignment: Alignment.topLeft,
                      padding: const EdgeInsets.all(5), 
                       
                      child: Column(  
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,  
                        children: const <Widget>[  
                         
                          Text(  
                              "Fish", style: TextStyle(  
                              fontWeight: FontWeight.bold  , fontSize: 20
                          )  
                          ),  
                          
                        ],  
                      )  
                  ) 
                   ) ,


                     ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: const CircleBorder(), 
          padding: const EdgeInsets.all(10)
      ),
      child: const Icon(
        Icons.add,
        size: 11,
      ),
      onPressed: () {

  setState(() { _FishN++;
  price+=_FishP;
    
    });


      },

),  
Text("$_FishN"),

     ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: const CircleBorder(), 
          padding: const EdgeInsets.all(10)
      ),
      child: const Icon(
        Icons.remove,
        size: 11,
      ),
      onPressed: (_FishN>0)? () {

  setState(() {

    _FishN--;
    price-=_FishP;
    
    });



      } :null,
),
                          Text(  
                              "  EGP $_FishP", style: const TextStyle(  
                              fontWeight: FontWeight.bold  , fontSize: 20
                          )  
                          )
]







    ),Row(
      crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,,

      mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                      children: <Widget>[  

     
      
               
             
              Expanded( child: Container(  
                 alignment: Alignment.topLeft,
                      padding: const EdgeInsets.all(5), 
                       
                      child: Column(  
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,  
                        children: const <Widget>[  
                         
                          Text(  
                              "Pizza", style: TextStyle(  
                              fontWeight: FontWeight.bold  , fontSize: 20
                          )  
                          ),  
                          
                        ],  
                      )  
                  )  ) ,
                     ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: const CircleBorder(), 
          padding: const EdgeInsets.all(10)
      ),
      child: const Icon(
        Icons.add,
        size: 11,
      ),
      onPressed: () {

  setState(() { _PizzaN++;
  price+=_PizzaP;
    
    });


      },
), 
Text("$_PizzaN"),

    ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: const CircleBorder(), 
          padding: const EdgeInsets.all(10)
      ),
      child: const Icon(
        Icons.remove,
        size: 11,
      ),
      onPressed: (_PizzaN>0)? () {

  setState(() {

    _PizzaN--;
    price-=_PizzaP;
    
    });



      } :null,
),

                          Text(  
                              "  EGP $_PizzaP", style: const TextStyle(  
                              fontWeight: FontWeight.bold  , fontSize: 20
                          )  
                          )
]







    ),

    Container(

       padding: const EdgeInsets.all(2), color: Colors.blue,
    height: 50,  
    child: Card(  
        child: Row(  
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,  
            children: <Widget>[  
             
              Expanded(  
                  child: Container(  

                      padding: const EdgeInsets.all(5),  
                      child: Column(  
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,  
                        children: const <Widget>[  
                          Text(  
                              "Deserts", style: TextStyle(  
                              fontWeight: FontWeight.bold  
                          )  
                          ),  
                           
                        ],  
                      )  
                  )  
              )  
            ]  
        )  
    ) 






    ),


    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                      children: <Widget>[  

     
      
               
             
              Expanded( child: Container(  
                 alignment: Alignment.topLeft,
                      padding: const EdgeInsets.all(5), 
                       
                      child: Column(  
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,  
                        children: const <Widget>[  
                         
                          Text(  
                              "Um Ali", style: TextStyle(  
                              fontWeight: FontWeight.bold  , fontSize: 20
                          )  
                          ),  
                          
                        ],  
                      )  
                  )  ) ,
                     ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: const CircleBorder(), 
          padding: const EdgeInsets.all(10)
      ),
      child: const Icon(
        Icons.add,
        size: 11,
      ),
      onPressed: () {

  setState(() { _UmAliN++;
  price+=_UmAliP;
    
    });


      },
),      
Text("$_UmAliN"),

   ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: const CircleBorder(), 
          padding: const EdgeInsets.all(10)
      ),
      child: const Icon(
        Icons.remove,
        size: 11,
      ),
      onPressed: (_UmAliN>0)? () {

  setState(() {

    _UmAliN--;
    price-=_UmAliP;
    
    });



      } :null,
),
                          Text(  
                              "  EGP $_UmAliP", style: const TextStyle(  
                              fontWeight: FontWeight.bold  , fontSize: 20
                          )  
                          )
]







    )  , 


    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                      children: <Widget>[  

     
      
               
             
              Expanded( child: Container(  
                 alignment: Alignment.topLeft,
                      padding: const EdgeInsets.all(5), 
                       
                      child: Column(  
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,  
                        children: const <Widget>[  
                         
                          Text(  
                              "Gateux", style: TextStyle(  
                              fontWeight: FontWeight.bold  , fontSize: 20
                          )  
                          ),  
                          
                        ],  
                      )  
                  )  ) ,
                     ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: const CircleBorder(), 
          padding: const EdgeInsets.all(10)
      ),
      child: const Icon(
        Icons.add,
        size: 11,
      ),
      onPressed: () {

  setState(() { _GateuxN++;
  price+=_GateuxP;
    
    });


      },
),  

Text("$_GateuxN"),

       ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: const CircleBorder(), 
          padding: const EdgeInsets.all(10)
      ),
      child: const Icon(
        Icons.remove,
        size: 11,
      ),
      onPressed: (_GateuxN>0)? () {

  setState(() {

    _GateuxN--;
    price-=_GateuxP;
    
    });



      } :null,
),
                          Text(  
                              "  EGP $_GateuxP", style: const TextStyle(  
                              fontWeight: FontWeight.bold  , fontSize: 20
                          )  
                          )
]







    ) ,
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                      children: <Widget>[  

     
      
               
             
              Expanded( child: Container(  
                 alignment: Alignment.topLeft,
                      padding: const  EdgeInsets.all(5), 
                       
                      child: Column(  
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,  
                        children: const <Widget>[  
                         
                          Text(  
                              "Donuts ", style: TextStyle(  
                              fontWeight: FontWeight.bold  , fontSize: 20
                          )  
                          ),  
                          
                        ],  
                      )  
                  )  ) ,
                     ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: const CircleBorder(), 
          padding: const EdgeInsets.all(10)
      ),
      child: const Icon(
        Icons.add,
        size: 11,
      ),
      onPressed: () {

  setState(() { _DonutsN++;
  price+=_DonutsP;
    
    });


      },
),    
Text("$_DonutsN"),

     ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: const CircleBorder(), 
          padding: const EdgeInsets.all(10)
      ),
      child: const Icon(
        Icons.remove,
        size: 11,
      ),
      onPressed: (_DonutsN>0)? () {

  setState(() {

    _DonutsN--;
    price-=_DonutsP;
    
    });



      } :null,
),
                          Text(  
                              "  EGP $_DonutsP", style: const TextStyle(  
                              fontWeight: FontWeight.bold  , fontSize: 20
                          )  
                          )
,]







    ) ,


    Container(

       padding: const EdgeInsets.all(2), color: Colors.blue,
    height: 50,  
    child: Card(  
        child: Row(  
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,  
            children: <Widget>[  
             
              Expanded(  
                  child: Container(  
                      padding: const EdgeInsets.all(5),  
                      child: Column(  
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,  
                        children: const <Widget>[  
                          Text(  
                              "Drinks", style: TextStyle(  
                              fontWeight: FontWeight.bold  
                          )  
                          ),  
                           
                        ],  
                      )  
                  )  
              )  
            ]  
        )  
    ) 






    ) ,

    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                      children: <Widget>[  

     
      
               
             
              Expanded( child: Container(  
                 alignment: Alignment.topLeft,
                      padding: const EdgeInsets.all(5), 
                       
                      child: Column(  
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,  
                        children: const <Widget>[  
                         
                          Text(  
                              "Water", style: TextStyle(  
                              fontWeight: FontWeight.bold  , fontSize: 20
                          )  
                          ),  
                          
                        ],  
                      )  
                  )  ) ,
                     ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: const CircleBorder(), 
          padding: const EdgeInsets.all(10)
      ),
      child: const Icon(
        Icons.add,
        size: 11,
      ),
      onPressed: () {

  setState(() { _WaternN++;
  price+=_WaterP;
    
    });


      },
),      
Text("$_WaternN"),

   ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: const CircleBorder(), 
          padding: const EdgeInsets.all(10)
      ),
      child: const Icon(
        Icons.remove,
        size: 11,
      ),
      onPressed: (_WaternN>0)? () {

  setState(() {

    _WaternN--;
    price-=_WaterP;
    
    });



      } :null,
),
                          Text(  
                              "    EGP $_WaterP", style: const TextStyle(  
                              fontWeight: FontWeight.bold  , fontSize: 20
                          )  
                          )
]







    ) ,


    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                      children: <Widget>[   
                        

     
      
               
             
              Expanded( child: Container(  
                 alignment: Alignment.topLeft,
                      padding: const EdgeInsets.all(5), 
                       
                      child: Column(  
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,  
                        children: const <Widget>[  
                         
                          Text(  
                              "Orange Juice", style: TextStyle(  
                              fontWeight: FontWeight.bold  , fontSize: 20
                          )  
                          ),  
                          
                        ],  
                      )  
                  )  ) ,
                     ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: const CircleBorder(), 
          padding: const EdgeInsets.all(10)
      ),
      child: const Icon(
        Icons.add,
        size: 11,
      ),
      onPressed: () {

  setState(() { _OrangeJuiceN++;
  price+=_OrangeJuiceP;
    
    });


      },
),    
Text("$_OrangeJuiceN"),

     ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: const CircleBorder(), 
          padding: const EdgeInsets.all(10)
      ),
      child: const Icon(
        Icons.remove,
        size: 11,
      ),
      onPressed: (_OrangeJuiceN>0)? () {

  setState(() {

    _OrangeJuiceN--;
    price-=_OrangeJuiceP;
    
    });



      } :null,
),                              Text(  
                              "  EGP $_OrangeJuiceP", style: const TextStyle(  
                              fontWeight: FontWeight.bold  , fontSize: 20
                          )  
                          )
]







    ) , Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                      children: <Widget>[  

     
      
               
             
              Expanded( child: Container(  
                  alignment: Alignment.topLeft,

                      padding: const EdgeInsets.all(5), 
                       
                      child: Column(  
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,  
                        children: const <Widget>[  
                         
                          Text(  
                              "Milk", 
                              
                              style: TextStyle(  
                              fontWeight: FontWeight.bold , fontSize: 20
                          )  
                          ),  
                          
                        ],  
                      )  
                  )  ) ,
                     ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: const CircleBorder(), 
          padding: const EdgeInsets.all(10)
      ),
      child: const Icon(
        Icons.add,
        size: 11,
      ),
      onPressed: () {

  setState(() { _MilkN++;
  price+=_MilkP;
    
    });


      },
),    

Text("$_MilkN"),

     ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: const CircleBorder(), 
          padding: const EdgeInsets.all(10)
      ),
      child: const Icon(
        Icons.remove,
        size: 11,
      ),
      onPressed: (_MilkN>0)? () {

  setState(() {

    _MilkN--;
    price-=_MilkP;
    
    });



      } :null,
),
                          Text(  
                              "    EGP $_MilkP", style: const TextStyle(  
                              fontWeight: FontWeight.bold  , fontSize: 20
                          )  
                          )
]







    ) ,






     
      Text(
           
          'Total Price : $price ',
          style: const TextStyle(fontSize: 25 )  ,
          
         
        ),MaterialButton(
                minWidth: double.infinity,
                height: 60,
                onPressed: () async {
                    var name,number;
                    final _auth = FirebaseAuth.instance;

                      String? currentUser=_auth.currentUser?.uid.toString();

                        var collection = FirebaseFirestore.instance.collection('UserData');

                    var docSnapshot = await collection.doc(currentUser).get();
                    if (docSnapshot.exists) {
                      Map<String, dynamic>? data = docSnapshot.data();
                      
                       name = data?['Full Name']; // <-- The value you want to retrieve.
                        number = data?['Phone Number']; // <-- The value you want to retrieve.

                }                       
                 FirebaseFirestore.instance.collection('Orders').add(
                          {
                          'userID':currentUser,
                          'Phone':number,
                          'Macaroni':_macaroniN,
                          'Fish':_FishN,
                          'Pizza':_PizzaN,
                          'Um Ali':_UmAliN,
                          'Gateux':_GateuxN,
                          'Donuts':_DonutsN,
                          'Water':_WaternN,
                          'Orange Juice':_OrangeJuiceN,
                          'Milk':_MilkN,
                          'Name':name,
                          'Total Price':price

                       
                          }
                          );

Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  const OrderConfirmationScreenScreen()));



                },
                color: const Color(0xff0095FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)
                ),
                child: const Text(
                  "Order",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18
                  ),
                ),
              )
     
     
     
     ],

    
    );  
  }
  }