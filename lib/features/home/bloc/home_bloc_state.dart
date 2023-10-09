// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc_bloc.dart';

@immutable
sealed class HomeBlocState {}

sealed class ActionableHomeState extends HomeBlocState {}

final class HomeBlocInitial extends HomeBlocState {}

class HomeLoadingState extends HomeBlocState {}

class HomeLoadedSuccessState extends HomeBlocState {
  final List<ProductDataModel> productList;
  HomeLoadedSuccessState({
    required this.productList,
  });
}

class HomeLoadedErrorState extends HomeBlocState {}

class HomeNavigateToWishListPageActionState extends ActionableHomeState {}

class HomeNavigateToCartPageActionState extends ActionableHomeState {}

class HomeProductAddToCartActionState extends ActionableHomeState{}

class HomeProductAddToWishlistActionState extends ActionableHomeState{}
