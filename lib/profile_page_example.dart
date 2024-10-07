import 'package:flutter/material.dart';

class ProfilePageExample extends StatelessWidget {
  const ProfilePageExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: MySliverAppBar(expandedHeight: 200.0),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(
                height: 120,
              ),
              listCardWidget(text1: 'Full Name', text2: 'John Doe'),
              listCardWidget(text1: 'Gender:', text2: 'Male'),
              listCardWidget(text1: 'Marital Status:', text2: 'Single'),
              listCardWidget(text1: 'Email:', text2: 'mail@mail.com'),
              listCardWidget(text1: 'Username:', text2: 'johndoe'),
              listCardWidget(text1: 'Phone:', text2: '0812345678910'),
              listCardWidget(text1: 'Country', text2: 'Konoha'),
              listCardWidget(text1: 'City', text2: 'Konoha'),
              listCardWidget(text1: 'Pincode:', text2: '999999'),
              listCardWidget(text1: 'Company:', text2: 'Black Company'),
              listCardWidget(text1: 'Position', text2: 'Manager'),
            ]),
          )
        ],
      ),
    );
  }

  Widget listCardWidget({required String text1, required text2}) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 1.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
                fit: FlexFit.tight,
                child: Text(
                  text1,
                  style: const TextStyle(fontSize: 18),
                )),
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Text(
                text2,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  MySliverAppBar({required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        Container(
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blue,
                Colors.blue.withOpacity(0.5),
              ],
            ),
          ),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ),
        Center(
          child: Opacity(
            opacity: shrinkOffset / expandedHeight,
            child: const Text(
              'My Profile',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 23,
              ),
            ),
          ),
        ),
        Positioned(
          top: expandedHeight / 4 - shrinkOffset,
          left: 0,
          right: 0,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: Column(
              children: [
                const Text(
                  'Check out my Profile',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: SizedBox(
                    height: expandedHeight,
                    width: MediaQuery.of(context).size.width / 2,
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Image.asset(
                        'assets/76649.jpg',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
