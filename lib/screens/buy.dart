import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ==========================
// Custom Colors & Style
// ==========================
Color mainPink = const Color.fromARGB(255, 255, 222, 232);
Color darkPink = const Color.fromARGB(255, 158, 55, 86);
Color softWhite = const Color.fromARGB(230, 255, 255, 255);

TextStyle titleStyle = GoogleFonts.alexandria(
  fontSize: 24,
  fontWeight: FontWeight.bold,
);

TextStyle labelStyle = GoogleFonts.livvic(
  fontSize: 16,
  fontWeight: FontWeight.w500,
);

// ==========================
// PAYMENT HOME PAGE
// ==========================
class PaymentHomePage extends StatelessWidget {
  const PaymentHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainPink,
      appBar: AppBar(
        backgroundColor: mainPink,
        elevation: 0,
        title: Text("Choose Payment", style: titleStyle),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 120,
            left: 0,
            right: 0,
            child: Container(
              height: 650,
              decoration: BoxDecoration(
                color: softWhite,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
            ),
          ),

          Positioned(
            top: 40,
            left: 20,
            child: Text("Select Your Payment Method", style: GoogleFonts.oswald(fontSize: 20)),
          ),

          Positioned(
            top: 170,
            left: 25,
            right: 25,
            child: Column(
              children: [
                paymentButton(
                  icon: Icons.credit_card,
                  title: "Visa / Mastercard",
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CardPaymentPage())),
                ),
                const SizedBox(height: 20),
                paymentButton(
                  icon: Icons.account_balance_wallet,
                  title: "Website Wallet",
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const WalletPage())),
                ),
                const SizedBox(height: 20),
                paymentButton(
                  icon: Icons.local_shipping_outlined,
                  title: "Cash on Delivery",
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CashPaymentPage())),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget paymentButton({required IconData icon, required String title, required Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: darkPink, width: 1.5),
        ),
        child: Row(
          children: [
            Icon(icon, size: 30, color: darkPink),
            const SizedBox(width: 20),
            Text(title, style: GoogleFonts.livvic(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

// ==========================
// CARD PAYMENT PAGE — Matching Same Pink Design
// ==========================
class CardPaymentPage extends StatelessWidget {
  const CardPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainPink,
      appBar: AppBar(
        backgroundColor: mainPink,
        elevation: 0,
        title: Text("Card Payment", style: titleStyle),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 120,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(25),
              height: 650,
              decoration: BoxDecoration(
                color: softWhite,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: CardForm(),
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================
// CARD FORM
// ==========================
class CardForm extends StatefulWidget {
  @override
  State<CardForm> createState() => _CardFormState();
}

class _CardFormState extends State<CardForm> {
  final TextEditingController name = TextEditingController();
  final TextEditingController cardNumber = TextEditingController();
  final TextEditingController expiry = TextEditingController();
  final TextEditingController cvv = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        formField(label: "Card Holder Name", controller: name),
        const SizedBox(height: 15),
        formField(label: "Card Number", controller: cardNumber, keyboard: TextInputType.number),
        const SizedBox(height: 15),
        Row(
          children: [
            Expanded(child: formField(label: "MM/YY", controller: expiry)),
            const SizedBox(width: 15),
            Expanded(child: formField(label: "CVV", controller: cvv, keyboard: TextInputType.number)),
          ],
        ),
        const SizedBox(height: 40),

        // PAY NOW BUTTON
        GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PaymentSuccess())),
          child: Container(
            height: 55,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: darkPink,
            ),
            child: Text(
              "Pay Now",
              style: GoogleFonts.oswald(fontSize: 22, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget formField({required String label, required TextEditingController controller, TextInputType? keyboard}) {
    return TextField(
      controller: controller,
      keyboardType: keyboard,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: labelStyle,
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: darkPink, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: darkPink, width: 2),
        ),
      ),
    );
  }
}

// ==========================
// WEBSITE WALLET PAGE
// ==========================
class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainPink,
      appBar: AppBar(
        backgroundColor: mainPink,
        elevation: 0,
        title: Text("Wallet", style: titleStyle),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 120,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(25),
              height: 650,
              decoration: BoxDecoration(
                color: softWhite,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Wallet Balance", style: labelStyle.copyWith(fontSize: 18)),
                  const SizedBox(height: 10),
                  Text("350 EGP", style: GoogleFonts.oswald(fontSize: 28, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 30),

                  GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PaymentSuccess())),
                    child: Container(
                      height: 55,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: darkPink,
                      ),
                      child: Text(
                        "Pay with Wallet",
                        style: GoogleFonts.oswald(fontSize: 22, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================
// CASH ON DELIVERY PAGE
// ==========================
class CashPaymentPage extends StatelessWidget {
  const CashPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainPink,
      appBar: AppBar(
        backgroundColor: mainPink,
        elevation: 0,
        title: Text("Cash on Delivery", style: titleStyle),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 120,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(25),
              height: 650,
              decoration: BoxDecoration(
                color: softWhite,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    "You will pay when the order arrives.",
                    style: labelStyle.copyWith(fontSize: 18),
                  ),
                  const SizedBox(height: 40),

                  GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PaymentSuccess())),
                    child: Container(
                      height: 55,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: darkPink,
                      ),
                      child: Text(
                        "Confirm",
                        style: GoogleFonts.oswald(fontSize: 22, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================
// PAYMENT SUCCESS PAGE
// ==========================
// ==========================
// ==========================
class PaymentSuccess extends StatelessWidget {
  const PaymentSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Success")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.check_circle, size: 120, color: Colors.green),
            SizedBox(height: 20),
            Text("Payment Successful!", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}