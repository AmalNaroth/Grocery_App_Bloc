import 'package:akshit_bloc/features/cart/bloc/cart_bloc_bloc.dart';
import 'package:akshit_bloc/features/cart/ui/cart_screen.dart';
import 'package:akshit_bloc/models/product_data_models.dart';
import 'package:flutter/material.dart';

class CartProductTile extends StatelessWidget {
  final ProductDataModel productData;
  const CartProductTile({super.key, required this.productData});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Text(productData.productName),
              ),
              IconButton(
                padding: const EdgeInsets.all(0),
                onPressed: () {
                  cartBloc.add(CartItemRemovesEvent(cartItemRemove: productData),);
                },
                icon: const Icon(Icons.delete),
              )
            ],
          ),
          Container(
            width: double.maxFinite,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(productData.productImageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text("\$ ${productData.price}"),
          Text(productData.productDescription)
        ],
      ),
    );
  }
}
