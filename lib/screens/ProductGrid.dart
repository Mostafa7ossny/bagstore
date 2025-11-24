import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn/model/cart.dart';
import 'package:learn/model/item.dart';
import 'package:learn/screens/ProductDetails.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    List<Item> items = [
      Item(
        title: "Hand Bag",
        price: 3299,
        photo: "assets/bag/1.png",
        det:
            "Crafted from premium, high-quality materials, this bag is designed \n to combine elegance and durability in a way that suits every \noccasion.  Whether you are heading to work, school, or a casual\n outing, it maintains a sophisticated look while withstanding \ndaily wear and tear. The materials are carefully selected to ensure\n long-lasting quality\n ",
      ),
      Item(
        title: "Classic Bag",
        price: 1940,
        photo: "assets/bag/8.png",
        det:
            "Crafted from premium, high-quality materials, this bag is designed \n to combine elegance and durability in a way that suits every \noccasion.  Whether you are heading to work, school, or a casual\n outing, it maintains a sophisticated look while withstanding \ndaily wear and tear. The materials are carefully selected to ensure\n long-lasting quality\n ",      ),
      Item(
        title: "Office Bag",
        price: 1730,
        photo: "assets/bag/5.png",
        det:
            "Crafted from premium, high-quality materials, this bag is designed \n to combine elegance and durability in a way that suits every \noccasion.  Whether you are heading to work, school, or a casual\n outing, it maintains a sophisticated look while withstanding \ndaily wear and tear. The materials are carefully selected to ensure\n long-lasting quality\n ",      ),
      Item(
        title: "blue Bag",
        price: 1220,
        photo: "assets/bag/2.png",
        det:
            "Crafted from premium, high-quality materials, this bag is designed \n to combine elegance and durability in a way that suits every \noccasion.  Whether you are heading to work, school, or a casual\n outing, it maintains a sophisticated look while withstanding \ndaily wear and tear. The materials are carefully selected to ensure\n long-lasting quality\n ",      ),
      Item(
        title: "orange Bag",
        price: 1450,
        photo: "assets/bag/3.png",
        det:
            "Crafted from premium, high-quality materials, this bag is designed \n to combine elegance and durability in a way that suits every \noccasion.  Whether you are heading to work, school, or a casual\n outing, it maintains a sophisticated look while withstanding \ndaily wear and tear. The materials are carefully selected to ensure\n long-lasting quality\n ",      ),
      Item(
        title: "white Bag",
        price: 1230,
        photo: "assets/bag/6.png",
        det:
            "Crafted from premium, high-quality materials, this bag is designed \n to combine elegance and durability in a way that suits every \noccasion.  Whether you are heading to work, school, or a casual\n outing, it maintains a sophisticated look while withstanding \ndaily wear and tear. The materials are carefully selected to ensure\n long-lasting quality\n ",      ),
      Item(
        title: "black Bag",
        price: 1510,
        photo: "assets/bag/7.png",
        det:
            "Crafted from premium, high-quality materials, this bag is designed \n to combine elegance and durability in a way that suits every \noccasion.  Whether you are heading to work, school, or a casual\n outing, it maintains a sophisticated look while withstanding \ndaily wear and tear. The materials are carefully selected to ensure\n long-lasting quality\n ",      ),
      Item(
        title: "office Bag",
        price: 1630,
        photo: "assets/bag/4.png",
        det:
            "Crafted from premium, high-quality materials, this bag is designed \n to combine elegance and durability in a way that suits every \noccasion.  Whether you are heading to work, school, or a casual\n outing, it maintains a sophisticated look while withstanding \ndaily wear and tear. The materials are carefully selected to ensure\n long-lasting quality\n ",      ),
    ];
    //     {"photo": "assets/bag/1.png", "title": "Hand Bag", "price": "120"},
    // {"photo": "assets/bag/8.png", "title": "Classic Bag", "price": "140"},
    // {"photo": "assets/bag/5.png", "title": "Office Bag", "price": "160"},
    // {"photo": "assets/bag/2.png", "title": "blue Bag", "price": "180"},
    // {"photo": "assets/bag/3.png", "title": "orange Bag", "price": "180"},
    // {"photo": "assets/bag/6.png", "title": "white Bag", "price": "180"},
    // {"photo": "assets/bag/7.png", "title": "black Bag", "price": "180"},
    // {"photo": "assets/bag/4.png", "title": "office Bag", "price": "180"},

    return GridView.builder(
      shrinkWrap: true, // مهم جداً
      physics:
          const NeverScrollableScrollPhysics(), // عشان السكروول يبقى للصفحة بس
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 0.72,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ProductItem(item: items[index]);
      },
    );
  }
}

class ProductItem extends StatelessWidget {
  final Item item;

  const ProductItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(73, 255, 255, 255),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductDetails(item1: item),
                    ),
                  );
                },
                icon: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(18),
                  ),
                  child: Image.asset(
                    item.photo,
                    height: 160,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 12, left: 10),
                child: Text(
                  item.title,
                  style: GoogleFonts.aBeeZee(
                    fontSize: 16,
                    color: Color.fromARGB(255, 117, 53, 1),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 4, left: 10),
                child: Text(
                  "\$${item.price}",
                  style: GoogleFonts.aBeeZee(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 134, 55, 1),
                  ),
                ),
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (context, cart, child) {
              return Positioned(
                bottom: 10,
                right: 10,
                child: IconButton(
                  onPressed: () {
                    cart.add(item);
                  },
                  icon: Icon(
                    Icons.shopping_cart_checkout_rounded,
                    color: const Color.fromARGB(255, 117, 74, 8),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
