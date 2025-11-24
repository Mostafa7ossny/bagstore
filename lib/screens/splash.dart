import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn/screens/homescreen.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
    
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Homescreen()),
      );
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  const Color.fromARGB(255, 255, 234, 164),
      body: Stack(
        children: [
          // Container(
          //   padding: EdgeInsets.only(left: 80),
          //   child: LottieBuilder.asset(
          //     "assets/splash/Christmas wind chimes.json",
          //     width: 350,
          //   ),
          // ),
          // LottieBuilder.asset("assets/splash/Snowing.json",width: 300,),
          Column(
            children: [
              Gap(170),
              Container(
                child: LottieBuilder.asset("assets/splash/shapbag.json"),
              ),
              Container(
                child: Text(
                  "bag store",
                  style: GoogleFonts.poorStory(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromARGB(255, 238, 68, 122),
                  ),
                ),
              ),
              // Gap(100),
              // Container(
              //   width: 80,
              //   height: 50,

              //   alignment: Alignment.center,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(14),
              //     color: const Color.fromARGB(255, 238, 168, 56),
              //   ),
              //   child: Text(
              //     "Go",
              //     style: GoogleFonts.anybody(
              //       fontSize: 28,
              //       fontWeight: FontWeight.w500,
              //       color: const Color.fromARGB(255, 248, 18, 152) ,
              //     ),
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
