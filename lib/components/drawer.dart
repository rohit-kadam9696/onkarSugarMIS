import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:card_loading/card_loading.dart';
import 'package:onkarsugarmis/components/gridview_screen.dart';

class DrawerItem {
  final String title;
  final VoidCallback onTap;
  final String animationAsset; // Asset path for Lottie animation
  final String imageUrl; // Asset path for additional information image

  const DrawerItem({
    required this.title,
    required this.onTap,
    required this.animationAsset,
    required this.imageUrl,
  });
}

class MyDrawer extends StatefulWidget {
  final List<DrawerItem> drawerItems;
  final String factoryName;
  final String factoryImageUrl; // Relative path to factory image

  const MyDrawer({
    Key? key,
    required this.drawerItems,
    required this.factoryName,
    required this.factoryImageUrl,
  }) : super(key: key);

  static Color myColor = Color(0xFFB9B26C).withOpacity(0.5);
  static Color myColor1 = Color(0xFFB9B26C).withOpacity(0.2);
 static Color appbarColor = Color(0xFF9ED7FC);


  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Perform actions or navigate based on the selected index
    if (widget.drawerItems[index].onTap != null) {
      widget.drawerItems[index].onTap();
    }
    Navigator.pop(context); // Close the drawer
  }

  @override
  Widget build(BuildContext context) {
    final drawerWidth =
    Platform.isIOS ? MediaQuery.of(context).size.width * 0.8 : MediaQuery.of(context).size.width * 0.7;

    return Container(
      width: drawerWidth,
      height: double.infinity,
      child: Drawer(
        child: Column(
          children: [
            CardLoading(
              height: double.infinity,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              margin: EdgeInsets.only(top: 40, bottom: 10, left: 10, right: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),

                  image: DecorationImage(
                    image: AssetImage("lib/img/img_6.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                padding: const EdgeInsets.only(top: 20, left: 10, bottom: 10, right: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("lib/img/logosplash.png"),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'कार्यालय क्रमांक :4,',
                            style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            ' सत्यभामा संकुल ,',
                            style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'सीटीएस क्र. 529 ,',
                            style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'नारायण पेठ , पुणे ,',
                            style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'महाराष्ट्र, 411030 ',
                            style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              widget.factoryName,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            Container(height: 3, color: Colors.black),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                itemCount: widget.drawerItems.length,
                itemBuilder: (context, index) {
                  final item = widget.drawerItems[index];
                  return Card(
                    margin: EdgeInsets.only(left: 5, right: 5, bottom: 2),
                    color: index == _selectedIndex ? Colors.grey.withOpacity(0.3) : Colors.transparent,
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                      title: Row(
                        children: [
                          SizedBox(
                            width: 55,
                            height: 45,
                            child: Container(
                              width: 55,
                              height: 45,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                              ),
                              child: Lottie.asset(
                                item.animationAsset,
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Text(
                            item.title,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      onTap: () => _onItemTapped(index),
                    ),
                  );
                },
              ),
            ),
            CardLoading(
              height: 10,
              width: double.infinity,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              margin: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: MyDrawer.myColor,
                ),
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      'assets/animations/hand.json',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 150,
                    ),
                    SizedBox(height: 60),
                    SizedBox(child: Text("@3WD SOFTWARE", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
