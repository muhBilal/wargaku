import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'colornotifire.dart';
import 'media.dart';

late ColorNotifire notifire;

class NormalCustomtextfilds {
  static Widget textField(
      textclr, hintclr, borderclr, hinttext, w, fillcolor, context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w),
      child: Container(
        color: Colors.transparent,
        height: height / 15,
        child: TextField(
          autofocus: false,
          style: TextStyle(
            fontSize: height / 50,
            color: textclr,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: notifire.getwhite,
            hintText: hinttext,
            hintStyle: TextStyle(color: hintclr, fontSize: height / 60),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderclr),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.withOpacity(0.3),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
