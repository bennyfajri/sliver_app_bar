import 'package:flutter/material.dart';

class SliverAppBarWithAppBar extends StatefulWidget {
  const SliverAppBarWithAppBar({super.key});

  @override
  State<SliverAppBarWithAppBar> createState() => _SliverAppBarWithAppBarState();
}

class _SliverAppBarWithAppBarState extends State<SliverAppBarWithAppBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              snap: false,
              floating: true,
              expandedHeight: 300,
              centerTitle: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/erlia-abdul-hak-_LkozG9nItM-unsplash - RESIZED.png',
                  fit: BoxFit.fitWidth,
                ),
                stretchModes: const [StretchMode.zoomBackground],
              ),
              bottom: AppBar(
                automaticallyImplyLeading: false,
                title: const TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter a search term'),
                ),
              ),
            ),
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ItemTile(itemNo: index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemTile extends StatelessWidget {
  const ItemTile({
    super.key,
    required this.itemNo,
  });

  final int itemNo;

  @override
  Widget build(BuildContext context) {
    final Color color = Colors.primaries[itemNo % Colors.primaries.length];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: () {},
        leading: Container(
          width: 50,
          height: 30,
          color: color.withOpacity(0.5),
          child: Placeholder(
            color: color,
          ),
        ),
        title: Text(
          'Product $itemNo',
          key: Key('text_$itemNo'),
        ),
      ),
    );
  }
}
