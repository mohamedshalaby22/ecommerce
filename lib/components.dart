import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultTextFormField({
  TextEditingController? controller,
  required TextInputType type,
  required IconData prefix,
  required Function? onSaved,
  IconData? suffix,
  String? text,
}) =>
    TextFormField(
      style: const TextStyle(
        color: Colors.black,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'field mustn\'t  be empty';
        }
      },
      controller: controller,
      keyboardType: type,
      onSaved: (s) {
        onSaved!(s);
      },
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0xff09c16d),
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0xff09c16d),
          ),
        ),
        hintText: text,
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon: Icon(
          prefix,
          color: Colors.grey.shade900,
        ),
      ),
    );

Widget defaultButton({
  double? width,
  double? height,
  Color color = const Color(0xff09c16d),
  required String text,
  double radius = 10.0,
  required Function? pressed,
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: MaterialButton(
        onPressed: () {
          pressed!();
        },
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
Widget defaultLogin({
  double? width = 350,
  double? height = 57,
  String? image,
  String? text,
  required Function? onpress,
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey,
          )),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 3, left: 15),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child:
                      Image(width: 35, height: 35, image: AssetImage('$image')),
                ),
                const SizedBox(
                  width: 70,
                ),
                TextButton(
                  onPressed: () {
                    onpress!();
                  },
                  child: Text(
                    '$text',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
