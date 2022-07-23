import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello_app/models/Cart.dart';
import 'package:hello_app/models/Product.dart';
import 'package:hello_app/pages/cart_page.dart';
import 'package:provider/provider.dart';

class ItemPage extends StatelessWidget {
  final String productId;
  const ItemPage({Key? key, required this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final data = Provider.of<ProductDataProvider>(context).getElementById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          data.title,
          style: GoogleFonts.marmelad(),
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            Hero(
              tag: data.imgUrl,
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(data.imgUrl),
                    fit: BoxFit.cover,
                  )
                ),
              ),
            ),
            Card(
              elevation: 5.0,
              margin: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 10.0),
              child: Container(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Text(
                      data.title,
                      style: const TextStyle(
                        fontSize: 26.0,
                      ),
                    ),
                    Divider(),
                    Row(
                      children: [
                        const Text('Цена: ', style: TextStyle(fontSize: 24),),
                        Text('${data.price}', style: const TextStyle(fontSize: 24),),
                      ],
                    ),
                    Divider(),
                    Text(data.desc),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Provider.of<CartDataProvider>(context)
                      .cartItems.containsKey(productId)
                    ? Column(
                      children: [
                        MaterialButton(
                          color: const Color(0xFFCCFF90),
                          child: const Text('Перейти в корзину'),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const CartPage(),
                              )
                            );
                          },
                        ),
                        const Text(
                          'Товар уже добавлен в корзину',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.blueGrey,
                          ),
                        )
                      ],
                    )
                    : MaterialButton(
                        color: Theme.of(context).primaryColor,
                        child: Text('Добавить в корзину'),
                        onPressed: () {
                          Provider.of<CartDataProvider>(context, listen: false)
                            .addItem(
                              productId: data.id,
                              imgUrl: data.imgUrl,
                              title: data.title,
                              price: data.price,
                            );
                        }
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
