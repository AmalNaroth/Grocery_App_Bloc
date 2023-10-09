import 'dart:async';

import 'package:akshit_bloc/data/cart_items.dart';
import 'package:akshit_bloc/models/product_data_models.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cart_bloc_event.dart';
part 'cart_bloc_state.dart';

class CartBlocBloc extends Bloc<CartBlocEvent, CartBlocState> {
  CartBlocBloc() : super(CartBlocInitial()) {
    on<CartInititalEvent>(cartInititalEvent);
    on<CartItemRemovesEvent>(cartItemRemovesEvent);
  }

  FutureOr<void> cartInititalEvent(
      CartInititalEvent event, Emitter<CartBlocState> emit) {
    emit(
      CartSuccessState(cartItemsList: cartItemsList),
    );
  }

  FutureOr<void> cartItemRemovesEvent(
      CartItemRemovesEvent event, Emitter<CartBlocState> emit) {
    cartItemsList.remove(event.cartItemRemove);
    emit(
      CartSuccessState(cartItemsList: cartItemsList),
    );
    emit(
      CartItmeRemoveActionState(),
    );
  }
}
