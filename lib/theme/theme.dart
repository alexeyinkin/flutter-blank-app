import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'my_theme_extension.dart';

final themeData = ThemeData(
  colorScheme: const ColorScheme.light(
    primary: MyColors.primaryColor,
    secondary: MyColors.primaryColor,
  ),
  textTheme: GoogleFonts.firaSansExtraCondensedTextTheme(),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: MyColors.colorBlack,
      // textStyle: GoogleFonts.fredokaOne(),
      textStyle: GoogleFonts.fredoka(),
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    unselectedItemColor: MyColors.colorBlack,
    selectedItemColor: MyColors.primaryColor,
  ),
  extensions: <ThemeExtension<dynamic>>[
    MyThemeExtension.myThemeExtension,
  ],
);

abstract class MyColors {
  static const activeTagColor = Color(0x40000000);
  static const colorBlack = Color(0xFF000000);
  static const colorWhite = Color(0xFFFFFFFF);
  static const error = Color(0xFFC62828);
  static const notificationColor = Color(0xFFFFFFFF);
  static const paleColor = Color(0x40000000);
  static const primaryColor = Color(0xFFDF0000);
}

abstract class AppStyle {
  static const padding = 10.0;
  static const edgeInsets = EdgeInsets.all(padding);
}

class DotSeparator extends StatelessWidget {
  const DotSeparator({
    this.style,
  });

  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text('  •  ', style: style);
  }
}

class MySpacing extends StatelessWidget {
  const MySpacing();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(width: 10, height: 10);
  }
}

class HorizontalBlackLine extends StatelessWidget {
  const HorizontalBlackLine();

  @override
  Widget build(BuildContext context) {
    return Container(height: 1, color: MyColors.colorBlack);
  }
}

class HorizontalLineSeparator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: MyColors.paleColor,
    );
  }
}

class MyPadding extends StatelessWidget {
  final Widget child;

  const MyPadding({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppStyle.edgeInsets,
      child: child,
    );
  }
}
