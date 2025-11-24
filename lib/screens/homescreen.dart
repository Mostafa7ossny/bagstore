import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn/button/button1.dart';
import 'package:learn/model/cart.dart';
import 'package:learn/screens/ProductGrid.dart';
import 'package:learn/screens/backet.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => model(),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(239, 249, 255, 221),
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),

          backgroundColor: const Color.fromARGB(238, 245, 255, 200),
          shadowColor: const Color.fromARGB(255, 255, 230, 177),

          elevation: 15,
          actions: [
            Icon(
              Icons.menu,
              size: 32,
              color: const Color.fromARGB(255, 94, 64, 8),
            ),
            Gap(85),
            Text(
              "Bag Store",
              style: GoogleFonts.allura(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 94, 64, 8),
              ),
            ),
            Gap(78),
            Consumer<Cart>(
              builder: (context, cart, child) {
                return IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Cheakout()),
                    );
                  },
                  icon: Icon(
                    Icons.shopping_bag_outlined,
                    size: 32,
                    color: const Color.fromARGB(255, 94, 64, 8),
                  ),
                );
              },
            ),

            Gap(20),
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,

          child: Column(
            children: [
              Consumer<model>(
                builder: (context, model, child) {
                  return Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 18, top: 30),
                        alignment: Alignment.topLeft,
                        child: Text(
                          model.type,
                          style: GoogleFonts.aboreto(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 95, 44, 3),
                          ),
                        ),
                      ),
                      Gap(model.gapp),

                      Container(
                        padding: EdgeInsets.only(top: 35, right: 5),
                        child: Text(
                          "Tap to change >",
                          style: GoogleFonts.aBeeZee(
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(129, 71, 39, 1),
                          ),
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.only(top: 30),
                        child: InkWell(
                          onTap: () {
                            model.changetype();
                          },
                          child: Icon(
                            model.type == "WOMEN" ? Icons.female : Icons.male,
                            size: 30,
                            color: const Color.fromARGB(255, 65, 35, 1),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              Gap(15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Gap(16),
                    Button1(name: "Hand Bag"),
                    Gap(5),
                    Button1(name: "Dresses"),
                    Gap(5),
                    Button1(name: "foot wear"),
                    Gap(5),
                    Button1(name: "jewellery"),
                    Gap(5),
                  ],
                ),
              ),
              Gap(15),
              ProductGrid(),
            ],
          ),
        ),
      ),
    );
  }
}

class model extends ChangeNotifier {
  String type = "WOMEN";
  double gapp = 100;
  changetype() {
    if (type == "WOMEN") {
      type = "MAN";
      gapp = 140;
    } else {
      type = "WOMEN";
      gapp = 90;
    }

    notifyListeners();
  }
}
