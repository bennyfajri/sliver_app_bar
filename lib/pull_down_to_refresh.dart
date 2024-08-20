import 'package:flutter/material.dart';

class PullDownToRefresh extends StatefulWidget {
  const PullDownToRefresh({super.key});

  @override
  State<PullDownToRefresh> createState() => _PullDownToRefreshState();
}

class _PullDownToRefreshState extends State<PullDownToRefresh> {
  double expandedHeight = 250;
  bool isRefresh = false;

  Future<void> onRefresh() async {
    print("refresh trigger");
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      isRefresh = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              snap: false,
              floating: false,
              stretch: true,
              stretchTriggerOffset: 100,
              onStretchTrigger: () async {
                await onRefresh();
              },
              expandedHeight: expandedHeight,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('Sumatera Barat'),
                background: Image.asset(
                  'assets/erlia-abdul-hak-_LkozG9nItM-unsplash - RESIZED.png',
                  fit: BoxFit.cover,
                ),
                stretchModes: const [
                  StretchMode.zoomBackground,
                ],
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
      ),
    );
  }
}

