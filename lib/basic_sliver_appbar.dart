import 'package:flutter/material.dart';

class BasicSliverAppBar extends StatelessWidget {
  const BasicSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Sumatera Barat'),
              background: Image.asset(
                'assets/erlia-abdul-hak-_LkozG9nItM-unsplash - RESIZED.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) {
                return ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    width: 100,
                    child: const Placeholder(),
                  ),
                  title: Text('Place ${index + 1}'),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
