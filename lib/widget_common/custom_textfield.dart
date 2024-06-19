import '../consts/consts.dart';

Widget customTextfield({String? title,String? hint,controller}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      title!.text.color(Colors.green).fontFamily(bold).size(20).make(),
      5.heightBox,
      TextFormField(
        keyboardType: TextInputType.phone,
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,

          hintStyle: TextStyle(fontFamily: bold, color: Colors.grey,fontSize: 15,),
          isDense: true,
          fillColor: lightGrey,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green), // Set border color
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green,width: 1), // Set border color
          ),
        ),
      ),

      5.heightBox,

    ],

  );

}

Widget changePin({String? title, String? hint, controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title?.text.color(Colors.green).fontFamily(bold).size(25).make() ?? SizedBox(), // Use null-aware operator and provide a fallback widget

      TextFormField(

        maxLength: 4,
        keyboardType: TextInputType.phone,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
          hintText: hint,
          hintStyle: TextStyle(fontFamily: semibold, color: Colors.grey, fontSize: 18),
          isDense: true,
          fillColor: lightGrey,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green), // Set border color
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green, width: 2), // Set border color
          ),
        ),
      ),

    ],
  );
}
