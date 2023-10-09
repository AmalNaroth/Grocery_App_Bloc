import 'package:akshit_bloc/features/cart/ui/cart_screen.dart';
import 'package:akshit_bloc/features/home/ui/home.dart';
import 'package:akshit_bloc/features/wishlist/ui/wishlist_screen.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Grocery App",
      initialRoute: HomeScreen.homeScreen,
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.homeScreen: (context) => const HomeScreen(),
        WishlistScreen.whishlistScreen :(context) =>  const WishlistScreen(),
        CartScreen.cartScreen :(context) => CartScreen()
      },
    );
  }
}
