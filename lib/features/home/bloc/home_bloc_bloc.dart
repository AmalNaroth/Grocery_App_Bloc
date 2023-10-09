import 'dart:async';

import 'package:akshit_bloc/data/cart_items.dart';
import 'package:akshit_bloc/data/grocery_data.dart';
import 'package:akshit_bloc/data/wishlist_items.dart';
import 'package:akshit_bloc/models/product_data_models.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBlocBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  HomeBlocBloc() : super(HomeBlocInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeWishListButtonNavigateEvent>(homeWishListButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
    on<HomeProductWishListButtonClickEvent>(
        homeProductWishListButtonClickEvent);
    on<HomeProductCartButtonClickEvent>(homeProductCartButtonClickEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeBlocState> emit) async {
    emit(
      HomeLoadingState(),
    );
    await Future.delayed(
      const Duration(seconds: 3),
    );
    try {
      final _instance = GroceryData.groceryItems
          .map(
            (e) => ProductDataModel(
              id: e['id'],
              productName: e['name'],
              productDescription: e['description'],
              productImageUrl: e['imageUrl'],
              price: e['price'],
            ),
          )
          .toList();
      emit(
        HomeLoadedSuccessState(productList: _instance),
      );
    } catch (err) {
      emit(HomeLoadedErrorState());
    }
  }

  FutureOr<void> homeWishListButtonNavigateEvent(
      HomeWishListButtonNavigateEvent event, Emitter<HomeBlocState> emit) {
    print("Home Wishlist clicked");
    emit(
      HomeNavigateToWishListPageActionState(),
    );
  }

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeBlocState> emit) {
    print("Home Cart clicked");
    emit(
      HomeNavigateToCartPageActionState(),
    );
  }

  FutureOr<void> homeProductCartButtonClickEvent(
      HomeProductCartButtonClickEvent event, Emitter<HomeBlocState> emit) {
    cartItemsList.add(event.productCartData);
    emit(
      HomeProductAddToCartActionState(),
    );
    print("add to cart");
  }

  FutureOr<void> homeProductWishListButtonClickEvent(
      HomeProductWishListButtonClickEvent event, Emitter<HomeBlocState> emit) {
    wishlistItems.add(event.productWishlistData);
    emit(
      HomeProductAddToWishlistActionState(),
    );
    print("added to wishlist");
  }
}
