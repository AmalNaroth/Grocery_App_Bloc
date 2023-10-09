// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc_bloc.dart';

@immutable
sealed class HomeBlocEvent {}

class HomeInitialEvent extends HomeBlocEvent {}

class HomeWishListButtonNavigateEvent extends HomeBlocEvent {}

class HomeCartButtonNavigateEvent extends HomeBlocEvent {}

class HomeProductWishListButtonClickEvent extends HomeBlocEvent {
  final ProductDataModel productWishlistData;

  HomeProductWishListButtonClickEvent({required this.productWishlistData});
}

class HomeProductCartButtonClickEvent extends HomeBlocEvent {
  final ProductDataModel productCartData;
  HomeProductCartButtonClickEvent({
    required this.productCartData,
  });
}