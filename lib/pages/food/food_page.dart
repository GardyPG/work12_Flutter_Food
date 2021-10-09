import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:work12/pages/food/foodlist_page.dart';
import 'package:work12/pages/food/order_page.dart';


class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  var _selectedBottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade100,
      body: _selectedBottomNavIndex == 0 ? FoodListPage() : OrderPage(),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 15,
        selectedLabelStyle: GoogleFonts.fredokaOne(fontWeight: FontWeight.bold),
        backgroundColor: Colors.amber.shade700,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Your order',
          ),
        ],
        currentIndex: _selectedBottomNavIndex,
        fixedColor: Colors.white,
        unselectedItemColor: Colors.amber.shade100,
        unselectedLabelStyle: GoogleFonts.fredokaOne(),
        onTap: (index) {
          setState(() {
            _selectedBottomNavIndex = index;
          });
        },
      ),
    );
  }
}
