import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_signup_screen/confirmation_screen.dart';
import 'package:login_signup_screen/home.dart';
import 'package:login_signup_screen/menu.dart';
import 'package:login_signup_screen/more.dart';
import 'package:number_inc_dec/number_inc_dec.dart';





int index=2;

class ReserveScreen extends StatefulWidget {

  const ReserveScreen({Key? key}) : super(key: key);

  @override
  _ReserveScreenState createState() => _ReserveScreenState();
}

class _ReserveScreenState extends State<ReserveScreen> {
  String _selectedFloor= 'floor 1 ';
  String n ='1';

  // ignore: non_constant_identifier_names
  final List<String> _Time = ["8 AM", "9 AM", "10 AM", "11 AM","12 PM","1 PM","2 PM","3 PM","4 PM" , "5 PM", "6 PM","7 PM","8 PM","9 PM"];
  // ignore: non_constant_identifier_names
  final List<String> _Days = ["Saturday", "Monday", "Tuesday", "Wednesday","Friday"];
  String? _selectedTime='8 AM';
  String? _selectedDay='Saturday';
  // Generating a long list to fill the ListView
  final List<Map> data = List.generate(3,
          (index) => {'id': index, 'name': 'Floor $index', 'isSelected': false});



  @override
  Widget build(BuildContext context) {
        return WillPopScope(
      onWillPop: ()async=>false,
    child:  Scaffold(

                  bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            
            onTap: (index){
              if (index==0){
                Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (c, a1, a2) =>  MyHomePage(),
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
        appBar: AppBar(
                    automaticallyImplyLeading: false,

            centerTitle: true,
            title: const Text('Book a Table '
            )

        ),
        body:SingleChildScrollView(child:

        Container (
            alignment: Alignment.center,
            decoration:  BoxDecoration(
              image: DecorationImage(
                colorFilter:  ColorFilter.mode( Colors.black.withOpacity(0.3), BlendMode.dstATop),
                image:const NetworkImage(
                    'https://media-cdn.tripadvisor.com/media/photo-w/13/48/dd/f7/newly-refurbished-in.jpg'),
                fit: BoxFit.cover,
                repeat: ImageRepeat.noRepeat,
              ),
            ),
            padding: const EdgeInsets.all(25),
            child: Column(

                children:<Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      const Text('Choose your favorite floor', style: TextStyle(fontSize: 18,color:Colors.black,fontWeight: FontWeight.w700),),
                      ListTile(
                        leading: Radio<String>(
                          value: 'floor 1',

                          groupValue: _selectedFloor,
                          onChanged: (value) {
                            setState(() {
                              _selectedFloor = value!;
                            });
                          },
                        ),
                        title: const Text('Floor 1',style: TextStyle(color:Colors.black,fontWeight: FontWeight.w700)),
                      ),
                      ListTile(
                        leading: Radio<String>(
                          value: 'floor 2',

                          groupValue: _selectedFloor,
                          onChanged: (value) {
                            setState(() {
                              _selectedFloor = value!;
                            });
                          },
                        ),
                        title: const Text('Floor 2  ',style: TextStyle(color:Colors.black,fontWeight: FontWeight.w700)),
                      ),
                      ListTile(
                        leading: Radio<String>(
                          value: 'roof',
                          groupValue: _selectedFloor,
                          onChanged: (value) {
                            setState(() {
                              _selectedFloor = value!;
                            });
                          },
                        ),
                        title: const Text('Roof ',style: TextStyle(color:Colors.black,fontWeight: FontWeight.w700)),
                      ),
                      const SizedBox(height: 25),

                    ],
                  ),

                  const SizedBox(height: 10),
                  Row(

                      children:const [
                         Text('Number of persons on the table ', style: TextStyle(fontSize: 18,color:Colors.black, fontWeight: FontWeight.w700),textAlign: TextAlign.left),

                      ]
                  ),
                  const  SizedBox(height: 5),

                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        
                        child: NumberInputWithIncrementDecrement(

                          onChanged: (newValue) {
                            n=newValue.toString();
                          },

                          onIncrement: (num newlyIncrementedValue) {
                            n=newlyIncrementedValue.toString() ;
                           // print('Newly incremented value is $newlyIncrementedValue');
                          },
                          onDecrement: (num newlyDecrementedValue) {
                          n=newlyDecrementedValue.toString() ;

                            //print('Newly decremented value is $newlyDecrementedValue');
                          },
                          controller: TextEditingController(),
                          min: 1,
                          max: 10,
                        ),
                      ),

                      const Spacer(
                        flex: 2,
                      )
                    ],
                  ),

                  const SizedBox(height: 40),
                  Column (
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children :[

                        Container(
                          width: 300,
                          padding:const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(30)),
                          child: DropdownButton<String>(
                            onChanged: (value) {
                              setState(() {
                                _selectedDay = value;
                              });
                            },
                            value: _selectedDay,

                            // Hide the default underline
                            underline: Container(),
                            hint:const  Center(
                                child: Text(
                                  'Select your day  ',
                                  style: TextStyle(color: Colors.white),
                                )),
                            icon:const  Icon(
                              Icons.arrow_downward,
                              color: Colors.yellow,
                            ),
                            isExpanded: true,

                            // The list of options
                            items: _Days
                                .map((e) => DropdownMenuItem(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  e,
                                  style:const TextStyle(fontSize: 18),
                                ),
                              ),
                              value: e,
                            ))
                                .toList(),


                            selectedItemBuilder: (BuildContext context) => _Days
                                .map((e) => Center(
                              child: Text(
                                e,
                                style:const TextStyle(
                                    fontSize: 18,
                                    color: Colors.amber,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold),
                              ),
                            ))
                                .toList(),
                          ),
                        ),
                        const SizedBox(height: 50),
                        Container(
                          width: 300,
                          padding:const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(30)),
                          child: DropdownButton<String>(
                            onChanged: (value) {
                              setState(() {
                                _selectedTime = value;
                              });
                            },
                            value: _selectedTime,


                            underline: Container(),
                            hint:const  Center(
                                child: Text(
                                  'Select your time slot ',
                                  style: TextStyle(color: Colors.white,),
                                )),
                            icon:const  Icon(
                              Icons.arrow_downward,
                              color: Colors.yellow,
                            ),
                            isExpanded: true,


                            items: _Time
                                .map((e) => DropdownMenuItem(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  e,
                                  style:const TextStyle(fontSize: 18),
                                ),
                              ),
                              value: e,
                            ))
                                .toList(),


                            selectedItemBuilder: (BuildContext context) => _Time
                                .map((e) => Center(
                              child: Text(
                                e,
                                style:const TextStyle(
                                    fontSize: 18,
                                    color: Colors.amber,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold),
                              ),
                            ))
                                .toList(),
                          ),
                        ),


                      ]),
                  const SizedBox(height: 50),

                  MaterialButton(
                    minWidth: 100.0,
                    //double.infinity,
                    height: 60,
                    onPressed: () async {
                    var username,name,number;
                    final _auth = FirebaseAuth.instance;

                      String? currentUser=_auth.currentUser?.uid.toString();

                        var collection = FirebaseFirestore.instance.collection('UserData');

                    var docSnapshot = await collection.doc(currentUser).get();
                    if (docSnapshot.exists) {
                      Map<String, dynamic>? data = docSnapshot.data();
                      
                       username = data?['username']; // <-- The value you want to retrieve.
                                              name = data?['Full Name']; // <-- The value you want to retrieve.

                       number = data?['Phone Number']; // <-- The value you want to retrieve.

                }                       
                 FirebaseFirestore.instance.collection('ReservationData').add(
                          {'time':_selectedTime,
                          'date':_selectedDay,
                          'username':username,
                          'persons':n,
                          'userID':currentUser,
                          'Floor':_selectedFloor,
                          'Name':name,
                          'Phone':number,

                          }
                          );








                      Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (c, a1, a2) =>  ConfirmationScreen(_selectedFloor,_selectedTime!,_selectedDay!,n),
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
                      "Book Now!",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),
                    ),
                  ),
                                    const SizedBox(height: 30),

                ] )

        ),


        )
    ));
  }
}

class CustomTextField extends StatelessWidget {


  const CustomTextField({Key? key, required this .onChanged , required this.hint}) : super(key: key);

  final Function onChanged;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(


        style:const TextStyle(fontSize: 18),
        decoration: InputDecoration(
            contentPadding:const EdgeInsets.symmetric(horizontal: 20),
            filled: true,
            fillColor: Colors.black12,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(18)),


            hintText: hint,
            helperText: 'Keep it Short'),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {


  const CustomButton({Key? key, required this.onTap, required this.symbol}) : super(key: key);


  final String symbol;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(


        child: Container(
          height: 60,
          width: 60,
          decoration:const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blueGrey,
          ),
          child: Center(
            child: Text(

              symbol,
              style:const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
    );
  }
}