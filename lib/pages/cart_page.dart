import 'package:flutter/material.dart';
import 'package:hello_app/models/Cart.dart';
import 'package:hello_app/widgets/cart_list_item.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final cartData = Provider.of<CartDataProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Корзина'),
      ),
      body: cartData.cartItems.isEmpty
        ? Card(
        elevation: 5.0,
        margin: const EdgeInsets.all(30.0),
        child: Container(
          width: double.infinity,
          height: 100,
          alignment: Alignment.center,
          child: const Text('Корзина пуста'),
        ),
      )
      : Column(
        children: [
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Стоимость ${cartData.totalAmount.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 20.0,
                ),
              ),
              MaterialButton(
                onPressed: () {
                  cartData.clear();
                },
                color: Theme.of(context).primaryColor,
                child: const Text('Купить'),
              ),
            ],
          ),
          Divider(),

          Expanded(child: CartListItem(cartData: cartData)),
        ],
      ),
    );
  }
}
