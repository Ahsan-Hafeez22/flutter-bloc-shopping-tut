import 'package:bloc_tut/features/cart/bloc/cart_bloc.dart';
import 'package:bloc_tut/features/cart/ui/product_cart_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final cartBloc = CartBloc();
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text(
            'Cart Items',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
        ),
        body: BlocConsumer<CartBloc, CartState>(
          bloc: cartBloc,
          listener: (context, state) {
            if (state is CartRemoveItemFromCartActionState) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Product Removed from Cart'),
                duration: Duration(seconds: 1),
              ));
            }
          },
          listenWhen: (previous, current) => current is CartActionState,
          buildWhen: (previous, current) => current is! CartActionState,
          builder: (context, state) {
            // log(state.runtimeType.toString());
            if (state is CartSuccessState) {
              final successState = state;
              return Center(
                child: ListView.builder(
                  itemCount: successState.cartList.length,
                  itemBuilder: (context, index) {
                    return ProductCartListTile(
                        productDataModel: successState.cartList[index],
                        cartBloc: cartBloc);
                  },
                ),
              );
            } else {
              return const Center(
                child: Text('Something went wrong'),
              );
            }
          },
        ));
  }
}
