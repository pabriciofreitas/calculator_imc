// static final instance = AppTheme();

//   final _colors = AppColors();
//   static AppColors get colors => instance._colors;
//   // final _textStyles = AppTextStyles();
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

mixin AppTheme {
  /*
Theme.of(context).textTheme.headline4?.copyWith(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
  */
  static const _lightFillColor = Color(0xFF303030);
  // static const _darkFillColor = Color(0xFFFCFCFC);

  static final Color _lightFocusColor = _lightFillColor.withOpacity(0.12);
  // static final Color _darkFocusColor = _darkFillColor.withOpacity(0.12);

  static ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFocusColor);
  // static ThemeData darkThemeData = themeData(appColor, _darkFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
        unselectedWidgetColor: colorScheme.primary,
        canvasColor: colorScheme.background,
        backgroundColor: colorScheme.background,
        colorScheme: colorScheme,
        disabledColor: colorScheme.onBackground.withAlpha(40),
        dividerColor: colorScheme.onBackground.withAlpha(40),
        elevatedButtonTheme: elevatedButtonThemeData(colorScheme),
        errorColor: colorScheme.error,
        focusColor: focusColor,
        fontFamily: 'Poppins',
        highlightColor: Colors.transparent,
        iconTheme: IconThemeData(color: colorScheme.primary),
        inputDecorationTheme: inputDecorationTheme(colorScheme),
        primaryColor: colorScheme.primary,
        primaryColorLight: colorScheme.primaryContainer,
        scaffoldBackgroundColor: colorScheme.background,
        textTheme: _textTheme,
        toggleableActiveColor: colorScheme.primary,
        listTileTheme: ListTileThemeData(iconColor: colorScheme.primary));
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    //fundo
    background: Color(0xffffffff), //meu fundo
    //brilho geral
    brightness: Brightness.light,
    //cor de erro
    error: Color(0xFFFF5A5A),
    //em cima do backgroudnd
    onBackground: Color(0xffffffff), //letrra por cima do fundo fraca
    //por cima do error
    onError: Color(0xFFFFFFFF),
    //por cima da primaria
    onPrimary: Color(0xFFFFFFFF),
    //por cima da segundaria
    onSecondary: Color(0xFFFFFFFF),
    //por cima da superfice
    onSurface: Color(0x00000000),
    //principal
    primary: Color(0xFFC1007E),
    //secundaria
    secondary: Color(0xFF020002),
    //superfice
    surface: Color(0xFF767676), //cor appbar
  );

  //static const _light = FontWeight.w300;
  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _bold = FontWeight.w700;

  static final TextTheme _textTheme = TextTheme(
    // headline1: GoogleFonts.poppins(
    //     fontSize: 93, fontWeight: FontWeight.w300, letterSpacing: -1.5),
    // headline2: GoogleFonts.poppins(
    //     fontSize: 58, fontWeight: FontWeight.w300, letterSpacing: -0.5),
    // headline3: GoogleFonts.poppins(fontSize: 46, fontWeight: FontWeight.w400),

    headline4: GoogleFonts.poppins(
      fontSize: 31,
      fontWeight: _regular,
      letterSpacing: 0.25,
    ), // +++++++++++ Cabeça headline4
    headline5: GoogleFonts.poppins(
      fontSize: 24,
      fontWeight: _regular,
    ), // +++++++++++ subCabeça headline5

    headline6: GoogleFonts.poppins(
        fontSize: 18, fontWeight: _medium, letterSpacing: 0.15),
    // subtitle1: GoogleFonts.poppins(
    //     fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.15),
    subtitle2: GoogleFonts.poppins(
        fontSize: 13, fontWeight: _bold, letterSpacing: 0.1),

    bodyText1: GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: _regular,
      letterSpacing: 0.5,
    ), // +++++++++++ bodyText1 corpo do texto ----textfild
    bodyText2: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: _regular,
      letterSpacing: 0.25,
    ), // +++++++++++ bodyText2 ----text do appbar -- corpo do textf

    // button: GoogleFonts.poppins(
    //     fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 1.25),

    caption: GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: _regular,
      letterSpacing: 0.4,
    ), // +++++++++++ caption texto menor usado no grau dde obsidade

    // overline: GoogleFonts.poppins(
    //     fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
  );

  static ElevatedButtonThemeData elevatedButtonThemeData(
      ColorScheme colorScheme) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        onPrimary: colorScheme.onPrimary,
        onSurface: colorScheme.onSurface,
        //padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        primary: colorScheme.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        textStyle: _textTheme.bodyText1?.copyWith(color: colorScheme.onPrimary),
      ),
    );
  }

  static InputDecorationTheme inputDecorationTheme(ColorScheme colorScheme) {
    return InputDecorationTheme(
      // border: const OutlineInputBorder(
      //     borderRadius: BorderRadius.all(Radius.circular(25))),
      // enabledBorder: OutlineInputBorder(
      //   borderSide: BorderSide(
      //     color: colorScheme.onBackground,
      //   ),
      // ),
      // errorBorder: OutlineInputBorder(
      //   borderSide: BorderSide(
      //     color: colorScheme.error,
      //   ),
      // ),
      // focusedBorder: OutlineInputBorder(
      //   borderSide: BorderSide(
      //     color: colorScheme.onBackground,
      //   ),
      // ),
      // disabledBorder: OutlineInputBorder(
      //   borderSide: BorderSide(
      //     color: colorScheme.onBackground,
      //   ),
      // ),
      // focusedErrorBorder: OutlineInputBorder(
      //   borderSide: BorderSide(
      //     color: colorScheme.error,
      //   ),
      // ),
      labelStyle: _textTheme.bodyText1,
      filled: true,
      fillColor: colorScheme.onBackground,
      hintStyle: _textTheme.bodyText1?.copyWith(),
    );
  }
}
/*

 enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        // borderSide: BorderSide(
        //   color: colorScheme.onBackground.withAlpha(80),
        // ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        // borderSide: BorderSide(
        //   color: colorScheme.error,
        // ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        // borderSide: BorderSide(
        //   color: colorScheme.onBackground.withAlpha(200),
        // ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        // borderSide: BorderSide(
        //   color: colorScheme.onBackground.withAlpha(40),
        // ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        // borderSide: BorderSide(
        //   color: colorScheme.error,
        // ),
      ),

*/

