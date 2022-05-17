import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constract.dart';
import 'view/homescreen.dart';
import 'package:page_transition/page_transition.dart';
void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EYE PLAY',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.robotoCondensedTextTheme(Theme.of(context).textTheme),
        // primarySwatch: Colors.red,
        backgroundColor: backgorundBody,
      ),
      home:  AnimatedSplashScreen(
        splash: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/splash.gif"),
                  fit: BoxFit.cover
              )
          ),
        ),
        nextScreen: HomeScreen(),
        splashIconSize: double.infinity,
        splashTransition: SplashTransition.fadeTransition,
        duration: 5000,
        pageTransitionType: PageTransitionType.bottomToTop,
      ),
    );
  }
}
