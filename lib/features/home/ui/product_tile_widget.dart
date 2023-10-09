import 'package:akshit_bloc/features/home/bloc/home_bloc_bloc.dart';
import 'package:akshit_bloc/features/home/ui/home.dart';
import 'package:akshit_bloc/models/product_data_models.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final ProductDataModel productData;
  const ProductTile({super.key, required this.productData});

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
                  homeBloc.add(HomeProductWishListButtonClickEvent(
                    productWishlistData: productData
                  ));
                },
                icon: const Icon(Icons.favorite_outline),
              ),
              IconButton(
                padding: const EdgeInsets.all(0),
                onPressed: () {
                  homeBloc.add(HomeProductCartButtonClickEvent(
                    productCartData: productData
                  ));
                },
                icon: const Icon(Icons.shopping_bag_outlined),
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
