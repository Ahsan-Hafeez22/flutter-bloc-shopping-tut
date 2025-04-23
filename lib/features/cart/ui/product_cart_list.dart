import 'package:bloc_tut/features/cart/bloc/cart_bloc.dart';
import 'package:bloc_tut/features/home/model/home_product_data_model.dart';
import 'package:flutter/material.dart';

class ProductCartListTile extends StatelessWidget {
  final CartBloc cartBloc;

  final ProductDataModel productDataModel;
  const ProductCartListTile(
      {super.key, required this.productDataModel, required this.cartBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black12,
          width: 2,
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(productDataModel.imageUrl),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(height: 2),
          Text(
            productDataModel.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 2),
          Text(productDataModel.description,
              style: TextStyle(fontWeight: FontWeight.w400)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Rs.${productDataModel.price}'),
              IconButton(
                  onPressed: () {
                    cartBloc.add(CartRemoveItemFromCartEvent(
                        clickedProduct: productDataModel));
                  },
                  icon: Icon(
                    Icons.shopping_bag,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
