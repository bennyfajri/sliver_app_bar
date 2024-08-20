import 'dart:math';

import 'package:flutter/material.dart';

class ChangeSliverTitleColor extends StatefulWidget {
  const ChangeSliverTitleColor({super.key});

  @override
  State<ChangeSliverTitleColor> createState() => _ChangeSliverTitleColorState();
}

class _ChangeSliverTitleColorState extends State<ChangeSliverTitleColor> {
  late ScrollController _scrollController;
  Color _textColor = Colors.white;
  static const kExpandedHeight = 200.0;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _textColor = _isSliverAppBarExpanded ? Colors.black87 : Colors.white;
        });
      });
  }

  bool get _isSliverAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > kExpandedHeight - (kToolbarHeight * 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: kExpandedHeight,
            // show and hide FlexibleSpaceBar title
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                'Sumatera Barat',
                style: TextStyle(
                  color: _textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              background: Image.asset(
                'assets/erlia-abdul-hak-_LkozG9nItM-unsplash - RESIZED.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) {
                final color = Colors.primaries[index % Colors.primaries.length];
                return ListTile(
                  leading: Container(
                    margin: const EdgeInsets.all(8.0),
                    color: color,
                    padding: const EdgeInsets.all(8),
                    width: 100,
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
