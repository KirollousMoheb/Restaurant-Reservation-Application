import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login_signup_screen/login.dart';
import 'package:login_signup_screen/main.dart';

  final _auth = FirebaseAuth.instance;
  String email = '';
  String pass = '';
  String name='';
  String phone='';
  String username='';
   String pusername='';
 String pemail='';

    TextEditingController password=TextEditingController() ;
  TextEditingController confirmpassword =TextEditingController() ;
// ignore: avoid_relative_lib_imports
// ignore: must_be_immutable
class SignupPage extends StatelessWidget {
   SignupPage({Key? key}) : super(key: key);
  // ignore: unused_field
  final _formkey=GlobalKey<FormState>();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  int index=1;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async=>false,
 
    child: Scaffold(

      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const HomePage(showHome: true,)));
          },
          icon: const Icon(Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,),


        ), systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        child:  Form 
        (key:_formkey,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height+20,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Text("Sign up",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,

                  ),),
                  const SizedBox(height: 20,),
                  Text("Create an account, It's free ",
                    style: TextStyle(
                        fontSize: 15,
                        color:Colors.grey[700]),)


                ],
              ),
              Column(
               
                children: <Widget>[
                  inputFile(label: "Username"),
                  inputFile(label: "Full Name"),
                  inputFile(label: "Email"),
                  inputFile(label: "Phone Number"),

                  inputFile(control:password ,label: "Password", obscureText: true),
                  inputFile(control:confirmpassword,label: "Confirm Password ", obscureText: true),
                  
                   MaterialButton(

                     minWidth: double.infinity,
                     height: 50,
                  onPressed: ()async{
                   if (!_formkey.currentState!.validate()) {
                      return;
                   }else{
                     try{

                       
                         await _auth.createUserWithEmailAndPassword(email: email, password: pass);

                         final user=_auth.currentUser;
                        await user?.sendEmailVerification();


                      String? currentUser=_auth.currentUser?.uid.toString();
                        FirebaseFirestore.instance.collection('UserData').doc(currentUser).set(
                          {'uid':currentUser,
                          'email':email,
                          'username':username,
                          'Full Name':name,
                          'Phone Number':phone

                          }
                          );


                       showDialog(
  
                          context: context,
                        builder: (ctx) => const AlertDialog(
                          title:
                              Text('Thanks For Your Registeration!'),
                         ));



                      Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (c, a1, a2) =>const LoginScreen (),
                        transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                        transitionDuration: const Duration(milliseconds: 100),
                      ),
                    );
   
                                    
                     }on FirebaseAuthException catch (e){
                       showDialog(
  
                          context: context,
                        builder: (ctx) => AlertDialog(
                          title:
                              const Text(' Ops! Registration Failed'),
                          content: Text('${e.message}')));
                     }
                   }

                  },
                  color: const Color(0xff0095FF),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),

                  ),
                  child: const Text(
                    "Sign up", style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.white,

                  ),
                  ),

                ),
             Row(
                                mainAxisAlignment: MainAxisAlignment.center,


                children:  <Widget>[
                const Text("Already have an account?"),
                 
                TextButton(
                  onPressed: () {
                     //Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomePage()));
                      Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (c, a1, a2) =>const LoginScreen(),
                        transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                        transitionDuration: const Duration(milliseconds: 100),
                      ),
                    );
                    //action
                  },
                  child: const Text(" Login", style:TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18
                  ),
                  
              ),
              
              
                  )
                  
                ],

              ),


                ],
              ),


 



            ],

          ),
          


        ),),

      ),

    ));
  }
}



// we will be creating a widget for text field
Widget inputFile({control,label, obscureText = false})
{

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color:Colors.black87
        ),

      ),
      const SizedBox(
        height: 5,
      ),
      TextFormField(
        onChanged:(value){
        if(label=="Email"){
          email = value.toString().trim();
        }else if(label=="Password"){
          pass=value;
        }else if(label=="Username"){
          username=value;
        }else if(label=="Full Name"){
          name=value;

        }else if(label=="Phone Number"){
          phone=value;
        }
          
        },
         
        validator: (value) {
          
          if(label=="Username"){
            
            if (value == null || value.isEmpty) {
              return '* Required';
            }else if (value.length < 6) {
              return "Username should be at least 6 characters";
            } else if (value.length > 9) {
              return "Username should be less than 9 characters";
            }
            return null;
          }
          else if(label=="Phone Number"){
            if(value == null || value.isEmpty){
              return '* Required';

            }else if(value.length!=11){
              return "Phone number must be 11 number";

            }
          }
            if(label=="Full Name"){
            
            if (value == null || value.isEmpty) {
              return '* Required';
            } 
            return null;
          }
          else if(label=="Email"){
            bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!);

            if (value.isEmpty) {
              return '* Required';
            }else if(!emailValid){
                return 'Please Enter a valid E-mail';
            }
            return null;

          }
          
          else if(label=="Password"){
            password=control;
            if (value == null || value.isEmpty) {
              return '* Required';
            }else if (value.length < 6) {
              return "Password should be at least 6 characters";
            } else if (value.length > 15) {
              return "Password should not be greater than 15 characters";
            }
            return null;

          }
          
          else if(label=="Confirm Password "){
            confirmpassword=control;
            if (value == null || value.isEmpty) {
              return '* Required';
            }else if(password.text!=confirmpassword.text){
              return 'Password Doesnt Match';
            }
            return null;
          }
          return null;
          

      },
        keyboardType: label=="Phone Number"?TextInputType.number: label=="Email"?TextInputType.emailAddress:TextInputType.text,
        controller: control,
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 0,
                horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey[400]!
              ),

            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400]!)
            )
        ),
      ),

      const SizedBox(height: 10,)
    ],
  );
}