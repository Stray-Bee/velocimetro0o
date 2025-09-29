import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:velocimetro/viewmodels/viagem_viewmodel.dart';
import 'views/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Orientação retrato
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Barra de status transparente
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ViagemViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Velocímetro & Hodômetro',
        themeMode: ThemeMode.system,
        theme: ThemeData(
          brightness: Brightness.light,
          scaffoldBackgroundColor: const Color(0xFFFCE4EC), // Rosa claro
          primaryColor: const Color(0xFFF8BBD0),
          fontFamily: 'Quicksand',
          textTheme: const TextTheme(
            titleLarge: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.purple),
            bodyMedium: TextStyle(fontSize: 16, color: Colors.black87),
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFFF8BBD0),
            elevation: 0,
            foregroundColor: Colors.white,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF48FB1),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Colors.black,
          fontFamily: 'Quicksand',
          textTheme: const TextTheme(
            titleLarge: TextStyle(
                fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white),
            bodyMedium: TextStyle(fontSize: 16, color: Colors.white70),
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.purple.shade700,
            elevation: 0,
            foregroundColor: Colors.white,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple.shade600,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
