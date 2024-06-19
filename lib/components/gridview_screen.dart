import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';
import 'package:onkarsugarmis/auth/login_screen.dart';
import 'package:onkarsugarmis/components/farmer_tap_gridview.dart';
import 'package:onkarsugarmis/components/splash_screen.dart';

class CircularGridView extends StatelessWidget {
  // Sample data for demonstration
  final List<Map<String, dynamic>> items = [
    {"image": "lib/img/img_8.png", "text": "शेतकरी"},
    {"image": "lib/img/img_10.png", "text": "मुकादम"},
    {"image": "lib/img/img_11.png", "text": "तोडणीदार"},
    {"image": "lib/img/img_12.png", "text": "वाहतूकदार"},
    {"image": "lib/img/img_13.png", "text": "व्यापारी"},
    {"image": "lib/img/img_14.png", "text": "खरेदीदार"},
  ];

  final List<Map<String, dynamic>> farmeritems = [
    {"image": "lib/img/img_15.png", "text": "ऊस नोंदी"},
    {"image": "lib/img/sugarcane_tonnage.png", "text": "ऊस टनेज"},
    {"image": "lib/img/img_14.png", "text": "ऊस बिले"},
    {"image": "lib/img/img_17.png", "text": "सभासद साखर"},
    {"image": "lib/img/img_18.png", "text": "शेअर"},

  ];
  final List<Map<String, dynamic>> mukadamitems = [

    {"image": "lib/img/sugarcane_tonnage.png", "text": "टनेज"},
    {"image": "lib/img/img_14.png", "text": "बिले"},
    {"image": "lib/img/diesel.png", "text": "डिजेल"},
    {"image": "lib/img/img_18.png", "text": "खाते तपशील"},

  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20.0,
        crossAxisSpacing: 20.0,
        childAspectRatio: 1.0,
      ),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return CircularItem(
          image: items[index]['image'],
          text: items[index]['text'],
          onTap: () {
            // Handle tap action here, for example:
            print('Tapped on ${items[index]['text']}');
            if(index==0){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FarmerGridViewScreen(items: farmeritems, initialIndex: index),
                ),
              );
            }
            if(index==1){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>FarmerGridViewScreen(items: mukadamitems, initialIndex: index),
                ),
              );
            }
            if(index==2){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>FarmerGridViewScreen(items: mukadamitems, initialIndex: index),
                ),
              );
            }
            if(index==3){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>FarmerGridViewScreen(items: mukadamitems, initialIndex: index),
                ),
              );
            }
            if(index==4){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>LoginScreen(),
                ),
              );
            }


          },
        );
      },
    );
  }
}

class CircularItem extends StatelessWidget {
  final String image;
  final String text;
  final void Function() onTap;

  CircularItem({
    required this.image,
    required this.text,
    required this.onTap,
  });

  // static Color myColor = Color(0xFFB9B26C).withOpacity(0.5);
  // static Color myColor1 = Color(0xFFB9B26C).withOpacity(0.2);
 static Color cardColorloader = Color(0xFF09477D);
  static Color cardColorloader1 = Color(0xFF09477D).withOpacity(0.5);

  @override
  Widget build(BuildContext context) {
    // final double containerWidth = MediaQuery.of(context).size.width / 2 - 15 + 20; // Increase width by 20 pixels
    // final double containerHeight = containerWidth + 20; // Increase height by 20 pixels

    return Container(
      width:double.infinity,
      height:double.infinity,
      child: GestureDetector(
        onTap: onTap,

          child: CardLoading(
            cardLoadingTheme: CardLoadingTheme(colorOne: cardColorloader, colorTwo: cardColorloader1),
           margin: EdgeInsets.only(left:10,right:10),
            height: double.infinity,
         //   width:150,
            child: Container(

              //padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

            Container(
                   decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white, // Adjust border color here
                          width: 5, // Adjust border width here
                        ),
                      ),
                      child: CircleAvatar(
                     // Adjust radius for padding and border
                        backgroundImage: AssetImage(image),
                        backgroundColor: Colors.transparent,
                        radius:65,
                      ),
                    ),


                  SizedBox(height: 20),
                  Text(
                    text,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color:Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),

    );
  }
}
