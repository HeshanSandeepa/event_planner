import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color.dart';

final class EventTheme {
  EventTheme._();

  static ThemeData getTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColor.backgroundColor,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.black,
        primary: Colors.white,
        onPrimary: Colors.white,
        error: AppColor.themeError,
        onError: Colors.white,
        surface: Colors.white,
        onSurface: Colors.black,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.black,
        selectionColor: Colors.grey,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.grey[200],
        selectedItemColor: AppColor.themeColor,
        unselectedItemColor: Colors.black,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontStyle: FontStyle.italic),
        showSelectedLabels: true,
        showUnselectedLabels: false,
        type: BottomNavigationBarType
            .fixed, // Or BottomNavigationBarType.shifting
        elevation: 8.0,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(
        const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          titleLarge: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Colors.black87,
          ),
          bodySmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w300,
            color: Colors.black54,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          // Default color for text and icon
          foregroundColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return Colors.grey; // Disabled color
              }
              return AppColor.themeColor; // Default enabled color
            },
          ),
          iconSize: WidgetStateProperty.all(22.0), // Slightly larger icon

          // Default text style
          textStyle: WidgetStateProperty.all<TextStyle>(
            const TextStyle(
              fontSize: 16,
              color: AppColor.themeColor,
              fontWeight: FontWeight.w600, // Bold text
            ),
          ),
          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          ),

          overlayColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return Colors.deepPurple.withOpacity(0.2);
              }
              if (states.contains(WidgetState.hovered)) {
                return Colors.deepPurple.withOpacity(0.1);
              }
              return null; // Defer to default splash radius/effect
            },
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(AppColor.themeColor),
          shape: WidgetStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
          ),
          elevation: WidgetStateProperty.all<double>(8),
          textStyle: WidgetStateProperty.all<TextStyle>(
            Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  overflow: TextOverflow.clip,
                ),
          ),
        ),
      ),
      iconTheme: const IconThemeData(size: 44.0),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(8),
        filled: true,
        focusColor: AppColor.themeColor,
        fillColor: AppColor.backgroundColor,
        prefixIconColor: AppColor.themeColor,
        hintStyle: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(color: Colors.black26),
        labelStyle: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(color: Colors.black45),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColor.themeError),
          borderRadius: BorderRadius.circular(4.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColor.themeError),
          borderRadius: BorderRadius.circular(4.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColor.themeColor),
          borderRadius: BorderRadius.circular(4.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black38),
          borderRadius: BorderRadius.circular(4.0),
        ),
      ),
      listTileTheme: ListTileThemeData(
        tileColor: AppColor.themeColor.withOpacity(0.1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      ),
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        surfaceTintColor: Colors.white,
        clipBehavior: Clip.hardEdge,
        color: AppColor.backgroundColor,
        elevation: 1,
      ),
      appBarTheme: AppBarTheme(
        titleSpacing: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          systemNavigationBarColor: Colors.black,
        ),
        centerTitle: false,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
      ),
      scrollbarTheme: ScrollbarThemeData(
        thumbVisibility: WidgetStateProperty.all<bool>(true),
        thumbColor: WidgetStateProperty.all<Color>(AppColor.themeColor),
      ),
    );
  }
}
