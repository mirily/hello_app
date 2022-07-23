import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello_app/models/Product.dart';
import 'package:hello_app/pages/home_page.dart';
import 'package:provider/provider.dart';

import 'models/Cart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductDataProvider>(
            create: (context) => ProductDataProvider()
        ),
        ChangeNotifierProvider<CartDataProvider>(
            create: (context) => CartDataProvider()
        ),
      ],
      child: MaterialApp(
        title: 'Demo app',
        theme: ThemeData(
          primarySwatch: Colors.amber,
          backgroundColor: Colors.white,
          textTheme: GoogleFonts.marmeladTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}