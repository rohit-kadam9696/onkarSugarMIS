import 'dart:io';
import 'dart:ui';


import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>  with WidgetsBindingObserver, TickerProviderStateMixin{

  static Color cardColorloader1 = Color(0xFF09477D).withOpacity(0.5);

  bool _loggedIn = false;
  static String identifier = 'Identifier not available';
  String chitBoyId = '';
  String uniqstring = '';
  String mobileNo = '';
  String imei = '';
  String pin='';
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    super.initState();
  //  _loadSharedPreferences();
    //_getDeviceInfo();
    WidgetsBinding.instance!.addObserver(this);
  }


  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    _controller.dispose();
    super.dispose();
  }
  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   if (state == AppLifecycleState.resumed) {
  //     _checkLoggedInStatus(context);
  //   }
  // }
  // Future<void> _loadSharedPreferences() async {
  //   chitBoyId = await SharedPreferencesHelper.getChitboyId();
  //   uniqstring = await SharedPreferencesHelper.getUniqString();
  //   mobileNo = await SharedPreferencesHelper.getMobileNo();
  //   imei = await SharedPreferencesHelper.getImei();
  //   pin= await SharedPreferencesHelper.getLoginPin();
  //
  //   print("pins is : ${pin}");
  //   String version = await AppInfo.getVersionId();
  //   setState(() {
  //     // Update the state variables with the obtained values
  //     chitBoyId = chitBoyId;
  //     uniqstring = uniqstring;
  //     mobileNo = mobileNo;
  //     imei = imei;
  //     pin=pin;
  //   });
  //   await Future.delayed(Duration(seconds: 3));
  //   await _checkLoggedInStatus(context);
  // }
//
//   Future<void> _getDeviceInfo() async {
//     DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
//
//     try {
//       if (Platform.isAndroid) {
//         var status = await Permission.phone.status;
//         if (status.isGranted) {
//           AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
//           String imei = androidInfo.androidId ?? 'IMEI not available';
//           setState(() {
//             identifier = imei;
//           });
//         } else {
//           await Permission.phone.request();
//         }
//       } else if (Platform.isIOS) {
//         IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
//         identifier = iosInfo.identifierForVendor ?? 'Identifier not available';
//         setState(() {
//           identifier = identifier;
//         });
//       }
//     } catch (e) {
//       print('Error getting device info: $e');
//     }
//   }
//   Future<void> _checkLoggedInStatus(BuildContext context) async {
//     if (!mounted) return; // Check if the state is still active
//
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? mobileNo = prefs.getString('mobileNo');
//     String? pin = prefs.getString('loginPin');
//
//     print("my mobile no is: ${mobileNo}");
//     print("my pin no is: ${pin}");
// //Get.offAll(() => ChangePinActivity());
//
//
//     if (mounted) { // Check if the state is still active
//       setState(() {
//         // Update _loggedIn based on mobile number availability
//         _loggedIn = mobileNo != null && mobileNo.isNotEmpty;
//       });
//
//       if (pin == null || pin.isEmpty) {
//         Get.offAll(() => ChangePinActivity());
//       } else {
//         Get.offAll(() => AuthenticateController());
//       }
//     } else {
//       Get.offAll(() => MyGridView());
//     }
//
//
//     // if (_loggedIn) {
//     //   // If mobile number is not empty, navigate to LoginPinActivity
//     //   if (pin == null || pin.isEmpty) {
//     //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ChangePinActivity()));
//     //   }
//     //   // If pin is not empty, navigate to AuthanticateActivity
//     //   else {
//     //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AuthenticateController()));
//     //   }
//     // } else {
//     //   // If mobile number is empty, navigate to LoginActivity
//     //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
//     // }
//     // if (_loggedIn) {
//     //   // Navigate to BottomNav if the user is logged in
//     //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNav()));
//     // } else {
//     //   // Navigate to HomePage if the user is not logged in
//     //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
//     // }
//   }
//
//
//
//
//   changeScreen() {
//     Future.delayed(Duration(seconds: 30),(){
//       Get.to(()=>MyGridView());
//     });
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cardColorloader1,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 35),
            child: Center(
              child: Lottie.asset(
                'assets/animations/backscreen.json',
                height: 225,
                width: 225,// Replace 'assets/background_animation.json' with your Lottie animation file path
                //fit: BoxFit.fitHeight,

              ),
            ),
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SafeArea(
                  child: Container(
                    width: 185, // Set the desired width
                    height: 185, // Set the desired height
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white, // Set the border color
                        width: 2, // Set the border width
                      ),
                    ),
                    child: ScaleTransition(
                      scale: _animation,
                      child: ClipOval(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                          child: Image.asset(
                            'lib/img/logosplash.png', // Adjust the path accordingly
                            height: 235,
                            width: 235,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Container(

            margin: EdgeInsets.only(top: 500,left: 80,right: 80),
            child: Lottie.asset(
              'assets/animations/splashimage.json',
              fit: BoxFit.cover,


            ),
          ),
             SizedBox(height:15),
          Container(

            margin: EdgeInsets.only(top: 760,left: 90,right: 80),
            child: Text("SAVE THE TREE!!!",style:TextStyle(fontWeight:FontWeight.bold,fontSize:23,color:Colors.white))
          ),
        ],
      ),
    );
  }

}
