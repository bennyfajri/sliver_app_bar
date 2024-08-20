import 'package:flutter/material.dart';

class SliverAppBarWithTabBar extends StatefulWidget {
  const SliverAppBarWithTabBar({super.key});

  @override
  State<SliverAppBarWithTabBar> createState() => _SliverAppBarWithTabBarState();
}

class _SliverAppBarWithTabBarState extends State<SliverAppBarWithTabBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DefaultTabController(
          length: 3,
          child: NestedScrollView(
            physics: const BouncingScrollPhysics(),
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 250.0,
                  flexibleSpace: FlexibleSpaceBar(
                    title: const Text('Sumatera Barat'),
                    background: Image.asset(
                      'assets/erlia-abdul-hak-_LkozG9nItM-unsplash - RESIZED.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  //collapsedHeight: 100,
                ),
                SliverPersistentHeader(
                  floating: false,
                  pinned: true,
                  delegate: MySliverPersistentHeaderDelegate(
                    const TabBar(
                      tabs: [
                        Tab(icon: Icon(Icons.flight)),
                        Tab(icon: Icon(Icons.directions_transit)),
                        Tab(icon: Icon(Icons.directions_car)),
                      ],
                    ),
                  ),
                ),
              ];
            },
            body: const TabBarView(
              children: [
                Icon(Icons.flight, size: 350),
                Icon(Icons.directions_transit, size: 350),
                Icon(Icons.directions_car, size: 350),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  MySliverPersistentHeaderDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(MySliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
