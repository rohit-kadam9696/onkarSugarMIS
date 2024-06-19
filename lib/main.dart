import 'package:flutter/material.dart';
import 'package:onkarsugarmis/components/gridview_screen.dart';
import 'package:provider/provider.dart';
import 'package:onkarsugarmis/pages/theme/theme_provider.dart';
import 'components/drawer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    // MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(create: (context) => ThemeProvider()),
    //   ],
     const MyApp(),

  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Drawer Demo',
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String byDefaultAppTitle = 'ऊस गळीत अहवाल';
  String byDefaultSelectedDrawerItem = 'ऊस गळीत अहवाल'; // Default selected item

  void updateSelectedDrawerItem(String title) {
    setState(() {
      byDefaultSelectedDrawerItem = title;
      byDefaultAppTitle = title; // Update appTitle to match selected drawer item
    });
  }
  static Color appbarColor = Color(0xFF9ED7FC);
  Color backgroundBodyColor = Color(0xFF0E87F0);

  @override
  Widget build(BuildContext context) {
    final List<DrawerItem> drawerItems = [
      DrawerItem(
        animationAsset: 'assets/animations/home1.json',
        title: 'ऊस गळीत अहवाल',
        onTap: () => updateSelectedDrawerItem('ऊस गळीत अहवाल'),
        imageUrl: '',
      ),
      DrawerItem(
        animationAsset: 'assets/animations/otherrepo.json',
        title: 'इतर अहवाल',
        onTap: () => updateSelectedDrawerItem('इतर अहवाल'),
        imageUrl: '',
      ),
      DrawerItem(
        animationAsset: 'assets/animations/personalinforepo.json',
        title: 'वैयक्तिक तपशील',
        onTap: () => updateSelectedDrawerItem('वैयक्तिक तपशील'),
        imageUrl: '',
      ),
      DrawerItem(
        animationAsset: 'assets/animations/personalinfo.json',
        title: 'संचालक मंडळ',
        onTap: () => updateSelectedDrawerItem('संचालक मंडळ'),
        imageUrl: '',
      ),
      DrawerItem(
        animationAsset: 'assets/animations/personalinfo.json',
        title: 'अधिकारी वर्ग',

        onTap: () => updateSelectedDrawerItem('अधिकारी वर्ग'),
        imageUrl: '',
      ),
      DrawerItem(
        animationAsset: 'assets/animations/logouticon.json',
        title: 'लॉग आउट',
        onTap: () => updateSelectedDrawerItem('लॉग आउट'),
        imageUrl: '',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(byDefaultAppTitle,style:TextStyle(color:Colors.white,fontWeight:FontWeight.bold)),
        backgroundColor: backgroundBodyColor,
      ),
      body: Container(
               color: backgroundBodyColor,
        child: buildDrawerItemView(byDefaultSelectedDrawerItem),
      ),
      drawer: MyDrawer(
        drawerItems: drawerItems,
        factoryName: 'ओंकार शुगर युनिट',
        factoryImageUrl: 'lib/img/logosplash.png',
      ),
    );
  }


  Widget buildDrawerItemView(String drawerItem) {
    switch (drawerItem) {
      case 'ऊस गळीत अहवाल':
        return SingleChildScrollView(
          child: Column(
            children: [
              // Your widgets for ऊस गळीत अहवाल
              // Example:
              Text('Content for ऊस गळीत अहवाल'),
              // Add more widgets as needed
            ],
          ),
        );
      case 'इतर अहवाल':
        return SingleChildScrollView(
          child: Column(
            children: [
              // Your widgets for इतर अहवाल
              // Example:
              Text('Content for इतर अहवाल'),
              // Add more widgets as needed
            ],
          ),
        );
      case 'वैयक्तिक तपशील':
            return  Container(
               height:double.infinity,
               margin:EdgeInsets.only(top:40),
                child: CircularGridView());


      case 'संचालक मंडळ':
        return SingleChildScrollView(
          child: Column(
            children: [
              // Your widgets for संचालक मंडळ
              // Example:
              Text('Content for संचालक मंडळ'),
              // Add more widgets as needed
            ],
          ),
        );
      case 'अधिकारी वर्ग':
        return SingleChildScrollView(
          child: Column(
            children: [
              // Your widgets for अधिकारी वर्ग
              // Example:
              Text('Content for अधिकारी वर्ग'),
              // Add more widgets as needed
            ],
          ),
        );
      case 'लॉग आउट':
      // Handle logout action or navigate to login screen
        return Center(
          child: ElevatedButton(
            onPressed: () {
              // Handle logout logic here
            },
            child: Text('Logout'),
          ),
        );
      default:
        return Center(
          child: Text('No content available for $drawerItem'),
        );
    }
  }
}
