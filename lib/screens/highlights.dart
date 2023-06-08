import 'package:flutter/material.dart';
import 'package:ristorante_panucci/cardapio.dart';
import 'package:ristorante_panucci/components/highlight_item.dart';

class Highlights extends StatelessWidget {
  const Highlights({super.key});

  final List items = destaques;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: CustomScrollView(
        slivers: <Widget>[
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Text(
                "Destaques",
                style: TextStyle(
                  fontFamily: "Caveat",
                  fontSize: 32,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          (MediaQuery.of(context).orientation == Orientation.landscape)
              ? _LandscapeList(items: items)
              : _PortraitList(items: items),
        ],
      ),
    );
  }
}

class _PortraitList extends StatelessWidget {
  const _PortraitList({
    // ignore: unused_element
    super.key,
    required this.items,
  });

  final List items;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return HighlightItem(
            imageURI: items[index]["image"],
            itemTitle: items[index]["name"],
            itemPrice: items[index]["price"],
            itemDescription: items[index]["description"],
          );
        },
        childCount: items.length,
      ),
    );
  }
}

class _LandscapeList extends StatelessWidget {
  const _LandscapeList({
    // ignore: unused_element
    super.key,
    required this.items,
  });

  final List items;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return HighlightItem(
            imageURI: items[index]["image"],
            itemTitle: items[index]["name"],
            itemPrice: items[index]["price"],
            itemDescription: items[index]["description"],
          );
        },
        childCount: items.length,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1,
        // childAspectRatio: 1.2,
      ),
    );
  }
}
