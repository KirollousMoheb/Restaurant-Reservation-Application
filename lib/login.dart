import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_signup_screen/admin_home.dart';
import 'package:login_signup_screen/home.dart';
import 'package:login_signup_screen/main.dart';
import 'package:login_signup_screen/signup.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passwordObsecured=true;
  String?msg=' ';
final GlobalKey<FormState>_formKey =GlobalKey<FormState>();

 final TextEditingController _emailController =TextEditingController();
// ignore: non_constant_identifier_names
final TextEditingController _PasswordController =TextEditingController();


static Future<User?>loginUsingEmailPassword({required String email,required String password,required BuildContext context})async{
FirebaseAuth auth =FirebaseAuth.instance;
User? user;
try{
  UserCredential userCredential= await auth.signInWithEmailAndPassword(email: email, password: password);
  user = userCredential.user;

}on FirebaseAuthException catch(e){
  if(e.code=="user-not-found"){
    //print("No user found for that email");
  }
}
return user;
}


Widget _buildEmail(){
  return TextFormField(
    controller: _emailController,
    decoration: const InputDecoration(labelText:'Email'),
  
    validator: (String ?value){
      bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!);
      if (value.isEmpty) {
              return '* Required';
            }else if(!emailValid){
                return 'Please Enter a valid E-mail';
            }
            return null;
    },
    onSaved: (String? value){
    },
  );
}

Widget _buildPassword(){
  
  return TextFormField(
    controller: _PasswordController,
    decoration: InputDecoration(labelText:'Password',
    suffixIcon: IconButton(icon:Icon(
      
      passwordObsecured?  Icons.visibility_off:Icons.visibility
     ) ,
    onPressed: (){
      setState(() {
        passwordObsecured=!passwordObsecured;
      });
      
    },
    )
    
    
    ),
   obscureText: passwordObsecured,
    validator: (String ?value){
      if(value!.isEmpty){
        return '* Required';
      }else if(value.length<6){
        return 'Password must be more than 6 characters';
      }else if(value.length>15){
        return 'Password must be less than 15 characters';
      }
      return null;
     
    },
    
    onSaved: (String? value){
    },
  );
}

  @override
  Widget build(BuildContext context) {
   
    var totalWidth = MediaQuery.of(context).size.width;
    var totalHeight = MediaQuery.of(context).size.height;


    User? user;
        return WillPopScope(
      onWillPop: ()async=>false,
    child: Scaffold(
      body:ListView(

        children:[ 
          Row(
            children:  [
              IconButton(
                 
                  icon:const Icon(Icons.arrow_back_ios),
                  onPressed:()=> Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (c, a1, a2) =>const HomePage(showHome: true),
                        transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                        transitionDuration: const Duration(milliseconds: 100),
                      ),
                    )
                ,
                  ),
            ],
          ),
          Container(
        margin:const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget> [
           
            const Text('Login',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
            SizedBox(height: totalHeight*.02),
            const Text('Login to your account',style: TextStyle(fontSize: 16,color: Colors.blue),),
            SizedBox(height: totalHeight*.1),
            _buildEmail(),
            SizedBox(height: totalHeight*.05),
            _buildPassword(),

            SizedBox(height: totalHeight*.18),
            Text(msg!,style:const TextStyle(fontSize: 16,color: Colors.red),),
            SizedBox(height: totalHeight*.03),

            SizedBox(
              width:totalWidth*.7 ,
              height: totalHeight*.08,
              child: RaisedButton( child :const Text('Log in',style:TextStyle(color:Colors.white,fontSize: 20),) ,
           shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
           color: Colors.blue,
              onPressed:()async=>{
                if(!_formKey.currentState!.validate()){
                
                }else{
                User, user =await loginUsingEmailPassword(email: _emailController.text.trim(), password:_PasswordController.text , context: context),
                if(user !=null){
                   // await FirebaseAuth.instance.currentUser!.reload(),                  
                  if( FirebaseAuth.instance.currentUser?.uid.toString()=="0HTMYyh8Xif2JJ3PAn1uNWMk4aU2"){
                      Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (c, a1, a2) => ReservationList(),
                        transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                        transitionDuration: const Duration(milliseconds: 100),
                        
                      ),
                    )
                  }else{
                    
                    if(!FirebaseAuth.instance.currentUser!.emailVerified){

                     setState(() {
                    msg='Please Verify Your E-mail Before Signing in';
                  })
                    }else{
                      Navigator.push(
                      context, 
                      PageRouteBuilder(
                        pageBuilder: (c, a1, a2) =>MyHomePage(),
                        transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                        transitionDuration: const Duration(milliseconds: 100),
                        
                      ),
                    ),
                     setState(() {
                    msg=' ';
                  })
                    }

                  }

                }else{
                  
                 // print('no user found'),
                  setState(() {
                    msg='Incorrect email or password';
                  })
                }
                     
                },
                _formKey.currentState!.save(),
               
              } ),
            ),
             SizedBox(height: totalHeight*.01),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [

                  const Text('Don\'t have an account ?',style: TextStyle(fontSize: 14),),
                  TextButton( child: const Text('Sign up'),
                   onPressed:()=>Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (c, a1, a2) => SignupPage(),
                        transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                        transitionDuration: const Duration(milliseconds: 100),
                      ),
                    ) ,)


             ],)
            
          ],
          )
          ),
      ),
        ]) 
    ));
  }
}