import 'package:flutter/material.dart';
import 'package:onkarsugarmis/components/gridview_screen.dart';

class FarmerGridViewScreen extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  final int initialIndex;

  FarmerGridViewScreen({required this.items, required this.initialIndex});

  Color backgroundBodyColor = Color(0xFF0E87F0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid View Screen'),
      ),
        body: Container(
        color:backgroundBodyColor,
     padding:EdgeInsets.only(top:30),
     // Add top margin here
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 20.0,
            childAspectRatio: 1.0,
          ),
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                // Implement navigation or any action when tapped on item in the new grid
                print('Tapped on ${items[index]['text']} in the new grid');
              },
              child: CircularItem(
                image: items[index]['image'],
                text: items[index]['text'],
                onTap: () {},
              ),
            );
          },
        ),
      ),
    );
  }
}
