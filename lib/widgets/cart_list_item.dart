import 'package:flutter/material.dart';
import 'package:hello_app/models/Cart.dart';
import 'package:hello_app/widgets/cart_item.dart';
import 'package:provider/provider.dart';

class CartListItem extends StatelessWidget {
  final cartData;
  const CartListItem({Key? key, this.cartData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: cartData.cartItemsCount,
        itemBuilder: (context, index) {
          return Dismissible(
            key: ValueKey(cartData.cartItems.keys.toList()[index]),
            background: Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              padding: const EdgeInsets.only(right: 10.0),
              child: const Icon(
                Icons.delete,
                color: Colors.redAccent,
                size: 30.0,
              ),
            ),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) =>
              Provider.of<CartDataProvider>(context, listen: false)
                .deleteItem(cartData.cartItems.keys.toList()[index]),
            child: CartItem(cartData: cartData, index: index),
          );
        },
      ),
    );
  }
}


