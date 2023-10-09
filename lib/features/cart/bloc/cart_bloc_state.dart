part of 'cart_bloc_bloc.dart';

@immutable
sealed class CartBlocState {}

sealed class CartActionState extends CartBlocState {}

final class CartBlocInitial extends CartBlocState {}

final class CartSuccessState extends CartBlocState {
  final List<ProductDataModel> cartItemsList;

  CartSuccessState({required this.cartItemsList});
}

final class CartItmeRemoveActionState extends CartActionState {}
