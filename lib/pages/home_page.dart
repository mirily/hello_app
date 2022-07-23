import 'package:flutter/material.dart';
import 'package:hello_app/models/Product.dart';
import 'package:hello_app/widgets/bottom_bar.dart';
import 'package:hello_app/widgets/catalog.dart';
import 'package:provider/provider.dart';

import 'package:hello_app/widgets/item_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final productData = Provider.of<ProductDataProvider>(context);

    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height - 85,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(35),
              bottomRight: Radius.circular(35),
            )
          ),
          child: ListView(
            padding: const EdgeInsets.all(10.0),
            children: [
              Container(
                child: const ListTile(
                  title: Text(
                    'Освежающие напитки',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                      'Больше чем 100 видов коктейлей',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  trailing: Icon(Icons.panorama_horizontal),
                ),
              ),

              Container(
                padding: const EdgeInsets.all(5.0),
                height: 290,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: productData.items.length,
                  itemBuilder: (context, int index) =>
                      ChangeNotifierProvider.value(
                        value: productData.items[index],
                        child: ItemCard(),
                      )
                ),
              ),
              
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text('Каталог коктейлей'),
              ),

              ...productData.items.map((value) {
                return CatalogListTile(imgUrl: value.imgUrl);
              }).toList(),
            ],
          ),
        ),
      ),

      bottomNavigationBar: const BottomBar(),

    );
  }
}
