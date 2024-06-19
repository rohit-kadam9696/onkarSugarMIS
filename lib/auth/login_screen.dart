


import 'dart:convert';
import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:onkarsugarmis/consts/consts.dart';
import 'package:onkarsugarmis/consts/images.dart';
import 'package:onkarsugarmis/widget_common/bg_widget.dart';
import 'package:onkarsugarmis/widget_common/custom_textfield.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:toastification/toastification.dart';


import 'dart:convert' as convert;
import 'dart:io';

import 'dart:convert' as convert;
import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:http/http.dart' as http;
class LoginScreen extends StatefulWidget {
  final String? sugarFactoryId; // Add index parameter
  final int? index;

  const LoginScreen({super.key, this.sugarFactoryId, this.index});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  static String sugarFactoryId = '';
  static String _storedIdentifier = '';
  String _currentIdentifier = '';
  static String identifier = 'Identifier not available';
  bool isContainerVisible = false;
  @override
  void initState() {
    super.initState();
    _getDeviceInfo();
    _getStoredIdentifier();
    setState(() {
      sugarFactoryId = widget.sugarFactoryId ?? '';

      print("Login sugarfid: ${sugarFactoryId}");
    });
  }
  Future<void> _getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    try {
      if (Platform.isAndroid) {
        // Request permission to access phone state
        var status = await Permission.phone.status;
        if (!status.isGranted) {
          await Permission.phone.request();
          status = await Permission.phone.status;
        }
        if (status.isGranted) {
          AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
          String imei = androidInfo.androidId ?? 'IMEI not available';
          setState(() {
            identifier = imei;
          });
        } else {
          print('Permission denied to access phone state');
        }
      } else if (Platform.isIOS) {
        // iOS code to retrieve identifierForVendor
      }
    } catch (e) {
      print('Error getting device info: $e');
    }
  }



  Future<void> _getStoredIdentifier() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _storedIdentifier = prefs.getString('identifier') ?? '';
    });
  }

  Future<void> _updateIdentifier() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('identifier', _currentIdentifier);
    setState(() {
      _storedIdentifier = _currentIdentifier;
    });
  }
  DateTime? currentBackPressTime;
  Future<bool> _onWillPop() async {
    final now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 1)) {
      currentBackPressTime = now;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Press back again to exit'),
        ),
      );
      return false;
    } else {
      SystemNavigator.pop();
      return true;
    }
  }
  static const Color green = Color(0xff31410c);
 static Color backgroundBodyColor = Color(0xFF0E87F0);
  static Color cardColorloader = Color(0xFF09477D);
  static Color cardColorloader1 = Color(0xFF09477D).withOpacity(0.5);
  @override
  Widget build(BuildContext context) {
    TextEditingController mobileno = TextEditingController();
    // return Scaffold(
    //
    //     resizeToAvoidBottomInset: false,
    //     body: Stack(children: [
    //       Container(
    //           decoration: BoxDecoration(
    //             image: DecorationImage(
    //               image: AssetImage(imgBackground),
    //               fit: BoxFit.cover, // Ensure the background image covers the entire container
    //             ),
    //             // borderRadius: BorderRadius.circular(20),
    //             // border: Border.all(
    //             //   color: Colors.black,
    //             //   width: 2,
    //             // ),
    //           ),
    //           child: SizedBox.expand()
    //       ),
    //
    //       bgWidget(
    //         margin: EdgeInsets.only(top: 230,left: 20,right: 20,bottom: 60),
    //         //  padding: EdgeInsets.only(bottom: 40),
    //         padding: EdgeInsets.only(left: 10,right: 10),
    //         backgroundColor: green,
    //
    //
    //         child: SafeArea(
    //
    //
    //           child: Column(
    //             children: [
    //               (context.screenWidth).widthBox,
    //
    //               Column(
    //                 children: [
    //                   Container(
    //                       decoration: BoxDecoration(
    //                           shape: BoxShape.circle,
    //                           color: Colors.white,
    //
    //                           border: Border.all(color: Colors.green,width: 3)
    //                       ),
    //                       child: ClipOval(child: Lottie.asset('assets/animations/loginanim.json',width: 150,height: 150,)
    //                       )
    //
    //                   ),
    //                   customTextfield(hint: mobileNohint,title: mobile,controller: mobileno),
    //                   10.heightBox,
    //                   Align(
    //                     alignment: Alignment.center,
    //                     child: Container(
    //                       //width: double.infinity,
    //                         padding: EdgeInsets.only(left: 25,right: 25),
    //                         color:green,
    //                         child: TextButton(
    //                             style: TextButton.styleFrom(
    //                               backgroundColor: Colors.green,
    //                               padding: EdgeInsets.symmetric(
    //                                 horizontal: 20,
    //                                 vertical: 5,
    //                               ),
    //                             ),
    //                             onPressed: () async {
    //
    //                               String phoneno = mobileno.text;
    //
    //                               if (phoneno.isEmpty) {
    //
    //                                 double height = 220.0;
    //                                 String mobileNoEmptyMsg = "कृपया मोबाइल क्रमांक टाका.";
    //                                 print("Please Enter Mobile Number");
    //                                 ScaffoldMessenger.of(context).showSnackBar(
    //                                   SnackBar(
    //                                     content: Container(
    //                                       padding: EdgeInsets.all(20),
    //                                       decoration: BoxDecoration(
    //                                         color: Colors.red,
    //                                         borderRadius: BorderRadius.circular(10), // Adjust the border radius
    //                                         border: Border.all(
    //                                           color: Colors.greenAccent,
    //                                           width: 2.0, // Adjust the border width
    //                                         ),
    //                                       ),
    //                                       child: Padding(
    //                                         padding: const EdgeInsets.only(left: 50),
    //                                         child: Text(
    //                                           "कृपया मोबाइल क्रमांक टाका.",
    //                                           style: TextStyle(
    //                                             color: Colors.white,
    //                                             fontSize: 20,
    //
    //
    //                                           ),
    //                                         ),
    //                                       ),
    //
    //                                     ),
    //                                     duration: Duration(seconds: 3),
    //                                     backgroundColor: Colors.transparent,
    //                                   ),
    //                                 );
    //                               }
    //                               else if (phoneno.length < 10) {
    //                                 ScaffoldMessenger.of(context).showSnackBar(
    //                                   SnackBar(
    //                                     content: Container(
    //                                       padding: EdgeInsets.all(16),
    //                                       decoration: BoxDecoration(
    //                                         color: Colors.red,
    //                                         borderRadius: BorderRadius.circular(
    //                                             10), // Adjust the border radius
    //                                         border: Border.all(
    //                                           color: Colors.greenAccent,
    //                                           width: 2.0, // Adjust the border width
    //                                         ),
    //                                       ),
    //                                       child: Padding(
    //                                         padding: const EdgeInsets.only(
    //                                             left: 40),
    //                                         child: Text(
    //                                           "फोन नंबर चुकीचा आहे.",
    //                                           style: TextStyle(
    //                                             color: Colors.white,
    //                                             fontSize: 20,
    //                                           ),
    //                                         ),
    //                                       ),
    //                                     ),
    //                                     duration: Duration(seconds: 3),
    //                                     backgroundColor: Colors.transparent,
    //                                   ),
    //                                 );
    //                               }
    //                               else if (phoneno.length > 12) {
    //                                 ScaffoldMessenger.of(context).showSnackBar(
    //                                   SnackBar(
    //                                     content: Container(
    //                                       padding: EdgeInsets.all(16),
    //                                       decoration: BoxDecoration(
    //                                         color: Colors.red,
    //                                         borderRadius: BorderRadius.circular(
    //                                             10), // Adjust the border radius
    //                                         border: Border.all(
    //                                           color: Colors.greenAccent,
    //                                           width: 2.0, // Adjust the border width
    //                                         ),
    //                                       ),
    //                                       child: Padding(
    //                                         padding: const EdgeInsets.only(
    //                                             left: 30),
    //                                         child: Text(
    //                                           "कृपया योग्य मोबाइल क्रमांक टाका.",
    //                                           style: TextStyle(
    //                                             color: Colors.white,
    //                                             fontSize: 20,
    //                                           ),
    //                                         ),
    //                                       ),
    //                                     ),
    //                                     duration: Duration(seconds: 3),
    //                                     backgroundColor: Colors.transparent,
    //                                   ),
    //                                 );
    //
    //                               }
    //                               else{
    //
    //
    //                                 Future.delayed(Duration(seconds: 10), () {
    //                                   setState(() {
    //                                     isContainerVisible = !isContainerVisible; // Hide the container
    //                                   });
    //                                 });
    //
    //                                 print("hiii hello");
    //
    //                                 // Lottie.asset('assets/animations/loadinganim.json');
    //                                 String chitBoyId = "";
    //                                 String randomString = "";
    //                                 String versionId = await AppInfo.getVersionId();
    //                                 //SharedPreferencesHelper.updateMobileNo(phoneno);
    //
    //
    //
    //
    //
    //                                 print("identifier: ${identifier}");
    //                               //  doLogin(phoneno, identifier, randomString, versionId, chitBoyId,sugarFactoryId);
    //
    //                                 setState(() {
    //                                   isContainerVisible = !isContainerVisible; // Toggle the visibility
    //                                 });
    //
    //                                 // Navigator.pushReplacement(
    //                                 //   context,
    //                                 //   MaterialPageRoute(builder: (context) => LoginScreen(sugarFactoryId: sugarFactoryId,index:widget.index,)),
    //                                 // );
    //
    //                                 // Get.to(() => OtpActivity(
    //                                 //   imei: identifier,
    //                                 //   randomString: randomString,
    //                                 //   versionId: versionId,
    //                                 //   chitBoyId: chitBoyId,
    //                                 //   sugarFactoryId: sugarFactoryId,
    //                                 // ));
    //                               }
    //                             },
    //                             child: Container(padding: EdgeInsets.only(left: 38),width: 200,height: 40,child: login.text.color(Colors.white).fontFamily(bold).size(24).make()))),
    //                   ),
    //                   5.heightBox,
    //
    //
    //                   SafeArea(
    //                     child: Visibility(
    //                       visible: isContainerVisible,
    //                       child: Container(
    //
    //                         width: 200, // Adjust the width as needed
    //                         height: 200, // Adjust the height as needed
    //                         margin: EdgeInsets.only(left: 20, right: 40),
    //                         padding: EdgeInsets.only(bottom: 26), // Adjust padding as needed
    //                         decoration: BoxDecoration(
    //                           shape: BoxShape.circle, // Shape set to circular
    //                           color: green,
    //                         ),
    //                         child: ClipOval(
    //                           child: Lottie.asset(
    //                             'assets/animations/animm.json',
    //                             width: 500, // Adjust the width of the animation
    //                             height: 500,
    //                             // Adjust the height of the animation
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                   )
    //
    //                   //ourButton(color: redColor,title: login,textColor: whiteColor,onPress: (){}).box.width(context.screenWidth-50).make(),
    //                 ],
    //               ).box.roundedFull.rounded.padding(EdgeInsets.only(left: 10,right: 10)).make(),
    //
    //
    //             ],),
    //         ),
    //       ),
    //
    //     ],)
    //
    //
    // );

    // return Scaffold(
    //     backgroundColor: Colors.white,
    //     body: SingleChildScrollView(
    //       child: Container(
    //         child: Column(
    //           children: <Widget>[
    //             Container(
    //               height: 400,
    //               decoration: BoxDecoration(
    //                   image: DecorationImage(
    //                       image: AssetImage('assets/images/background.png'),
    //                       fit: BoxFit.fill
    //                   )
    //               ),
    //               child: Stack(
    //                 children: <Widget>[
    //                   Positioned(
    //                     left: 30,
    //                     width: 80,
    //                     height: 200,
    //                     child: FadeInUp(duration: Duration(seconds: 1), child: Container(
    //                       decoration: BoxDecoration(
    //                           image: DecorationImage(
    //                               image: AssetImage('assets/images/light-1.png')
    //                           )
    //                       ),
    //                     )),
    //                   ),
    //                   Positioned(
    //                     left: 140,
    //                     width: 80,
    //                     height: 150,
    //                     child: FadeInUp(duration: Duration(milliseconds: 1200), child: Container(
    //                       decoration: BoxDecoration(
    //                           image: DecorationImage(
    //                               image: AssetImage('assets/images/light-2.png')
    //                           )
    //                       ),
    //                     )),
    //                   ),
    //                   Positioned(
    //                     right: 40,
    //                     top: 40,
    //                     width: 80,
    //                     height: 150,
    //                     child: FadeInUp(duration: Duration(milliseconds: 1300),
    //                         child: ClipOval(
    //                           child: Container(
    //                       decoration: BoxDecoration(
    //                             image: DecorationImage(
    //                                 image: AssetImage('assets/images/clock.png')
    //                             )
    //                       ),
    //                     ),
    //                         )),
    //                   ),
    //                   Positioned(
    //                     child: FadeInUp(duration: Duration(milliseconds: 1600), child: Container(
    //                       margin: EdgeInsets.only(top: 50),
    //                       child: Center(
    //                         child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
    //                       ),
    //                     )),
    //                   )
    //                 ],
    //               ),
    //             ),
    //             Padding(
    //               padding: EdgeInsets.all(30.0),
    //               child: Column(
    //                 children: <Widget>[
    //                   FadeInUp(duration: Duration(milliseconds: 1800), child: Container(
    //                     padding: EdgeInsets.all(5),
    //                     decoration: BoxDecoration(
    //                         color: Colors.white,
    //                         borderRadius: BorderRadius.circular(10),
    //                         border: Border.all(color: Color.fromRGBO(9, 71, 125, 1)),
    //                         boxShadow: [
    //                           BoxShadow(
    //                               color: Color.fromRGBO(9, 71, 125, 0.5),
    //                               blurRadius: 20.0,
    //                               offset: Offset(0, 10)
    //                           )
    //                         ]
    //                     ),
    //                     child: Column(
    //                       children: <Widget>[
    //                         Container(
    //                           padding: EdgeInsets.all(8.0),
    //                           decoration: BoxDecoration(
    //                               border: Border(bottom: BorderSide(color:  Color.fromRGBO(9, 71, 125, 0.5)))
    //                           ),
    //                           child: TextField(
    //                             decoration: InputDecoration(
    //                                 border: InputBorder.none,
    //                                 hintText: "Email or Phone number",
    //                                 hintStyle: TextStyle(color: Colors.grey[700])
    //                             ),
    //                           ),
    //                         ),
    //
    //                       ],
    //                     ),
    //                   )),
    //                   SizedBox(height: 30,),
    //                   FadeInUp(duration: Duration(milliseconds: 1900), child: Container(
    //                     height: 50,
    //                     decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.circular(10),
    //                         gradient: LinearGradient(
    //                             colors: [
    //                               Color.fromRGBO(9, 71, 125, 1),
    //                               Color.fromRGBO(9, 71, 125, 0.5)
    //
    //                             ]
    //                         )
    //                     ),
    //                     child: Center(
    //                       child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
    //                     ),
    //                   )),
    //                   SizedBox(height: 70,),
    //                 //  FadeInUp(duration: Duration(milliseconds: 2000), child: Text("Forgot Password?", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),)),
    //                 ],
    //               ),
    //             )
    //           ],
    //         ),
    //       ),
    //     )
    // );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor:backgroundBodyColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black,),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      FadeInUp(duration: Duration(milliseconds: 1000), child: Text("लॉगीन", style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        color:Colors.white,
                      ),)),
                      SizedBox(height:20),
                      Container(

                          padding:EdgeInsets.only(left:20,right:20),
                          child: FadeInUp(duration: Duration(milliseconds: 1200), child: makeInput(label: "मोबाइल नंबर "))),
                      FadeInUp(duration: Duration(milliseconds: 1400), child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Container(
                          padding: EdgeInsets.only(right: 1, left: 1),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border(
                                bottom: BorderSide(color: Colors.black),
                                top: BorderSide(color: Colors.black),
                                left: BorderSide(color: Colors.black),
                                right: BorderSide(color: Colors.black),
                              )
                          ),
                          child: MaterialButton(
                            minWidth: double.infinity,
                            height: 40,
                            onPressed: () {},
                            color: cardColorloader1,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(60)
                            ),
                            child: Text("लॉगीन", style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 25,
                                 color:Colors.white,
                            ),),
                          ),
                        ),
                      )),
                    ],
                  ),



                ],
              ),
            ),
            FadeInUp(duration: Duration(milliseconds: 1200), child: Container(
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/img_1.png'),
                      fit: BoxFit.cover
                  )
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget makeInput({label, obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(label, style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.white
        ),),
        SizedBox(height: 5,),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)
            ),
          ),
        ),
        SizedBox(height: 30,),
      ],
    );
  }
  }

  // Future<void> doLogin(String mobileno, String imei, String randomString, String versionId, String chitBoyId, String sugarFactoryId) async {
  //   if (mobileno.isNotEmpty) {
  //     String baseUrl = ApiResponse.determineBaseUrl(sugarFactoryId);
  //     print("baseurl os: ${baseUrl}");
  //     String uri = '$baseUrl/app_login';
  //     print("uri is: ${uri}");
  //     Map<String, dynamic> requestBody = {
  //       'action': "Login",
  //       'mobileno': mobileno,
  //       'imei': imei,
  //       'randomString': randomString,
  //       'versionId': versionId,
  //       'chitBoyId': chitBoyId,
  //       'sugarFactoryId': sugarFactoryId,
  //     };
  //
  //     String json = jsonEncode(requestBody);
  //     try {
  //       var res = await http.post(
  //         Uri.parse(uri),
  //         body: json,
  //         headers: {'Content-Type': 'application/json'},
  //       );
  //       double customHeight = 220.0;
  //       if (res.statusCode == 200) {
  //
  //         print("HOW ARE YOU");
  //         var jsondecode = jsonDecode(res.body);
  //         log("Login response: $jsondecode");
  //         if (jsondecode.containsKey("success") && jsondecode["success"] == true) {
  //           String chitBoyId = jsondecode["chitBoyId"];
  //           String randomString = jsondecode["uniquestring"];
  //           String mobileno = jsondecode["mobileno"];
  //           await SharedPreferencesHelper.storeValuesInSharedPref(chitBoyId, randomString, mobileno, imei, sugarFactoryId);
  //           SharedPreferencesHelper.updateSugarFactoryId(sugarFactoryId);
  //           String storedMobileNo = await SharedPreferencesHelper.getMobileNo();
  //           String oldPin = await SharedPreferencesHelper.getLoginPin();
  //
  //           setState(() {
  //             storedMobileNo = storedMobileNo;
  //             oldPin = oldPin;
  //           });
  //
  //           Get.to(() => OtpActivity(
  //             imei: imei,
  //             randomString: randomString,
  //             versionId: versionId,
  //             chitBoyId: chitBoyId,
  //             sugarFactoryId: sugarFactoryId,
  //           ));
  //           //Get.to(() => Page())
  //         } else {
  //           String servererrormsg = jsondecode['se']['msg'];
  //           Get.snackbar('Error', servererrormsg, snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 3));
  //         }
  //       } else {
  //         print('Error: ${res.statusCode}');
  //       }
  //     } catch (e) {
  //       print('Error in HTTP request: $e');
  //     }
  //   } else {
  //     print("Please Fill All Details");
  //   }
  // }


