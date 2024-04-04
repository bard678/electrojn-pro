import 'package:flutter/material.dart';

const Color primaryPiColor = Color(0xFFE91E63); // Lighter pink
const Color primaryPiDarkColor = Color(0xFFC2185B); // Darker pink
const Color accentPiColor = Color(0xFFF48FB1); // Light pink accent
const Color textColorPiPrimary = Colors.white; // White text for dark background
const Color textColorPiSecondary = Colors.black87;
bool isDark=false;
final ThemeData lightPinkTheme = ThemeData(
  brightness: Brightness.light,
  appBarTheme:const AppBarTheme(backgroundColor:primaryPiColor ) ,
  iconTheme: const IconThemeData(color:  primaryPiColor),
  primaryColor: primaryPiColor,
  primaryColorDark: primaryPiDarkColor,
  hintColor: accentPiColor,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: textColorPiSecondary), // Darker text for light background
  ),
  // Add other light theme customizations (icons, buttons, etc.)
);

final ThemeData darkPinkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: primaryPiColor,
  appBarTheme:const AppBarTheme(backgroundColor:primaryPiColor ) ,
  primaryColorDark: primaryPiDarkColor,
  canvasColor: const Color(0xFF212121), // Dark background
  hintColor: accentPiColor,
  iconTheme: const IconThemeData(color:  primaryPiColor),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: textColorPiPrimary), // White text for dark background
  ),
  // Add other dark theme customizations (icons, buttons, etc.)
);



const Color primaryBlColor = Color(0xFF2196F3); // Blue
const Color primaryBlDarkColor = Color(0xFF1976D2); // Darker blue
const Color accentBlColor = Color(0xFF03A9F4); // Lighter blue accent
const Color textColorBlPrimary = Colors.white; // White text for dark background
const Color textColorBlSecondary = Colors.black87; // Darker text for light background

// Theme data for both light and dark modes
final ThemeData lightBlueTheme = ThemeData(
  appBarTheme:const AppBarTheme(backgroundColor:primaryBlColor ) ,
  brightness: Brightness.light,
  primaryColor: primaryBlColor,
  primaryColorDark: primaryBlDarkColor,
  hintColor: accentBlColor,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: textColorBlSecondary), // Darker text for light background
  ),
  // Add other light theme customizations (icons, buttons, etc.)
);

final ThemeData darkBlueTheme = ThemeData(
  appBarTheme:const AppBarTheme(backgroundColor:primaryBlDarkColor ) ,
  brightness: Brightness.dark,
  primaryColor: primaryBlColor,
  primaryColorDark: primaryBlDarkColor,
  canvasColor: const Color(0xFF212121), // Dark background
  hintColor: accentBlColor,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: textColorBlSecondary), // White text for dark background
  ),
  // Add other dark theme customizations (icons, buttons, etc.)
);
const Color primaryYellowColor = Color(0xFFffc107); // Light yellow
const Color primaryDarkYellowColor = Color(0xFFff9800); // Darker yellow
const Color accentYellowColor = Color(0xFFFFD700); // Lighter yellow accent
const Color textYColorPrimary = Colors.white; // White text for dark background
const Color textYColorSecondary = Colors.black87; // Darker text for light background

// Theme data for both light and dark modes
final ThemeData lightYellowTheme = ThemeData(
  appBarTheme:const AppBarTheme(backgroundColor:primaryYellowColor) ,
  brightness: Brightness.light,
  primaryColor: primaryYellowColor,
  primaryColorDark: primaryDarkYellowColor,
  hintColor: accentYellowColor,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: textYColorSecondary), // Darker text for light background
  ),
  // Add other light theme customizations (icons, buttons, etc.)
);

final ThemeData darkYellowTheme = ThemeData(
  appBarTheme:const AppBarTheme(backgroundColor:primaryDarkYellowColor) ,
  brightness: Brightness.dark,
  primaryColor: primaryYellowColor,
  primaryColorDark: primaryDarkYellowColor,
  canvasColor: const Color(0xFF212121), // Dark background
  hintColor: accentYellowColor,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: textYColorPrimary), // White text for dark background
  ),
  // Add other dark theme customizations (icons, buttons, etc.)
);
const Color primaryGreenColor = Color(0xFF4CAF50); // Light green
const Color primaryDarkGreenColor = Color(0xFF388E3C); // Darker green
const Color accentGreenColor = Color(0xFF8BC34A); // Lighter green accent
const Color textGColorPrimary = Colors.white; // White text for dark background
const Color textGColorSecondary = Colors.black87; // Darker text for light background

// Theme data for both light and dark modes
final ThemeData lightGreenTheme = ThemeData(
  appBarTheme:const AppBarTheme(backgroundColor:primaryGreenColor ) ,
  brightness: Brightness.light,
  primaryColor: primaryGreenColor,
  primaryColorDark: primaryDarkGreenColor,
  hintColor: accentGreenColor,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: textGColorSecondary), // Darker text for light background
  ),
  // Add other light theme customizations (icons, buttons, etc.)
);

final ThemeData darkGreenTheme = ThemeData(
  appBarTheme:const AppBarTheme(backgroundColor:primaryDarkGreenColor ) ,
  brightness: Brightness.dark,
  primaryColor: primaryGreenColor,
  primaryColorDark: primaryDarkGreenColor,
  canvasColor: const Color(0xFF212121), // Dark background
  hintColor: accentGreenColor,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: textGColorPrimary), // White text for dark background
  ),
  // Add other dark theme customizations (icons, buttons, etc.)
);
List<ThemeData> darkThemeData=[darkGreenTheme,darkYellowTheme,darkBlueTheme,darkPinkTheme,darkPinkTheme];
List<ThemeData> lightThemeData=[lightGreenTheme,lightYellowTheme,lightBlueTheme,lightPinkTheme,lightPinkTheme,lightPinkTheme];