import 'package:akshit_bloc/features/cart/bloc/cart_bloc_bloc.dart';
import 'package:akshit_bloc/features/cart/ui/cart_product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key});

  static const String cartScreen = "Cart Screen";

  @override
  State<CartScreen> createState() => _CartScreenState();
}

final CartBlocBloc cartBloc = CartBlocBloc();

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    // TODO: implement initState
    cartBloc.add(
      CartInititalEvent(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Screen"),
      ),
      body: BlocConsumer<CartBlocBloc, CartBlocState>(
        bloc: cartBloc,
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        listener: (context, state) {
          if (state is CartItmeRemoveActionState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Itme romved"),
              ),
            );
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessState:
              final cartState = state as CartSuccessState;
              return ListView.builder(
                itemCount: cartState.cartItemsList.length,
                itemBuilder: (context, index) {
                  return CartProductTile(
                      productData: cartState.cartItemsList[index]);
                },
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
