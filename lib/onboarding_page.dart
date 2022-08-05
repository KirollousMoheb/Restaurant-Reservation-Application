import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:introduction_screen/introduction_screen.dart';
import 'package:login_signup_screen/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
  int isLastPage=0;

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'Reserve your Table Anytime,Anywhere',
              body: 'Book your table at your prefered date and time',
              image: buildImage('assets/reserve.jpg'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Order Food',
              body: 'Hate waiting for Food? Order your Food to be ready along with your table so you won\'t have to wait ',
              image: buildImage('assets/order.jpg'),
              decoration: getPageDecoration(),
            )
            ,
            PageViewModel(
              title: 'Quality Food',
              body: 'Life’s too short for boring Food,We present Food with the Best Qualities',
              

              image: buildImage('assets/quality.png'),
              decoration: getPageDecoration(),
              
            ),
          ],
          
          done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
          onDone: () async {
            final prefs=await SharedPreferences.getInstance();
            prefs.setBool('showHome', true);
            goToHome(context);
          } ,
          showSkipButton: true,
          skip:const Text('Skip'),
          onSkip: () async{
            final prefs=await SharedPreferences.getInstance();
            prefs.setBool('showHome', true);
            goToHome(context);
          } ,
          next:const Icon(Icons.arrow_forward),
          dotsDecorator: getDotDecoration(),
          onChange: (index) {

          },
          globalBackgroundColor: Theme.of(context).primaryColor,
          skipFlex: 0,
          nextFlex: 0,

        ),
      );

  void goToHome(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const HomePage(showHome: true)),
      );

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 350));

  DotsDecorator getDotDecoration() => DotsDecorator(
        color:const Color(0xFFBDBDBD),
        size:const Size(10, 10),
        activeSize:const Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle:const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        bodyTextStyle:const TextStyle(fontSize: 20),
        descriptionPadding:const EdgeInsets.all(16).copyWith(bottom: 0),
        imagePadding:const EdgeInsets.all(24),
        pageColor: Colors.white,
      );
}