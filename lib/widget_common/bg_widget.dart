// import 'package:flutter/material.dart';
//
// Widget bgWidget({
//   required Widget child,
//   EdgeInsets? padding,
//   EdgeInsets? margin,
//   Color? backgroundColor,
//   double? width,
//   double? height,
// }) {
//   return ClipOval(
//     child: Container(
//       padding: padding,
//       margin: margin,
//       width: width,
//       height: height,
//       decoration: BoxDecoration(
//         color: backgroundColor,
//         borderRadius: BorderRadius.circular(80), // Add border radius for the entire container
//       ),
//       child: ClipPath(
//         clipper: ShapeBorderClipper(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(40), // Add border radius for the entire container
//           ),
//         ),
//         child: Container(
//           decoration: BoxDecoration(
//             // border: Border(
//             //   top: BorderSide(
//             //     color: Colors.black, // Border color
//             //     width: 2, // Border width
//             //   ),
//             // ),
//
//
//           ),
//           child: child,
//         ),
//       ),
//     ),
//   );
// }
import 'package:flutter/material.dart';

Widget bgWidget({
  required Widget child,
  EdgeInsets? padding,
  EdgeInsets? margin,
  Color? backgroundColor,
  double? width,
  double? height,
}) {
  return Container(
    padding: padding,
    margin: margin,
    width: width,
    height: height,
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(20), // Small radius for the corners
    ),
    child: child,
  );
}
