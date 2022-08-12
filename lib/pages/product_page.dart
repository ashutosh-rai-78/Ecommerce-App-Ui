import 'dart:ui';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    List<IconData> data = [
      Icons.home_outlined,
      Icons.search,
      Icons.add_box_outlined,
      Icons.favorite_outline_sharp,
      Icons.person_outline_sharp
    ];
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: 200,
        width: 200,
        child: Stack(children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                "assets/images/product_3.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BlurryContainer(
                child: Container(),
                blur: 5,
                width: 200,
                height: 50,
                elevation: 0,
                color: Colors.transparent,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                )),
          ),
        ]),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(20),
          color: Colors.black,
          child: Container(
            height: 70,
            width: double.infinity,
            child: ListView.builder(
              itemCount: data.length,
              padding: EdgeInsets.symmetric(horizontal: 10),
              itemBuilder: (ctx, i) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = i;
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 250),
                    width: 35,
                    decoration: BoxDecoration(
                      border: i == selectedIndex
                          ? Border(
                              top: BorderSide(width: 3.0, color: Colors.white))
                          : null,
                      gradient: i == selectedIndex
                          ? LinearGradient(
                              colors: [Colors.grey.shade800, Colors.black],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)
                          : null,
                    ),
                    child: Icon(
                      data[i],
                      size: 35,
                      color: i == selectedIndex
                          ? Colors.white
                          : Colors.grey.shade800,
                    ),
                  ),
                ),
              ),
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),
      ),
    );
  }
}
