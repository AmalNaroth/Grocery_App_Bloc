part of 'cart_bloc_bloc.dart';

@immutable
sealed class CartBlocEvent {}

class CartInititalEvent extends CartBlocEvent {}

class CartItemRemovesEvent extends CartBlocEvent {
  final ProductDataModel cartItemRemove;
  CartItemRemovesEvent({required this.cartItemRemove});
}
