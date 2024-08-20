import 'package:flutter/material.dart';
import 'package:sliver_app_bar/asset_list_screen.dart';
import 'package:sliver_app_bar/basic_sliver_appbar.dart';
import 'package:sliver_app_bar/change_sliver_title_color.dart';
import 'package:sliver_app_bar/pull_down_to_refresh.dart';
import 'package:sliver_app_bar/rounded_sliver_corner.dart';
import 'package:sliver_app_bar/showing_and_hiding_title.dart';
import 'package:sliver_app_bar/sliverappbar_with_appbar.dart';
import 'package:sliver_app_bar/sliverappbar_with_tabbar.dart';

import 'profile_page_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ElevatedButton buildNavigateButton(
      String title,
      Widget destination,
    ) {
      return ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return destination;
              },
            ),
          );
        },
        child: Text(title),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sliver Appbar"),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_horiz),
            itemBuilder: (context) {
            return [
              PopupMenuItem(
                value: 1,
                child: const Text("Assets List"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const AssetListScreen();
                      },
                    ),
                  );
                },
              ),
            ];
          },)
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildNavigateButton(
              "Basic Sliver Appbar",
              const BasicSliverAppBar(),
            ),
            buildNavigateButton(
              "Sliver Appbar with Appbar",
              const SliverAppBarWithAppBar(),
            ),
            buildNavigateButton(
              "Sliver Appbar with Tabbar",
              const SliverAppBarWithTabBar(),
            ),
            buildNavigateButton(
              "Pull Down to Refresh",
              const PullDownToRefresh(),
            ),
            buildNavigateButton(
              "Change Sliver Appbar Title Color",
              const ChangeSliverTitleColor(),
            ),
            buildNavigateButton(
              "Showing and Hiding Title",
              const ShowingAndHidingTitle(),
            ),
            buildNavigateButton(
              "Rounded Corners",
              const RoundedSliverCorner(),
            ),buildNavigateButton(
              "Profile Page Example",
              const ProfilePageExample(),
            ),
          ],
        ),
      ),
    );
  }
}
