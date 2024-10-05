import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uwunotes/provider/note_provider.dart';
import 'package:uwunotes/provider/theme_provider.dart';
import 'package:uwunotes/screens/home_screen.dart';
import 'package:uwunotes/themes/custom_themes.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
        ChangeNotifierProvider<NoteProvider>(create: (_) => NoteProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Uwunotes',
          themeMode:
              themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          theme: CustomThemes.lightThemeData,
          darkTheme: CustomThemes.darkThemeData,
          home: const HomeScreen(),
        );
      },
    );
  }
}
