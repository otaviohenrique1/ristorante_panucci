import 'package:flutter/material.dart';
import 'package:ristorante_panucci/cardapio.dart';
import 'package:ristorante_panucci/components/drink_item.dart';

class DrinkMenu extends StatelessWidget {
  const DrinkMenu({super.key});

  // final List<Object> items = drinks;
  final List items = drinks;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: CustomScrollView(
        slivers: <Widget>[
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Text(
                "Bebidas",
                style: TextStyle(
                  fontFamily: "Caveat",
                  fontSize: 32,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return DrinkItem(
                  imageURI: items[index]["image"],
                  itemTitle: items[index]["name"],
                  itemPrice: items[index]["price"],
                );
              },
              childCount: items.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 158 / 194,
            ),
          ),
        ],
      ),
    );
  }
}

/*
GridView.builder(
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
  ),
  itemBuilder: (context, index) {
    return DrinkItem(
      imageURI: items[index]["image"],
      itemTitle: items[index]["name"],
      itemPrice: items[index]["price"],
    );
  },
  itemCount: items.length,
)
*/
