import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalcButton extends StatelessWidget {
  final String text;
  final int textColor;
  final int fillColor;
  final double textSize;
  final Function cb;
  @override
  CalcButton(
      {this.text,
      this.textColor = 0xFFFFFFFF,
      this.fillColor,
      this.textSize = 28,
      this.cb});
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: SizedBox(
        height: 65,
        width: 65,
        child: FlatButton(
          onPressed: () {
            cb(text);
          },
          color: fillColor != null ? Color(fillColor) : null,
          textColor: Color(textColor),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
          child: Text(
            text,
            style: GoogleFonts.rubik(textStyle: TextStyle(fontSize: textSize)),
          ),
        ),
      ),
    );
  }
}
