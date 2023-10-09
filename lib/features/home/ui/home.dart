import 'package:akshit_bloc/features/cart/ui/cart_screen.dart';
import 'package:akshit_bloc/features/home/bloc/home_bloc_bloc.dart';
import 'package:akshit_bloc/features/home/ui/product_tile_widget.dart';
import 'package:akshit_bloc/features/wishlist/ui/wishlist_screen.dart';
import 'package:akshit_bloc/models/product_data_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String homeScreen = "Home-Screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final HomeBlocBloc homeBloc = HomeBlocBloc();

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBlocBloc, HomeBlocState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is ActionableHomeState,
      buildWhen: (previous, current) => current is! ActionableHomeState,
      listener: (context, state) {
        if (state is HomeNavigateToWishListPageActionState) {
          Navigator.of(context).pushNamed(WishlistScreen.whishlistScreen);
        }
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.of(context).pushNamed(CartScreen.cartScreen);
        }

        if (state is HomeProductAddToCartActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Add to cart"),
            ),
          );
        }
        if (state is HomeProductAddToWishlistActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Add to wishlist"),
            ),
          );
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case HomeLoadedErrorState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              ),
            );
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
                appBar: AppBar(
                  title: const Text("Flipkart"),
                  actions: [
                    IconButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {
                        homeBloc.add(
                          HomeWishListButtonNavigateEvent(),
                        );
                      },
                      icon: const Icon(Icons.favorite_border_outlined),
                    ),
                    IconButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {
                        homeBloc.add(
                          HomeCartButtonNavigateEvent(),
                        );
                      },
                      icon: const Icon(Icons.shopping_bag_outlined),
                    )
                  ],
                ),
                body: Container(
                  child: GridView.count(
                    crossAxisCount: 2,
                    controller: ScrollController(keepScrollOffset: false),
                    childAspectRatio: 1 / 1.6,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: state.productList
                        .map(
                          (e) => ProductTile(productData: e),
                        )
                        .toList(),
                  ),
                ));
          default:
            return const SizedBox();
        }
      },
    );
  }
}
