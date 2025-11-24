import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List<Color> productColors = [
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.black,

];

class ColorSelector extends StatefulWidget {
  const ColorSelector({super.key});

  @override
  State<ColorSelector> createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  Color selectedColor = Colors.red; // اللون الافتراضي

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Choose a Color : ",
          style: GoogleFonts.actor(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Row(
          children: productColors.map((color) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedColor = color; // تحديث اللون المختار
                });
              },
              child: Container(
                margin: EdgeInsets.only(right: 10),
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: selectedColor == color ? Colors.black : Colors.transparent,
                    width: 3,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
