import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../screens/home_screen.dart';

class NoteHeader extends StatelessWidget {
  const NoteHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
        pinned: true,
        floating: false,
        delegate: HeaderDelegat(
          maxExtent: 60,
          minExtent: 50,
          child: Row(
            children: [
              const Text('Notes'),

              const Expanded(
                flex: 1,
                child: SizedBox(width: 10),
              ),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: const Text('New note'),
              ),
              SizedBox(width: 10),

              // FilledButton(onPressed: () {}, child: const Text('Elevated')),
            ],
          ),
        ));
  }
}
