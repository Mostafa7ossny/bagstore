import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn/model/color.dart';
import 'package:learn/model/item.dart';
import 'package:learn/screens/backet.dart';
import 'package:learn/screens/buy.dart';
import 'package:learn/model/cart.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  final Item item1;

  const ProductDetails({super.key, required this.item1});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 222, 232),
      appBar: AppBar(
        // shape: const RoundedRectangleBorder(
        //   borderRadius: BorderRadius.only(
        //     bottomLeft: Radius.circular(40),
        //     bottomRight: Radius.circular(40),
        //   ),
        // ),
        backgroundColor: const Color.fromARGB(255, 255, 222, 232),
        // shadowColor: const Color.fromARGB(255, 68, 5, 5),

        // elevation: 15,
      ),
      body: Stack(
        children: [
          Positioned(
            bottom: -50,
            left: 0,
            right: 0,
            child: Container(
              height: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: const Color.fromARGB(211, 255, 255, 255),
              ),
            ),
          ),
          Positioned(
            right: 10,
            bottom: 350,

            child: Image.asset(widget.item1.photo, height: 260),
          ),
          Positioned(
            top: 10,
            left: 15,
            child: Text(
              "Women fashion",
              style: GoogleFonts.livvic(fontSize: 20),
            ),
          ),
          // Positioned(
          //   top: 17,
          //   left: 10,
          //   child: Icon(Icons.crisis_alert_outlined, size: 15),
          // ),
          Positioned(
            top: 35,
            left: 15,
            child: Text(
              widget.item1.title,
              style: GoogleFonts.alexandria(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            bottom: 470,
            left: 30,
            child: Text(
              "\$ ${widget.item1.price} ",
              style: GoogleFonts.oswald(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
          Positioned(
            top: 330,
            left: 20,
            child: Container(child: ColorSelector()),
          ),
          Positioned(
            bottom: 80,
            right: 20,
            child: Container(
              alignment: Alignment.center,
              height: 45,
              width: 280,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: const Color.fromARGB(255, 158, 55, 86),
              ),
              child: InkWell(
                onTap: () {
                  
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PaymentHomePage()),
                  );
                },
                child: Container(
                  child: Text(
                    "Buy Now",
                    style: GoogleFonts.anekLatin(
                      fontSize: 25,
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 80,
            left: 20,
            child: Container(
              alignment: Alignment.center,
              height: 43,
              width: 50,
              decoration: BoxDecoration(
                border: BoxBorder.all(
                  color: const Color.fromARGB(255, 253, 140, 174),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Consumer<Cart>(
                builder: (context, cart1, child) {
                  return IconButton(
                    onPressed: () {
                      cart1.add(widget.item1);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Cheakout()),
                      );
                    },
                    icon: Icon(Icons.shopping_cart),
                  );
                },
              ),
            ),
          ),

          Positioned(
            bottom: 190,
            left: 10,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(right: 300),
                  child: Text("Description"),
                ),
                Text(
                  softWrap: true,
                  widget.item1.det,
                  style: GoogleFonts.alata(fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




















































// import 'package:flutter/material.dart';
// import 'package:learn/model/item.dart';

// class ProductDetails extends StatelessWidget {
//   final Item item;

//   const ProductDetails({super.key, required this.item});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
      
//       appBar: AppBar(
//         title: Text(item.title),
//         backgroundColor: Colors.brown[200],
//         elevation: 0,
//       ),

//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [

//             // ------------------ ألبوم الصور ------------------
//             SizedBox(
//               height: 300,
//               child: PageView(
//                 children: [
//                   Image.asset(item.photo, fit: BoxFit.cover),
//                   Image.asset(item.photo, fit: BoxFit.cover),
//                   Image.asset(item.photo, fit: BoxFit.cover),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 20),

//             // ------------------ العنوان و السعر ------------------
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [

//                   Text(
//                     item.title,
//                     style: const TextStyle(
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),

//                   const SizedBox(height: 10),

//                   Text(
//                     "${item.price} EGP",
//                     style: const TextStyle(
//                       fontSize: 22,
//                       color: Colors.brown,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),

//                   const SizedBox(height: 20),

//                   // ------------------ الأقسام (بدون مقاسات) ------------------
//                   // buildSection("Color", item.color ?? "Brown"),
//                   // buildSection("Material", item.material ?? "Leather"),
//                   // buildSection("Category", item.category ?? "Hand Bag"),
//                   // buildSection("Brand", item.brand ?? "Unknown"),

//                   const SizedBox(height: 25),

//                   // ------------------ الوصف ------------------
//                   const Text(
//                     "This is a high-quality premium bag perfect for daily use. "
//                     "Made from durable material and designed for comfort and style.",
//                     style: TextStyle(fontSize: 16, color: Colors.grey),
//                   ),

//                   const SizedBox(height: 40),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // ------------------ دالة بناء قسم زي الصورة ------------------
//   Widget buildSection(String title, String value) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 15),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             "$title:",
//             style: const TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w600,
//             ),
//           ),

//           Text(
//             value,
//             style: const TextStyle(
//               fontSize: 18,
//               color: Colors.brown,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
