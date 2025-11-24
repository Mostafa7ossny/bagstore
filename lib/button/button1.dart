import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;

class Button1 extends StatelessWidget {
  const Button1({super.key,  required this.name, this.onTap});
  final String? name  ;
    final VoidCallback? onTap;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ,
      child: Container(
        width: 100,
        height: 30,
      
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: const Color.fromARGB(97, 255, 255, 255),
        ),
        child: Text(
          "$name",
          style: GoogleFonts.aboreto(
            fontSize: 14,
            fontWeight: FontWeight.w900,
            color: const Color.fromARGB(235, 109, 51, 4),
          ),
        ),
      ),
    );
  }
}
