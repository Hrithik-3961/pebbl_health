import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pebbl_health/shared/shared.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome Harsh,", style: TextStyle(color: secondaryColor),
            ),
            Text("Hope you are doing great!", style: TextStyle(color: Colors.grey),)
          ],
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.chat_outlined,color: secondaryColor,))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long_outlined), label: "Records"),
          BottomNavigationBarItem(icon: Icon(null), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart_sharp), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings")
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
        width: 100,
        height: 100,
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          elevation: 0,
          onPressed: () {},
          child: SvgPicture.asset(
            "assets/images/heart.svg",
          ),
        ),
      ),
    );
  }
}
