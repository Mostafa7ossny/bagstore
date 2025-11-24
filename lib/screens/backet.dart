import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn/model/cart.dart' show Cart;
import 'package:provider/provider.dart';

class Cheakout extends StatefulWidget {
  const Cheakout({super.key});

  @override
  State<Cheakout> createState() => _CheakoutState();
}

class _CheakoutState extends State<Cheakout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 255, 226),
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),

        backgroundColor: const Color.fromARGB(255, 247, 255, 226),
        shadowColor: const Color.fromARGB(255, 236, 232, 190),

        elevation: 15,
        actions: [
          Gap(90),

          Text(
            "Bag Store",
            style: GoogleFonts.allura(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 102, 56, 4),
            ),
          ),
          Gap(65),

          Icon(
            Icons.shopping_cart,
            color: const Color.fromARGB(255, 95, 70, 1),
          ),
          Gap(5),
          Consumer<Cart>(
            builder: (context, Cart, child) {
              return Text("${Cart.totalprice}");
            },
          ),
          Gap(30),
        ],
      ),
      body: Consumer<Cart>(
        builder: (context, cart, child) {
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: cart.backet.length,
            itemBuilder: (context, index) {
              final item = cart.backet[index];

              return Container(
                margin: const EdgeInsets.only(bottom: 15),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(125, 255, 255, 255),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 5, 255, 88).withOpacity(0.15),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        item.photo,
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(width: 15),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.brown[800],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "${item.price}\$",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.brown[600],
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),

                    IconButton(
                      icon: Icon(Icons.remove_circle, color: const Color.fromARGB(255, 143, 15, 6)),
                      onPressed: () {
                        cart.remove(item);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
