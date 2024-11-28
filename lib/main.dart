import 'package:flutter/material.dart';
import 'package:shop_app_flutter/widgets/cart_provider.dart';
import 'package:shop_app_flutter/pages/home_page.dart';
import 'package:provider/provider.dart';

// 18:40:XX (STACK)
// 18:55:XX (STATE MANAGEMENT SKETCH THEORY)
// 19:20:XX (STATE MANAGEMENT PRACTICAL)
// 18:55:XX (STATE MANAGEMENT)
// 19:57:XX (PROVIDER)
// 20:20:XX (MEDIA QUERY)
//! WATCH 13:34:00 ( IMPORTANT)

void main() {
  runApp(const MyApp());
}

//* Provider ( READ ONLY VALUE )
//* ChangeNotifierProvider
//* FutureProvider
//* StreamProvider

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => CartProvider())],
      // create: (context) => CartProvider(),
      child: MaterialApp(
        title: 'Shopping App',
        theme: ThemeData(
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromRGBO(254, 206, 1, 1),
              primary: const Color.fromARGB(255, 60, 69, 194)),
          appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(fontSize: 20, color: Colors.black)),
          inputDecorationTheme: const InputDecorationTheme(
              hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              prefixIconColor: Color.fromRGBO(119, 119, 119, 1)),
          textTheme: const TextTheme(
              titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
              titleMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              bodySmall: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          // useMaterial3: true,
        ),
        home: const HomePage(),
        // home: ProductDetailsPage(
        //   product: products[0],
        // ),
      ),
    );
  }
}
