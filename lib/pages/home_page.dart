import 'package:flutter/material.dart';
import 'package:shop_app_flutter/pages/cart_page.dart';
import 'package:shop_app_flutter/widgets/product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  List<Widget> pages = const [ProductList(), CartPage()];

  @override
  Widget build(BuildContext context) {
    // print(Provider.of(context));
    return Scaffold(
      // body: pages[currentPage],
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: SizedBox(
        height: 125,
        child: BottomNavigationBar(
            currentIndex: currentPage,
            onTap: (value) {
              setState(() {
                currentPage = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: _buildIcon(Icons.home, 0),
                  label: currentPage == 0 ? 'Home' : ''),
              BottomNavigationBarItem(
                  icon: _buildIcon(Icons.shopping_cart, 1),
                  label: currentPage == 1 ? 'Cart' : ''),
            ]),
      ),
    );
  }

  Widget _buildIcon(IconData icon, int index) {
    bool isSelected = currentPage == index;

    // return AnimatedContainer(
    //   duration: const Duration(milliseconds: 300),
    //   curve: Curves.easeInOut,
    //   width: isSelected ? 35.0 : 30.0, // Adjust size for the animation
    //   height: isSelected ? 35.0 : 30.0,
    //   child: Icon(
    //     icon,
    //     color: isSelected
    //         ? Colors.blue
    //         : Colors.grey, // Change color when selected
    //   ),
    // );
    // return AnimatedPadding(
    //   padding: EdgeInsets.only(
    //       bottom: isSelected ? 0 : 0,
    //       top: isSelected ? 8 : 0), // Moves the icon up when selected
    //   duration: const Duration(milliseconds: 300),
    //   child: Icon(
    //     icon,
    //     color: isSelected
    //         ? Colors.blue
    //         : Colors.grey, // Change color when selected
    //   ),
    // );
    // return Transform.translate(
    //   offset: Offset(0, isSelected ? -5 : 0), // Move icon up when selected
    //   child: Icon(
    //     icon,
    //     color: isSelected
    //         ? Colors.blue
    //         : Colors.grey, // Change color when selected
    //   ),
    // );
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300), // Controls animation speed
      curve: Curves.easeInOut, // Adds smooth easing to the animation
      transform: Matrix4.translationValues(
          0, isSelected ? -10 : 0, 0), // Smooth upward movement
      child: Icon(
        icon,
        color: isSelected
            ? Colors.blue
            : Colors.grey, // Change color when selected
      ),
    );
  }
}
