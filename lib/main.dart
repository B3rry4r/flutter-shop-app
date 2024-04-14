import 'package:flutter/material.dart';
import 'package:shop_app/providers/cart_provider.dart';
import 'package:shop_app/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
      ],
      // create: (context) => CartProvider(),
      child: MaterialApp(
        title: 'Shopping App',
        theme: ThemeData(
            fontFamily: 'Lato',
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.yellow,
              primary: Colors.yellow,
            ),
            inputDecorationTheme: const InputDecorationTheme(
              hintStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
              // prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
            ),
            appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ),
            ),
            textTheme: const TextTheme(
              titleLarge: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 35,
              ),
              titleMedium: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30,
              ),
              titleSmall: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 25,
              ),
              bodySmall: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            )),
        home: const HomePage(),
      ),
    );
  }
}
