import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart' as prov;
import 'screens/splash_screen.dart';
import 'screens/main_screen.dart';
import 'screens/counter_screen.dart';
import 'screens/shopping_cart_screen.dart';
import 'screens/todo_screen.dart';
import 'providers/cart_provider.dart';

void main() {
  runApp(
    ProviderScope(
      child: prov.MultiProvider(
        providers: [
          prov.ChangeNotifierProvider(create: (_) => CartProvider()),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MODULE-5',
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        '/main': (context) => const MainScreen(),
        '/counter': (context) => const CounterScreen(),
        '/shopping_cart': (context) => const ShoppingCartScreen(),
        '/todo': (context) => const TodoScreen(),
      },
    );
  }
}
