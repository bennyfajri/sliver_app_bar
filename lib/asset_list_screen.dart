import 'package:flutter/material.dart';

class AssetListScreen extends StatelessWidget {
  const AssetListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Assets List"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildListTile(
              "Erlia Abdul Hak - Unsplash",
              "https://unsplash.com/photos/brown-and-gray-concrete-building-under-blue-sky-during-daytime-_LkozG9nItM?utm_content=creditShareLink&utm_medium=referral&utm_source=unsplash",
            )
          ],
        ),
      ),
    );
  }

  ListTile buildListTile(String title, String subtitle) {
    return ListTile(
      title: SelectableText(title),
      subtitle: SelectableText(subtitle),
    );
  }
}
