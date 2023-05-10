import 'package:flutter/material.dart';

import '../screens/home_screen.dart';

class CheckHeader extends StatelessWidget {
  const CheckHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      floating: false,
      delegate: HeaderDelegat(
        maxExtent: 50,
        minExtent: 30,
        child: Row(
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('Check List'),
            ),
            Expanded(child: SizedBox()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('Nev CheckList'),
            ),
          ],
        ),
      ),
    );
  }
}
