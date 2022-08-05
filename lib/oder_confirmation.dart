import 'package:flutter/material.dart';
import 'package:login_signup_screen/home.dart';
import 'package:login_signup_screen/reserve.dart';


class OrderConfirmationScreenScreen extends StatelessWidget {

  const OrderConfirmationScreenScreen(
     
      {Key? key})
      : super(key: key);
  Row buildBodyPortrait(BuildContext ctx) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 0.0, bottom: 20.0, left: 50, right: 50),
                        child: Container(
                          color: Colors.transparent,
                          child: Image.asset(
                            'assets/check.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        //height: 0.3 * MediaQuery.of(context).size.height,
                        color: Colors.transparent,
                        child: const Text("Succesful Order!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        //height: 0.3 * MediaQuery.of(context).size.height,
                        color: Colors.transparent,
                        child:const Text(
                          "Your Order has been Sent to the Chef Successfuly.\n Thanks For using ResTable.",
                          textAlign: TextAlign.center,
                          style:  TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontFamily: 'Times new Roman',
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(children: [
                  Expanded(
                    child: Container(
                      height: 60,
                      color: Colors.transparent,
                      child: MaterialButton(
                        onPressed: () {
Navigator.of(ctx).push(MaterialPageRoute(builder: (context) =>const ReserveScreen()));
},
                        // defining the shape
                        color: const Color(0xff0095FF),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        child: const Text(
                          "Book a Table",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ]),
                const SizedBox(height: 30),

                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 60,
                        color: Colors.transparent,
                        child: MaterialButton(
                          onPressed: () {
Navigator.of(ctx).push(MaterialPageRoute(builder: (context) =>  MyHomePage()));
                          },
                          // // defining the shape
                          color: const Color.fromARGB(255, 255, 255, 255),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          child: const Text(
                            "Home",
                            style: TextStyle(
                                color: Color(0xff0095FF),
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Row buildBodyLandscape(BuildContext ctx) {
    return Row(
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 0.0, bottom: 10.0, left: 75, right: 75),
                      child: Container(
                        color: Colors.transparent,
                        child: Image.asset(
                          'assets/check.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      //height: 0.3 * MediaQuery.of(context).size.height,
                      color: Colors.transparent,
                      child: const Text("Successful Order!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 23,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      //height: 0.3 * MediaQuery.of(context).size.height,
                      color: Colors.transparent,
                      child:const Text(
                        "Your Order has been Sent to the Chef Successfuly.\n Thanks For using ResTable.",
                        textAlign: TextAlign.center,
                        style:  TextStyle(
                            fontSize: 19,
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontFamily: 'Times new Roman',
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(children: [
                  Expanded(
                    child: Container(
                      height: 60,
                      color: Colors.transparent,
                      child: MaterialButton(
                        onPressed: () {
Navigator.of(ctx).push(MaterialPageRoute(builder: (context) =>const ReserveScreen()));
},
                        // defining the shape
                        color: const Color(0xff0095FF),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        child: const Text(
                          "Book a Table",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ]),
                const SizedBox(height: 60),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 60,
                        color: Colors.transparent,
                        child: MaterialButton(
                          onPressed: () {
Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => MyHomePage()));
                          },
                          // // defining the shape
                          color: const Color.fromARGB(255, 255, 255, 255),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          child: const Text(
                            "Home",
                            style: TextStyle(
                                color: Color(0xff0095FF),
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
              return WillPopScope(
      onWillPop: ()async=>false,
      child: Scaffold(
        body: buildBodyPortrait(context),
      ));
    }
            return WillPopScope(
      onWillPop: ()async=>false,
      child: Scaffold(
      body: buildBodyLandscape(context),
    ));
  }
}