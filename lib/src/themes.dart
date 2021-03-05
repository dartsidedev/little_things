import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData buildTheme(bool light) {
  if (light) {
    return ThemeData(
      primarySwatch: MaterialColor(
        0xFF386FA4,
        {
          50: Color(0xFF9AE7FF),
          100: Color(0xFF37DBFF),
          200: Color(0xFF01C9FF),
          300: Color(0xFF1C8CFC),
          400: Color(0xFF0E48A4),
          500: Color(0xFF005CB0),
          600: Color(0xFF004A8B),
          700: Color(0xFF003666),
          800: Color(0xFF00213D),
          900: Color(0xFF001629),
        },
      ),
      accentColor: Color(0xFFF0B600),
      splashColor: Color(0xFF9AE7FF),
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFF9FECFF),
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: TextTheme(
        headline4: GoogleFonts.workSans(
          fontSize: 41,
          fontWeight: FontWeight.w400,
          letterSpacing: -3,
          color: Colors.black,
        ),
        headline6: GoogleFonts.workSans(fontSize: 22),
        bodyText2: GoogleFonts.sourceSerifPro(fontSize: 18, height: 1.6),
        subtitle1: GoogleFonts.sourceSerifPro(fontSize: 18, height: 1.4),
      ),
    );
  }

  const magenta = Color(0xFFF73187);
  const pastel = Color(0xFF5e6160);
  const cyan = Color(0xFF25f7df);
  const veryBlack = Color(0xFF010101);
  const almostBlack = Color(0xFF161616);
  const white = Color(0xFFEBECEB);
  const transparentGrey = Color(0x229AE7FF);
  return ThemeData.dark().copyWith(
    platform: TargetPlatform.iOS,
    primaryColor: cyan,
    primaryColorLight: pastel,
    accentColor: magenta,
    splashColor: transparentGrey,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: TextTheme(
      // My agenda
      headline4: GoogleFonts.anonymousPro(
        fontSize: 46,
        letterSpacing: 0,
        color: white,
        fontWeight: FontWeight.bold,
      ),
      headline5: GoogleFonts.anonymousPro(
        fontSize: 30,
        letterSpacing: -1,
        color: white,
      ),
      // Agenda list item, heading in texts
      headline6: GoogleFonts.poppins(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        letterSpacing: .5,
      ),
      // Text in details pages
      bodyText2: GoogleFonts.libreBaskerville(
        fontSize: 16,
        height: 1.6,
        color: white,
      ),
      // Congrats tiny text
      caption: GoogleFonts.libreBaskerville(
        fontSize: 12,
        height: 1.9,
        letterSpacing: .5,
      ),
      // Snackbar text
      subtitle1: GoogleFonts.libreBaskerville(
        fontSize: 18,
        height: 1.4,
      ),
    ),
    scaffoldBackgroundColor: almostBlack,
    appBarTheme: AppBarTheme(backgroundColor: veryBlack),
  );
}
